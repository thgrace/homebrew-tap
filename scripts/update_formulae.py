#!/usr/bin/env python3
import datetime as dt
import hashlib
import json
import os
import re
import sys
import urllib.error
import urllib.parse
import urllib.request
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
FORMULA = ROOT / "Formula"


def is_github_host(url: str) -> bool:
    host = urllib.parse.urlparse(url).hostname
    return host == "github.com" or (host is not None and host.endswith(".github.com"))


def request(url: str, *, accept: str | None = None) -> bytes:
    headers = {"User-Agent": "thgrace-homebrew-tap-updater"}
    token = os.environ.get("GITHUB_TOKEN")
    if token and is_github_host(url):
        headers["Authorization"] = f"Bearer {token}"
    if accept:
        headers["Accept"] = accept
    req = urllib.request.Request(url, headers=headers)
    try:
        with urllib.request.urlopen(req, timeout=60) as response:
            return response.read()
    except urllib.error.HTTPError as err:
        body = err.read().decode("utf-8", errors="replace")
        raise RuntimeError(f"HTTP {err.code} fetching {url}: {body}") from err


def github_json(path: str) -> dict:
    data = request(
        f"https://api.github.com/{path}",
        accept="application/vnd.github+json",
    )
    return json.loads(data)


def sha256_url(url: str) -> str:
    h = hashlib.sha256()
    h.update(request(url))
    return h.hexdigest()


def write_if_changed(path: Path, content: str) -> bool:
    old = path.read_text() if path.exists() else None
    if old == content:
        return False
    path.write_text(content)
    return True


def semver(version: str) -> tuple[int, int, int]:
    match = re.fullmatch(r"(\d+)\.(\d+)\.(\d+)", version)
    if not match:
        raise RuntimeError(f"expected X.Y.Z version, got {version!r}")
    return tuple(int(part) for part in match.groups())


def current_redis_version() -> str:
    formula = (FORMULA / "redis-cli.rb").read_text()
    match = re.search(r"redis-(\d+\.\d+\.\d+)\.tar\.gz", formula)
    if not match:
        raise RuntimeError("could not read current redis-cli version")
    return match.group(1)


def redis_formula(version: str, sha256: str) -> str:
    return f'''class RedisCli < Formula
  desc "Redis command-line interface client only"
  homepage "https://github.com/thgrace/homebrew-tap"
  url "https://download.redis.io/releases/redis-{version}.tar.gz"
  sha256 "{sha256}"
  license all_of: [
    "AGPL-3.0-only",
    "BSD-2-Clause",
    "BSL-1.0",
    "MIT",
    any_of: ["CC0-1.0", "BSD-2-Clause"],
  ]

  depends_on "openssl@3"

  conflicts_with "redis", because: "redis already includes redis-cli"

  def install
    system "make", "redis-cli", "BUILD_TLS=yes", "CC=#{{ENV.cc}}"
    bin.install "src/redis-cli"
  end

  test do
    system bin/"redis-cli", "--version"
  end
end
'''


def update_redis() -> bool:
    current = current_redis_version()
    latest = github_json("repos/redis/redis/releases/latest").get("tag_name")
    match = re.fullmatch(r"v?(\d+\.\d+\.\d+)", latest or "")
    if not match:
        raise RuntimeError(f"unexpected Redis latest tag: {latest!r}")
    latest = match.group(1)
    if semver(latest) < semver(current):
        print(f"redis-cli: latest {latest} is older than current {current}; skipping")
        return False
    if latest == current:
        print(f"redis-cli: already at {current}")
        return False

    url = f"https://download.redis.io/releases/redis-{latest}.tar.gz"
    checksum = sha256_url(url)
    changed = write_if_changed(FORMULA / "redis-cli.rb", redis_formula(latest, checksum))
    if changed:
        print(f"redis-cli: updated {current} -> {latest}")
    return changed


def current_opengrep_version() -> str:
    formula = (FORMULA / "opengrep.rb").read_text()
    match = re.search(r'version "([^"]+)"', formula)
    if not match:
        raise RuntimeError("could not read current opengrep version")
    return match.group(1)


def opengrep_formula(version: str, checksums: dict[str, str]) -> str:
    return f'''class Opengrep < Formula
  desc "Static code analysis engine to find security issues in code"
  homepage "https://github.com/opengrep/opengrep"
  version "{version}"
  license "LGPL-2.1-only"

  on_macos do
    on_arm do
      url "https://github.com/opengrep/opengrep/releases/download/v#{{version}}/opengrep_osx_arm64"
      sha256 "{checksums["opengrep_osx_arm64"]}"
    end
    on_intel do
      url "https://github.com/opengrep/opengrep/releases/download/v#{{version}}/opengrep_osx_x86"
      sha256 "{checksums["opengrep_osx_x86"]}"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opengrep/opengrep/releases/download/v#{{version}}/opengrep_manylinux_aarch64"
      sha256 "{checksums["opengrep_manylinux_aarch64"]}"
    end
    on_intel do
      url "https://github.com/opengrep/opengrep/releases/download/v#{{version}}/opengrep_manylinux_x86"
      sha256 "{checksums["opengrep_manylinux_x86"]}"
    end
  end

  def install
    bin.install Dir["*"].first => "opengrep"
  end

  test do
    (testpath/".config").mkpath
    (testpath/".cache").mkpath
    assert_match version.to_s, shell_output("#{{bin}}/opengrep --version")
  end
end
'''


def update_opengrep() -> bool:
    current = current_opengrep_version()
    release = github_json("repos/opengrep/opengrep/releases/latest")
    tag = release.get("tag_name")
    match = re.fullmatch(r"v(\d+\.\d+\.\d+)", tag or "")
    if not match:
        raise RuntimeError(f"unexpected Opengrep latest tag: {tag!r}")
    latest = match.group(1)
    if semver(latest) < semver(current):
        print(f"opengrep: latest {latest} is older than current {current}; skipping")
        return False
    if latest == current:
        print(f"opengrep: already at {current}")
        return False

    assets = {asset["name"]: asset["browser_download_url"] for asset in release.get("assets", [])}
    required = [
        "opengrep_osx_arm64",
        "opengrep_osx_x86",
        "opengrep_manylinux_aarch64",
        "opengrep_manylinux_x86",
    ]
    missing = [name for name in required if name not in assets]
    if missing:
        raise RuntimeError(f"Opengrep release {tag} is missing assets: {', '.join(missing)}")

    checksums = {name: sha256_url(assets[name]) for name in required}
    changed = write_if_changed(FORMULA / "opengrep.rb", opengrep_formula(latest, checksums))
    if changed:
        print(f"opengrep: updated {current} -> {latest}")
    return changed


def current_oss_rebuild_sha() -> str:
    formula = (FORMULA / "oss-rebuild.rb").read_text()
    match = re.search(r"oss-rebuild/archive/([0-9a-f]{40})\.tar\.gz", formula)
    if not match:
        raise RuntimeError("could not read current oss-rebuild commit")
    return match.group(1)


def oss_rebuild_formula(sha: str, committed_at: str, checksum: str) -> str:
    date = dt.datetime.fromisoformat(committed_at.replace("Z", "+00:00")).date()
    version = f"{date:%Y.%m.%d}-{sha[:7]}"
    return f'''class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/{sha}.tar.gz"
  version "{version}"
  sha256 "{checksum}"
  license "Apache-2.0"
  head "https://github.com/google/oss-rebuild.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"oss-rebuild"), "./cmd/oss-rebuild"
  end

  test do
    system bin/"oss-rebuild", "--help"
  end
end
'''


def update_oss_rebuild() -> bool:
    current = current_oss_rebuild_sha()
    commit = github_json("repos/google/oss-rebuild/commits/main")
    latest = commit.get("sha")
    if not latest or not re.fullmatch(r"[0-9a-f]{40}", latest):
        raise RuntimeError(f"unexpected oss-rebuild main commit: {latest!r}")
    if latest == current:
        print(f"oss-rebuild: already at {current[:7]}")
        return False

    committed_at = commit["commit"]["committer"]["date"]
    url = f"https://github.com/google/oss-rebuild/archive/{latest}.tar.gz"
    checksum = sha256_url(url)
    changed = write_if_changed(FORMULA / "oss-rebuild.rb", oss_rebuild_formula(latest, committed_at, checksum))
    if changed:
        print(f"oss-rebuild: updated {current[:7]} -> {latest[:7]}")
    return changed


def current_container_version() -> str:
    formula = (FORMULA / "container.rb").read_text()
    match = re.search(r"apple/container/releases/download/([^/]+)/container-", formula)
    if not match:
        raise RuntimeError("could not read current container version")
    return match.group(1)


def container_formula(version: str, checksum: str) -> str:
    return f'''class Container < Formula
  desc "Create and run Linux containers using lightweight virtual machines on Mac"
  homepage "https://github.com/apple/container"
  url "https://github.com/apple/container/releases/download/{version}/container-{version}-installer-signed.pkg",
      using: :nounzip
  sha256 "{checksum}"
  license "Apache-2.0"
  head "https://github.com/apple/container.git", branch: "main"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  def install
    system "pkgutil", "--expand-full", cached_download, "pkg"

    (libexec/"root").install Dir["pkg/Payload/*"]
    bin.write_exec_script libexec/"root/bin/container"
  end

  def caveats
    <<~EOS
      container requires macOS 26 and Apple silicon.

      Start the system service with:
        container system start
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{{bin}}/container --version")
  end
end
'''


def update_container() -> bool:
    current = current_container_version()
    release = github_json("repos/apple/container/releases/latest")
    latest = release.get("tag_name")
    if not latest or not re.fullmatch(r"\d+\.\d+\.\d+", latest):
        raise RuntimeError(f"unexpected container latest tag: {latest!r}")
    if semver(latest) < semver(current):
        print(f"container: latest {latest} is older than current {current}; skipping")
        return False
    if latest == current:
        print(f"container: already at {current}")
        return False

    asset_name = f"container-{latest}-installer-signed.pkg"
    assets = {asset["name"]: asset for asset in release.get("assets", [])}
    asset = assets.get(asset_name)
    if not asset:
        raise RuntimeError(f"container release {latest} is missing asset: {asset_name}")

    digest = asset.get("digest", "")
    if digest.startswith("sha256:"):
        checksum = digest.removeprefix("sha256:")
    else:
        checksum = sha256_url(asset["browser_download_url"])

    changed = write_if_changed(FORMULA / "container.rb", container_formula(latest, checksum))
    if changed:
        print(f"container: updated {current} -> {latest}")
    return changed


def main() -> int:
    changed = [
        update_redis(),
        update_opengrep(),
        update_oss_rebuild(),
        update_container(),
    ]
    if any(changed):
        print("formulae updated")
    else:
        print("all formulae already current")
    return 0


if __name__ == "__main__":
    sys.exit(main())

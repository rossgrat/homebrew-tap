#!/usr/bin/env bash
# Point a formula at the latest GitHub release of its tool.
set -euo pipefail

tool="${1:?usage: bump.sh <tool>}"
repo="rossgrat/${tool}"
formula="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/Formula/${tool}.rb"
[[ -f "${formula}" ]] || {
  echo "no formula at ${formula}" >&2
  exit 1
}

tag="$(gh release view -R "${repo}" --json tagName --jq .tagName)"

tmp="$(mktemp -d)"
trap 'rm -rf "${tmp}"' EXIT
gh release download -R "${repo}" "${tag}" --pattern checksums.txt --dir "${tmp}"

for platform in darwin_arm64 darwin_amd64 linux_arm64 linux_amd64
do
  archive="${tool}_${tag}_${platform}.tar.gz"
  awk -v f="${archive}" '$2 == f { found = 1 } END { exit !found }' "${tmp}/checksums.txt" ||
    {
      echo "release ${tag} has no checksum for ${archive}" >&2
      exit 1
    }
done

awk -v tool="${tool}" -v repo="${repo}" -v tag="${tag}" -v sums="${tmp}/checksums.txt" '
  BEGIN {
    while ((getline line < sums) > 0) {
      split(line, f, /[ \t]+/)
      sha[f[2]] = f[1]
    }
  }
  match($0, /(darwin|linux)_(arm64|amd64)/) {
    platform = substr($0, RSTART, RLENGTH)
    archive = tool "_" tag "_" platform ".tar.gz"
    indent = $0; sub(/[^ ].*/, "", indent)
    print indent "url \"https://github.com/" repo "/releases/download/" tag "/" archive "\""
    pending = archive
    next
  }
  /^ *sha256 "/ && pending != "" {
    indent = $0; sub(/[^ ].*/, "", indent)
    print indent "sha256 \"" sha[pending] "\""
    pending = ""
    next
  }
  { print }
' "${formula}" >"${formula}.new"

mv "${formula}.new" "${formula}"
echo "${tool} -> ${tag}"

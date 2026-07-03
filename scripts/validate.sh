#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

required_paths=(
  "AGENTS.md"
  "README.md"
  "readme.md"
  "repo-state.md"
  "docs/index.md"
  "docs/validation.md"
  ".devstudio/project.yaml"
  ".github/workflows/ci.yml"
  "Makefile"
  "ao.h"
  "main.c"
  "argparse/argparse.h"
  "imgui/imgui.h"
  "win32_utf8/src/win32_utf8.h"
)

for path in "${required_paths[@]}"; do
  if [[ ! -e "$path" ]]; then
    echo "Missing required path: $path" >&2
    if [[ "$path" == argparse/* || "$path" == imgui/* || "$path" == win32_utf8/* ]]; then
      echo "Run: git submodule update --init --recursive" >&2
    fi
    exit 1
  fi
done

OSTYPE=linux NOGUI=1 CFLAGS="-fcommon -Wno-implicit-function-declaration" make

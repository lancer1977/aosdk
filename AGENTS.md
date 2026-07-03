# AGENTS.md

## Purpose

This repository contains the Audio Overload SDK engines and command-line player
for console music formats.

## Workflow

- Read `readme.md`, `docs/README.md`, and `repo-state.md` before changing files.
- Keep submodules initialized before native build work.
- Prefer the non-GUI Linux validation path for portable CI.
- Treat GUI builds as optional GLFW/pkg-config work.

## Validation

Run the repo-native validation script:

```bash
./scripts/validate.sh
```

The script builds the non-GUI Linux target with compatibility flags needed by
modern GCC for this legacy C codebase.

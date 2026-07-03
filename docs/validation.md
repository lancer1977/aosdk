# Validation

## Command

Run the root validation wrapper:

```bash
./scripts/validate.sh
```

The wrapper verifies required submodules are initialized, removes stale build
objects, then builds the non-GUI Linux target:

```bash
OSTYPE=linux NOGUI=1 make clean
OSTYPE=linux NOGUI=1 CFLAGS="-fcommon -Wno-implicit-function-declaration" make
```

## Why The Flags Are Required

This is a legacy C codebase. Modern GCC defaults surface two old-code issues:

- implicit function declarations are rejected during compilation.
- tentative global definitions no longer link as common symbols by default.

`-Wno-implicit-function-declaration` and `-fcommon` preserve the historical build
behavior without changing source code in this stewardship slice.

## Submodules

The build requires these submodules:

- `argparse`
- `imgui`
- `win32_utf8`

Initialize them before local validation:

```bash
git submodule update --init --recursive
```

CI uses recursive submodule checkout.

## Optional GUI Build

The default GUI build requires `pkg-config` and GLFW 3 development files. The
repo-health validation path intentionally uses `NOGUI=1` so it can run on a
plain Linux build host without GUI dependencies.

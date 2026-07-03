# aosdk Repo State

Last reviewed: 2026-07-03

## Purpose

`aosdk` is the Audio Overload SDK, exposing music engines for formats such as
DSF, SSF, QSF, PSF, PSF2, and SPU.

## Current State

- Main native build file: `Makefile`.
- Public API: `ao.h`.
- Command-line entry point: `main.c`.
- Engine implementations live under `eng_dsf/`, `eng_ssf/`, `eng_qsf/`, and
  `eng_psf/`.
- Bundled zlib sources live under `zlib/`.
- Required submodules: `argparse`, `imgui`, and `win32_utf8`.

## Native Validation

```bash
./scripts/validate.sh
```

The current validation path builds the Linux non-GUI target with compatibility
flags for modern GCC.

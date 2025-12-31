# MinGW TEK environment
[![Discord](https://img.shields.io/discord/937821572285206659?style=flat-square&label=Discord&logo=discord&logoColor=white&color=7289DA)](https://discord.gg/JBUgcwvpfc)

This repository contains the script to set up TEK-X86_64 environment for [MSYS2](https://msys2.org).

TEK-X86_64 is derived from MSYS2's CLANG64, that is it's also based on LLVM toolchain and UCRT, but it has default compiler flags tuned for less hardening and more optimizations, e.g. LTO being enabled by default, disabled in individual packages that are broken by it

The environment uses its own [package repository](https://github.com/teknology-hub/MINGW-packages) made for it

## Setting up

Run the following in MSYS2 shell:
```bash
pacman -S git
git clone https://github.com/teknology-hub/MinGW-env.git
MinGW-env/setup.sh
pacman -Sy
```
After that you can run the TEK-X86_64 shell via tek-x86_64.exe created in MSYS2's root directory, and install mingw-w64-tek-x86_64- packages

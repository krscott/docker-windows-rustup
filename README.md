# docker-windows-rustup
Boilerplate for building a Rust program in a Windows Docker container

## Quick Start
Add project files to `src/` and update cargo files.

Optionally change `Dockerfile` to switch to a different version of rust.

From a bash environment, run `build.sh`. Or, execute the docker commands manually.

The binary will be copied into `target/` in the host's project directory.

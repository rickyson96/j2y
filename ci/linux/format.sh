#!/bin/bash
set -eu

export PATH="~/.cargo/bin:$PATH"

if command -v rustfmt >/dev/null; then
    rustup run stable-x86_64-unknown-linux-gnu rustfmt --version
else
    cargo +nightly-x86_64-unknown-linux-gnu install rustfmt-nightly --force
fi

cargo +stable-x86_64-unknown-linux-gnu fmt -- --write-mode diff

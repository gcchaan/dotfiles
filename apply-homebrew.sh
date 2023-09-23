#!/bin/bash

set -eu

if [[ "$(uname)" = 'Darwin' ]]; then
    setup_homebrew
fi

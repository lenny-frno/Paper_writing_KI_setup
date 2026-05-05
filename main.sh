#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

run_step() {
    local name="$1"
    local dir="$2"
    local script="$3"

    echo "--- start $name ---"
    date

    cd "$SCRIPT_DIR/$dir"
    bash "$script"

    echo "--- done $name ---"
    echo
}

sudo apt update

run_step "setup_standard_libraries" "setup_standard_libraries" "setup_standard_libraries.sh"
run_step "setup_nvm_npm" "setup_nvm_npm" "setup_nvm_npm.sh"
run_step "setup_bash" "setup_bash" "setup_bash.sh"
run_step "setup_python" "setup_python" "python_dev_setup.sh"
run_step "setup_latex" "setup_latex" "setup_latex.sh"

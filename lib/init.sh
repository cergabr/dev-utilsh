#!/usr/bin/env bash
# Load all library components or expose functions

# Source the utilities
source "${BASH_SOURCE%/*}/../package.sh"
source "${BASH_SOURCE%/*}/colors.sh"
source "${BASH_SOURCE%/*}/logging.sh"
source "${BASH_SOURCE%/*}/test.sh"
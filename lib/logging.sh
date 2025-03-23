#!/usr/bin/env bash
# Logging utilities for shell scripts

# Make sure colors are loaded
if [[ -z "$GREEN" ]]; then
  source "${BASH_SOURCE%/*}/colors.sh"
fi

# Print a header with color
utilsh::print_header() {
    echo -e "\n${GREEN}=== $1 ===${NC}"
}

# Print an info message
utilsh::print_info() {
    echo -e "${GREEN}$1${NC}"
}

# Print a warning message
utilsh::print_warning() {
    echo -e "${YELLOW}$1${NC}"
}

# Print an error message
utilsh::print_error() {
    echo -e "${RED}$1${NC}"
}
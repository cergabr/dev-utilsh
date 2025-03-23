#!/usr/bin/env bash
# Logging utilities for shell scripts

# Make sure colors are loaded
if [[ -z "$GREEN" ]]; then
  source "${BASH_SOURCE%/*}/colors.sh"
fi

# Print a header with color
utilsh::print_header() {
    local color="$2"
    if [[ -z "$color" ]]; then
        color="$CYAN_BOLD"
    fi
    echo -e "\n${color}=== $1 ===${NC}"
}

# Print an info message
utilsh::print_info() {
    local color="$2"
    if [[ -z "$color" ]]; then
        color="$GREEN"
    fi
    echo -e "${color}$1${NC}"
}

# Print a warning message
utilsh::print_warning() {
    local color="$2"
    if [[ -z "$color" ]]; then
        color="$YELLOW"
    fi
    echo -e "${color}$1${NC}"
}

# Print an error message
utilsh::print_error() {
    local color="$2"
    if [[ -z "$color" ]]; then
        color="$RED"
    fi
    echo -e "${color}$1${NC}"
}

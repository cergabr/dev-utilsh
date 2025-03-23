# dev-utilsh

A collection of shell utilities for developers.

## Installation

### Using Basher

If you have [Basher](https://github.com/basherpm/basher) installed:

```bash
basher install cergabr/dev-utilsh
```

### Manual Installation

Clone this repository and add it to your path:

```bash
git clone https://github.com/cergabr/dev-utilsh.git
export PATH="$PATH:/path/to/dev-utilsh/bin"
```

## Usage

The utilities include:

- Colored output functions
- Logging functions

### Command Line Usage

```bash
# Print a header
utilsh header "Starting Process"

# Print an info message
utilsh info "Processing files..."

# Print a warning message
utilsh warning "Some files may be missing"

# Print an error message
utilsh error "Error: Could not complete task"

# Display version
utilsh version
```

### Using in Your Scripts

```bash
# Using absolute path
source /path/to/dev-utilsh/lib/init.sh
# Using basher
source "$(basher package-path username/dev-utilsh)/lib/init.sh"

utilsh::print_header "Starting Process"
utilsh::print_info "Processing files..."
utilsh::print_warning "Some files may be missing"
utilsh::print_error "Error: Could not complete task"
```

## Development

When running shellcheck on scripts in this project, use the `-x` flag to follow sourced files:

```bash
shellcheck -x lib/*.sh
```

## License

MIT

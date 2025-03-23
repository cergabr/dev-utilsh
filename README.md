# dev-utilsh

A collection of shell utilities for developers.

## Installation

Clone this repository and add it to your path:

```bash
git clone https://github.com/username/dev-utilsh.git
export PATH="$PATH:/path/to/dev-utilsh/bin"
```

## Usage

The utilities include:

- Colored output functions
- Logging functions

### Example

```bash
source /path/to/dev-utilsh/lib/init.sh

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

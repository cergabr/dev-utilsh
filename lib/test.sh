# Test a message with a specific color interactively

utilsh::test::color() {
  # Arrays of available methods and colors
  local methods=("header" "info" "warning" "error" "debug")
  local colors=("BLACK" "RED" "GREEN" "YELLOW" "BLUE" "MAGENTA" "CYAN" "WHITE")
  local bold_colors=("BLACK_BOLD" "RED_BOLD" "GREEN_BOLD" "YELLOW_BOLD" "BLUE_BOLD" "MAGENTA_BOLD" "CYAN_BOLD" "WHITE_BOLD")
  
  # If arguments are provided, use them
  if [[ -n "$1" && -n "$2" ]]; then
    local method="$1"
    local color_name="$2"
    _apply_test_color "$method" "$color_name"
    return
  fi
  
  # Interactive selection
  echo "Select a method:"
  select method in "${methods[@]}"; do
    if [[ -n "$method" ]]; then
      break
    else
      echo "Invalid selection. Please try again."
    fi
  done
  
  echo "Select a color category:"
  select category in "Regular Colors" "Bold Colors"; do
    if [[ "$category" == "Regular Colors" ]]; then
      echo "Select a color:"
      select color_name in "${colors[@]}"; do
        if [[ -n "$color_name" ]]; then
          _apply_test_color "$method" "$color_name"
          return
        else
          echo "Invalid selection. Please try again."
        fi
      done
    elif [[ "$category" == "Bold Colors" ]]; then
      echo "Select a bold color:"
      select color_name in "${bold_colors[@]}"; do
        if [[ -n "$color_name" ]]; then
          _apply_test_color "$method" "$color_name"
          return
        else
          echo "Invalid selection. Please try again."
        fi
      done
    else
      echo "Invalid selection. Please try again."
    fi
  done
}

# Helper function to apply the test color
_apply_test_color() {
  local method="$1"
  local color_name="$2"
  local message="This is a test of ${color_name} with ${method}"
  
  # Store the original color value
  local original_color
  
  case "$method" in
    header)
      original_color="$GREEN"
      # Temporarily override the color
      GREEN="${!color_name}"
      utilsh::print_header "$message" "${!color_name}"
      # Restore original color
      GREEN="$original_color"
      ;;
    info)
      original_color="$GREEN"
      GREEN="${!color_name}"
      utilsh::print_info "$message" "${!color_name}"
      GREEN="$original_color"
      ;;
    warning)
      original_color="$YELLOW"
      YELLOW="${!color_name}"
      utilsh::print_warning "$message" "${!color_name}"
      YELLOW="$original_color"
      ;;
    error)
      original_color="$RED"
      RED="${!color_name}"
      utilsh::print_error "$message" "${!color_name}"
      RED="$original_color"
      ;;
    debug)
      original_color="$CYAN"  # Assuming debug uses CYAN
      CYAN="${!color_name}"
      utilsh::print_debug "$message" "${!color_name}"
      CYAN="$original_color"
      ;;
    *)
      echo "Unknown method: $method"
      echo "Available methods: header, info, warning, error, debug"
      return 1
      ;;
  esac
}
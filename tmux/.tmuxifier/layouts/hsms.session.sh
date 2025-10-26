# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/Documents/github.com/hsms68"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "hsms"; then

  # Create a new window inline within session layout definition.
  new_window "frontend"
  run_cmd "cd frontend && nvim"

  new_window "run"
  run_cmd "cd frontend && npm run dev"

  new_window "backend"
  run_cmd "cd backend && lazygit"

  # Select the default active window on session creation.
  select_window 1

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session

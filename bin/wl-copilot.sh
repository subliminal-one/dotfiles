PROJECT_DIR="/home/mmyers/projects/wellness/wl-widgets-fe"

systemd-run --user --pty --unit=copilot-sandbox \
  --collect \
  -p ProtectSystem=strict \
  -p ProtectHome=tmpfs \
  -p WorkingDirectory="$PROJECT_DIR" \
  -p BindPaths="$PROJECT_DIR" \
  -p BindPaths=/home/mmyers/.copilot \
  -p BindPaths="$XDG_RUNTIME_DIR" \
  -p ReadWritePaths="$PROJECT_DIR" \
  -p ReadWritePaths="$XDG_RUNTIME_DIR" \
  -p ReadWritePaths=/tmp \
  /usr/local/bin/copilot "$@"

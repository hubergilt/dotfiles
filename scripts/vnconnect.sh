#!/bin/bash
# Run on YOUR local machine. Starts the remote Xvfb+i3+x11vnc stack on asus.lan,
# opens the SSH tunnel, launches the VNC viewer, and cleans up when you close it.
# Requires: sshpass, xtigervncviewer (or vncviewer)
#   sudo apt install sshpass tigervnc-viewer

HOST="asus.lan"
REMOTE_USER="huber"
export SSHPASS="huber"          # SSH login password (plain text: keep this file private)
LOCAL_PORT=5900                 # change if 5900 is already used on your PC
SOCK="/tmp/vnc-tunnel-$$.sock"
PASSFILE="$(mktemp)"

SSH_OPTS="-o StrictHostKeyChecking=accept-new -o ServerAliveInterval=30"

cleanup() {
    ssh -S "$SOCK" -O exit "$REMOTE_USER@$HOST" 2>/dev/null
    rm -f "$PASSFILE" "$SOCK"
}
trap cleanup EXIT

# 1. Start the remote stack (~/start-vnc.sh) and wait until x11vnc is listening
echo "Starting remote VNC stack on $HOST..."
sshpass -e ssh $SSH_OPTS "$REMOTE_USER@$HOST" '
    setsid -w ~/start-vnc.sh </dev/null >/tmp/start-vnc.log 2>&1
    for i in $(seq 20); do
        ss -ltn | grep -q "127.0.0.1:5900" && exit 0
        sleep 0.5
    done
    echo "x11vnc did not start. See /tmp/start-vnc.log on the remote machine." >&2
    exit 1
' || exit 1

# 2. Open the tunnel (control socket lets us close it cleanly later)
echo "Opening SSH tunnel on localhost:$LOCAL_PORT..."
sshpass -e ssh $SSH_OPTS -f -N -M -S "$SOCK" \
    -o ExitOnForwardFailure=yes \
    -L "$LOCAL_PORT:localhost:5900" "$REMOTE_USER@$HOST" || exit 1

# 3. Fetch the VNC password file from the remote machine (already in VNC format)
sshpass -e scp $SSH_OPTS -q "$REMOTE_USER@$HOST:.vnc/passwd" "$PASSFILE" || exit 1

# 4. Launch the viewer (script waits here until you close it)
VIEWER="$(command -v vncviewer || command -v xtigervncviewer)"
[ -z "$VIEWER" ] && { echo "No VNC viewer found. Run: sudo apt install tigervnc-viewer"; exit 1; }
"$VIEWER" -passwd "$PASSFILE" "localhost:$LOCAL_PORT"

#!/usr/bin/python3

from wayfire_socket import WayfireSocket, get_msg_template
import os

addr = os.getenv('WAYFIRE_SOCKET')

# Important: we connect to Wayfire's IPC two times. The one socket is used for reading events (view-mapped, view-focused, etc).
# The other is used for sending commands and querying Wayfire.
# We could use the same socket, but this would complicate reading responses, as events and query responses would be mixed with just one socket.
events_sock = WayfireSocket(addr)
commands_sock = WayfireSocket(addr)
events_sock.watch(['view-mapped'])

while True:
    msg = events_sock.read_message()
    view = msg["view"]
    if view["title"] == "Picture-in-Picture":
        commands_sock.set_always_on_top(view["id"], True)

        message = get_msg_template("wm-actions/set-sticky")
        message["data"]["view_id"] = view["id"]
        message["data"]["state"] = True
        commands_sock.send_json(message)

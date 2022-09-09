```
┏━━━━Functions━━━━━━━━━━━━━━━┯🐧┯⊞ ┯🍏┯🌐┓
┃ main                       │✅│✅│❌│✅┃
┃ │ dialogs                  │✅│✅│⚠️│✅┃
┃ ├─ messagebox              │✅│✅│⚠️│✅┃
┃ ├─ inputbox                │✅│✅│⚠️│✅┃
┃ ├─ passwordbox             │✅│✅│⚠️│✅┃
┃ ├─ colorchooser            │✅│✅│⚠️│✅┃
┃ ├─ openfiledialog          │✅│✅│⚠️│✅┃
┃ ├─ savefiledialog          │✅│✅│⚠️│✅┃
┃ ├─ selectfolderdialog      │✅│✅│⚠️│✅┃
┃ ├─ notifypopup             │✅│✅│⚠️│✅┃
┃ │ window                   │✅│✅│❌│✅┃
┃ ├─ set_title               │✅│✅│⚠️│✅┃
┃ ├─ get_title               │✅│✅│❌│✅┃
┃ ├─ maximize                │✅│✅│❌│✅┃
┃ ├─ unmaximize              │✅│✅│❌│✅┃
┃ ├─ toggle_maximize         │✔️│✔️│✔️│✅┃
┃ ├─ minimize                │✅│✅│❌│✅┃
┃ ├─ unminimize              │✅│✅│❌│✅┃
┃ ├─ is_maximized            │✅│✅│❌│✅┃
┃ ├─ fullscreen              │✅│✅│❌│✅┃
┃ ├─ unfullscreen            │✅│✅│❌│✅┃
┃ ├─ toggle_fullscreen       │✔️│✔️│✔️│✅┃
┃ ├─ is_fullscreen           │✅│✅│⚠️│✅┃
┃ ├─ close                   │✅│✅│❌│✅┃
┃ ├─ focus                   │✅│✅│❌│✅┃
┃ ├─ set_icon                │✅│✅│❌│✅┃
┃ ├─ set_transparent         │❌│❌│❌│❌┃
┃ ├─ set_decoration          │✅│✅│❌│✅┃
┃ ├─ is_decorated            │✅│✅│❌│✅┃
┃ ├─┤ *>html.app-region      │✔️│✔️│✔️│✅┃
┃ ├─┼─ drag                  │✔️│✔️│✔️│✅┃
┃ ├─┴─ nw-resize             │✔️│✔️│✔️│✅┃
┃ ├─ set_always_on_top       │✅│✅│❌│✅┃
┃ ├─ is_always_on_top        │✅│✅│⚠️│✅┃
┃ ├─ toggle_always_on_top    │✔️│✔️│✔️│✅┃
┃ ├─ move                    │✅│✅│❌│✅┃
┃ ├─ move_by                 │✅│✅│❌│✅┃
┃ ├─ resize                  │✅│✅│❌│✅┃
┃ ├─ resize_by               │✅│✅│❌│✅┃
┃ ├─ set_progress            │✅│✅│❌│✅┃
┃ ├─ clear_progress          │✅│✅│❌│✅┃
┃ ├─ new                     │〽️│〽️│❌│〽️┃
┃ │ storage                  │✅│✅│⚠️│✅┃
┃ ├─ set                     │✅│✅│⚠️│✅┃
┃ ├─ get                     │✅│✅│⚠️│✅┃
┃ │ events                   │✅│✅│⚠️│✅┃
┃ ├─ _vebview_loaded         │✔️│✔️│✔️│✅┃
┃ │ fs                       │✅│✅│⚠️│✅┃
┃ ├─ read_file               │✅│✅│⚠️│✅┃
┃ ├─ write_file              │✅│✅│⚠️│✅┃
┃ ├─ append_file             │✅│✅│⚠️│✅┃
┃ ├─ remove_file             │✅│✅│⚠️│✅┃
┃ ├─ move_file               │✅│✅│⚠️│✅┃
┃ ├─ copy_file               │✅│✅│⚠️│✅┃
┃ ├─ get_stats               │✅│✅│⚠️│✅┃
┃ ├─ read_dir                │✅│✅│⚠️│✅┃
┃ ├─ create_dir              │✅│✅│⚠️│✅┃
┃ ├─ remove_dir              │✅│✅│⚠️│✅┃
┃ │ os                       │✅│✅│⚠️│✅┃
┃ ├─ get_version             │✅│✅│⚠️│✅┃
┃ ├─ open_in_browser         │✅│✅│⚠️│✅┃
┃ │ http                     │✅│✅│⚠️│✅┃
┃ ├─ request                 │✅│✅│⚠️│✅┃
┃ ├─ download                │✅│✅│⚠️│✅┃
┃ ├─ webview->(iframe)       │✔️│✔️│✔️│〽️┃
┃ │ messenger                │❌│❌│❌│❌┃
┃ ├─ post                    │❌│❌│❌│❌┃
┃ ├─ add_event_listener      │❌│❌│❌│❌┃
┃ │ clipboard                │❌│❌│❌│❌┃
┃ ├─ set                     │❌│❌│❌│❌┃
┃ ├─ get                     │❌│❌│❌│❌┃
┃ │ args                     │❌│❌│❌│❌┃
┃ │ custom_backend           │〽️│〽️│⚠️│✔️┃
┃ │ file://_support          │✅│✅│❌│✔️┃
┃ │ cloud_loading            │✅│✅│⚠️│✔️┃
┃ │ assign/unassign          │✔️│✔️│✔️│✅┃
┃ ├─ title                   │✔️│✔️│✔️│✅┃
┃ │ Browser API Polyfills    │✔️│✔️│✔️│〽️┃
┃ ├─ Notification API        │✔️│✔️│✔️│✅┃
┃ ├─ Native File System API  │✔️│✔️│✔️│❌┃
┃ ├─ title                   │✔️│✔️│✔️│✅┃
┃ │ Non-Public¹              │✅│✅│⚠️│✅┃
┃ └─ server_version          │✅│✅│⚠️│✅┃
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━┷🐧┷⊞ ┷🍏┷🌐┛

¹: Non-Public means `not designed for usage` or `built-in functions that not recommend usage from outside built-in api`. The functions is **not** documented *for JavaScript* and could be causes crashes.

┏━━┯━━ Symbols ━━━━━┯━━┯━━━━━━━━━━━━━┓
┃✅│ Implemented    │🐧│ Linux       ┃
┃❌│ Not Implemented│⊞ │ Windows     ┃
┃〽️│ Partial        │🍏│ MacOS       ┃
┃⚠️│ Not Tested     │🌐│ JS Client   ┃
|✔️│ Unnecessary    │  │             ┃
┗━━┷━━━━━━━━━━━━━━━━┷━━┷━━━━━━━━━━━━━┛

Lastly, i love ASCII art as you can understand above :)
```

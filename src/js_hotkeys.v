module main

import json

[export: "hotkey_event_listener"]
fn hotkey_event_listener(event_code int){
	C.webview_eval(hotkeys[event_code].webview,cstr("vebview._._hotkeys._event_handler(\""+event_code.str()+"\");"))
}

fn C.js_register_hotkey(&char, &char, &WebviewManager)
[export:"js_register_hotkey"]
fn js_register_hotkey(seq &char, req &char, webview &WebviewManager) {
	details:=json.decode([]string,req.vstring())or{return}
	$if windows {
		code:=details[0].int() //ctrl[1]+shift[1]+alt[1]+super[1]+charCode[3]
		keycode:=details[0][4..].int()
		mod_ctrl:=details[0][0..1].int()==1
		mod_shift:=details[0][1..2].int()==1
		mod_alt:=details[0][2..3].int()==1
		mod_super:=details[0][3..4].int()==1
		mut mod:=0x4000
		if mod_ctrl { mod|=0x0002 }
		if mod_shift { mod|=0x0004 }
		if mod_alt { mod|=0x0001 }
		if mod_super { mod|=0x0008 }
		C.RegisterHotKey(C.NULL, code, mod, keycode)
		hotkeys[code]=webview
	} $else {
		print("[WARN]: Hotkeys.register not implemented on this os")
	}
}

fn C.js_unregister_hotkey(&char, &char, &WebviewManager)
[export:"js_unregister_hotkey"]
fn js_unregister_hotkey(seq &char, req &char, webview &WebviewManager) {
	details:=json.decode([]string,req.vstring())or{return}
	$if windows {
		code:=details[0].int() //ctrl[1]+shift[1]+alt[1]+super[1]+charCode[3]
		C.UnregisterHotKey(C.NULL, code)
	} $else {
		print("[WARN]: Hotkeys.unregister not implemented on this os")
	}
}
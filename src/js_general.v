module main

import json

fn C.js_server_version(&char, &char, &WebviewManager)
[export:"js_server_version"]
fn js_server_version(seq &char, req &char, webview &WebviewManager) {
	unsafe {
		C.webview_return(webview.webview, seq, 0, vstring_to_jsstring(version))
	}
}

fn vstring_to_jsstring(the_vstring string) &char {
	return cstr("`"+the_vstring.replace("\\","\\\\").replace("\${","\\\${").replace("`","\\`")+"`")
}

fn C.js_app_args(&char, &char, &WebviewManager)
[export:"js_app_args"]
fn js_app_args(seq &char, req &char, webview &WebviewManager) {
	unsafe {
		C.webview_return(webview.webview, seq, 0, cstr(json.encode(app_args)))
	}
}
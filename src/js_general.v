module main

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
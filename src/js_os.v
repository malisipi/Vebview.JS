module main

import json
import os

fn C.js_open_in_browser(&char, &char, &WebviewManager)
[export:"js_open_in_browser"]
fn js_open_in_browser(seq &char, req &char, webview &WebviewManager) {
	unsafe {
		details:=json.decode([]string,req.vstring())or{return}
		os.open_uri(details[0])or{}
	}
}

fn C.js_os_version(&char, &char, &WebviewManager)
[export:"js_os_version"]
fn js_os_version(seq &char, req &char, webview &WebviewManager) {
	unsafe {
		C.webview_return(webview.webview, seq, 0, cstr(
			$if windows {"0"} $else $if linux {"1"} $else {"9"}
		))
	}
}
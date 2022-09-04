module main

import json
import os

fn C.js_storage_set(&char, &char, &WebviewManager)
[export:"js_storage_set"]
fn js_storage_set(seq &char, req &char, webview &WebviewManager) {
	unsafe {
		details:=json.decode([]string,req.vstring())or{return}
		user_data_storage[details[0]]=details[1]
		os.write_file(storage_file_location,json.encode(user_data_storage))or{}
	}
}

fn C.js_storage_get(&char, &char, &WebviewManager)
[export:"js_storage_get"]
fn js_storage_get(seq &char, req &char, webview &WebviewManager) {
	unsafe {
		details:=json.decode([]string,req.vstring())or{return}
		C.webview_return(webview.webview, seq, 0, vstring_to_jsstring(user_data_storage[details[0]]))
	}
}

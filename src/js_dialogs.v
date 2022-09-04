module main

import json

fn C.js_messagebox(&char, &char, &WebviewManager)
[export:"js_messagebox"]
fn js_messagebox(seq &char, req &char, webview &WebviewManager) {
	unsafe {
		details:=json.decode([]string,req.vstring())or{return}
		C.webview_return(webview.webview, seq, 0, cstr(messagebox(details[0], details[1], details[2], details[3]).str()))
	}
}

fn C.js_inputbox(&char, &char, &WebviewManager)
[export:"js_inputbox"]
fn js_inputbox(seq &char, req &char, webview &WebviewManager) {
	unsafe {
		details:=json.decode([]string,req.vstring())or{return}
		C.webview_return(webview.webview, seq, 0, vstring_to_jsstring(inputbox(details[0], details[1], details[2]).str()))
	}
}

fn C.js_passwordbox(&char, &char, &WebviewManager)
[export:"js_passwordbox"]
fn js_passwordbox(seq &char, req &char, webview &WebviewManager) {
	unsafe {
		details:=json.decode([]string,req.vstring())or{return}
		C.webview_return(webview.webview, seq, 0, vstring_to_jsstring(passwordbox(details[0], details[1]).str()))
	}
}

fn C.js_colorchooser(&char, &char, &WebviewManager)
[export:"js_colorchooser"]
fn js_colorchooser(seq &char, req &char, webview &WebviewManager) {
	unsafe {
		details:=json.decode([]string,req.vstring())or{return}
		C.webview_return(webview.webview, seq, 0, vstring_to_jsstring(colorchooser(details[0], details[1])))
	}
}

fn C.js_openfiledialog(&char, &char, &WebviewManager)
[export:"js_openfiledialog"]
fn js_openfiledialog(seq &char, req &char, webview &WebviewManager) {
	unsafe {
		details:=json.decode([]string,req.vstring())or{return}
		C.webview_return(webview.webview, seq, 0, vstring_to_jsstring(openfiledialog(details[0])))
	}
}

fn C.js_savefiledialog(&char, &char, &WebviewManager)
[export:"js_savefiledialog"]
fn js_savefiledialog(seq &char, req &char, webview &WebviewManager) {
	unsafe {
		details:=json.decode([]string,req.vstring())or{return}
		C.webview_return(webview.webview, seq, 0, vstring_to_jsstring(savefiledialog(details[0])))
	}
}

fn C.js_selectfolderdialog(&char, &char, &WebviewManager)
[export:"js_selectfolderdialog"]
fn js_selectfolderdialog(seq &char, req &char, webview &WebviewManager) {
	unsafe {
		details:=json.decode([]string,req.vstring())or{return}
		C.webview_return(webview.webview, seq, 0, vstring_to_jsstring(selectfolderdialog(details[0])))
	}
}

fn C.js_notifypopup(&char, &char, &WebviewManager)
[export:"js_notifypopup"]
fn js_notifypopup(seq &char, req &char, webview &WebviewManager) {
	unsafe {
		details:=json.decode([]string,req.vstring())or{return}
		notifypopup(details[0], details[1], details[2])
	}
}

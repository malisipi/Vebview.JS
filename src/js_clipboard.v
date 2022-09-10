module main

import json

fn C.js_clipboard_set(&char, &char, &WebviewManager)
[export:"js_clipboard_set"]
fn js_clipboard_set(seq &char, req &char, webview &WebviewManager){
    unsafe{
        $if linux {
            println("[WARN]: Don't call js_clipboard_set on Linux")
		} $else $if windows {
            details:=json.decode([]string,req.vstring())or{return}
            C.webview_return(webview.webview, seq, 0, cstr(win_clipboard_set(details[0]).str()))
        } $else {
            println("[WARN]: Clipboard.set not implemented on this os")
        }
    }
}

fn C.js_clipboard_get(&char, &char, &WebviewManager)
[export:"js_clipboard_get"]
fn js_clipboard_get(seq &char, req &char, webview &WebviewManager){
    unsafe{
        $if linux {
            println("[WARN]: Don't call js_clipboard_get on Linux")
		} $else $if windows {
            C.webview_return(webview.webview, seq, 0, vstring_to_jsstring(win_clipboard_get()))
        } $else {
            println("[WARN]: Clipboard.get not implemented on this os")
        }
    }
}
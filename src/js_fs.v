module main

import json
import os

fn C.js_read_file(&char, &char, &WebviewManager)
[export:"js_read_file"]
fn js_read_file(seq &char, req &char, webview &WebviewManager) {
	unsafe {
		details:=json.decode([]string,req.vstring())or{return}
		C.webview_return(webview.webview, seq, 0, vstring_to_jsstring(os.read_file(details[0])or{
			C.webview_return(webview.webview, seq, 0, cstr("false"))
			return
		}))
	}
}

fn C.js_write_file(&char, &char, &WebviewManager)
[export:"js_write_file"]
fn js_write_file(seq &char, req &char, webview &WebviewManager) {
	unsafe {
		details:=json.decode([]string,req.vstring())or{return}
		os.write_file(details[0], details[1]) or {
			C.webview_return(webview.webview, seq, 0, cstr("false"))
			return
		}
		C.webview_return(webview.webview, seq, 0, cstr("true"))
	}
}

fn C.js_append_file(&char, &char, &WebviewManager)
[export:"js_append_file"]
fn js_append_file(seq &char, req &char, webview &WebviewManager) {
	unsafe {
		details:=json.decode([]string,req.vstring())or{return}
		file_content:=os.read_file(details[0])or{
			C.webview_return(webview.webview, seq, 0, cstr("false"))
			return
		}
		os.write_file(details[0], file_content+details[1]) or {
			C.webview_return(webview.webview, seq, 0, cstr("false"))
			return
		}
		C.webview_return(webview.webview, seq, 0, cstr("true"))
	}
}

fn C.js_get_stats(&char, &char, &WebviewManager)
[export:"js_get_stats"]
fn js_get_stats(seq &char, req &char, webview &WebviewManager) {
	unsafe {
		details:=json.decode([]string,req.vstring())or{return}
		size:=os.file_size(details[0])
		is_file:=os.is_file(details[0])
		is_link:=os.is_link(details[0])
		is_directory:=os.is_dir(details[0])
		is_executable:=os.is_executable(details[0])
		is_readable:=os.is_readable(details[0])
		is_writable:=os.is_writable(details[0])
		exists:=os.exists(details[0])
		is_dir_empty:=os.is_dir_empty(details[0])
		file_last_mod_unix:=os.file_last_mod_unix(details[0])
		C.webview_return(webview.webview, seq, 0, vstring_to_jsstring('{"size": ${size}, "is_file":${is_file}, "is_directory":${is_directory}, "is_link":${is_link}, "is_executable":${is_executable}, "is_writable":${is_writable}, "exists":${exists}, "is_dir_empty":${is_dir_empty}, "is_readable":${is_readable}, "file_last_mod_unix":${file_last_mod_unix}}'))
	}
}

fn C.js_remove_file(&char, &char, &WebviewManager)
[export:"js_remove_file"]
fn js_remove_file(seq &char, req &char, webview &WebviewManager) {
	unsafe {
		details:=json.decode([]string,req.vstring())or{return}
		os.rm(details[0]) or {
			C.webview_return(webview.webview, seq, 0, cstr("false"))
			return
		}
		C.webview_return(webview.webview, seq, 0, cstr("true"))
	}
}

fn C.js_move_file(&char, &char, &WebviewManager)
[export:"js_move_file"]
fn js_move_file(seq &char, req &char, webview &WebviewManager) {
	unsafe {
		details:=json.decode([]string,req.vstring())or{return}
		os.mv(details[0],details[1]) or {
			C.webview_return(webview.webview, seq, 0, cstr("false"))
			return
		}
		C.webview_return(webview.webview, seq, 0, cstr("true"))
	}
}

fn C.js_copy_file(&char, &char, &WebviewManager)
[export:"js_copy_file"]
fn js_copy_file(seq &char, req &char, webview &WebviewManager) {
	unsafe {
		details:=json.decode([]string,req.vstring())or{return}
		os.cp(details[0],details[1]) or {
			C.webview_return(webview.webview, seq, 0, cstr("false"))
			return
		}
		C.webview_return(webview.webview, seq, 0, cstr("true"))
	}
}

fn C.js_read_directory(&char, &char, &WebviewManager)
[export:"js_read_directory"]
fn js_read_directory(seq &char, req &char, webview &WebviewManager) {
	unsafe {
		details:=json.decode([]string,req.vstring())or{return}
		list:=os.ls(details[0]) or {
			C.webview_return(webview.webview, seq, 0, cstr("false"))
			return
		}
		C.webview_return(webview.webview, seq, 0, vstring_to_jsstring(json.encode(list)))
	}
}

fn C.js_create_directory(&char, &char, &WebviewManager)
[export:"js_create_directory"]
fn js_create_directory(seq &char, req &char, webview &WebviewManager) {
	unsafe {
		details:=json.decode([]string,req.vstring())or{return}
		os.mkdir_all(details[0]) or {
			C.webview_return(webview.webview, seq, 0, cstr("false"))
			return
		}
		C.webview_return(webview.webview, seq, 0, cstr("true"))
	}
}

fn C.js_remove_directory(&char, &char, &WebviewManager)
[export:"js_remove_directory"]
fn js_remove_directory(seq &char, req &char, webview &WebviewManager) {
	unsafe {
		details:=json.decode([]string,req.vstring())or{return}
		os.rmdir_all(details[0]) or {
			C.webview_return(webview.webview, seq, 0, cstr("false"))
			return
		}
		C.webview_return(webview.webview, seq, 0, cstr("true"))
	}
}
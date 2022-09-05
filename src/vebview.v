module main

import vweb
import os
import json
import time

#include "webview.h"
#flag -Ilibs/webview/

type Webview_t = voidptr
fn C.webview_create(debug int, window voidptr) Webview_t
fn C.webview_destroy(w Webview_t)
fn C.webview_run(w Webview_t)
fn C.webview_set_title(w Webview_t, title &char)
fn C.webview_set_size(w Webview_t, width int, height int, hints int)
fn C.webview_set_html(w Webview_t, html &char)
fn C.webview_navigate(w Webview_t, url &char)
fn C.webview_bind(w Webview_t, func_name &char, func fn(&char, &char, &WebviewManager), arg voidptr)
fn C.webview_return(w Webview_t, seq &char, status int, result &char)
fn C.webview_get_window(w Webview_t) voidptr

fn create_webview(webview_app_config Config){
	active_window_count++
	mut webview_manager:=WebviewManager{
		config:webview_app_config,
		webview:C.webview_create(if webview_app_config.debug {1} else {0}, C.NULL)
	}
	alive_windows[webview_manager.id]=true
	C.webview_set_title(webview_manager.webview, cstr(webview_manager.config.title))
	//base64
	C.webview_bind(webview_manager.webview, cstr("c2V0X3RpdGxl"), C.js_set_title, &webview_manager) //set_title
	C.webview_bind(webview_manager.webview, cstr("bWVzc2FnZWJveA=="), C.js_messagebox, &webview_manager) //messagebox
	C.webview_bind(webview_manager.webview, cstr("aW5wdXRib3g="), C.js_inputbox, &webview_manager) //inputbox
	C.webview_bind(webview_manager.webview, cstr("cGFzc3dvcmRib3g="), C.js_passwordbox, &webview_manager) //passwordbox
	C.webview_bind(webview_manager.webview, cstr("Y29sb3JjaG9vc2Vy"), C.js_colorchooser, &webview_manager) //colorchooser
	C.webview_bind(webview_manager.webview, cstr("b3BlbmZpbGVkaWFsb2c="), C.js_openfiledialog, &webview_manager) //openfiledialog
	C.webview_bind(webview_manager.webview, cstr("c2F2ZWZpbGVkaWFsb2c="), C.js_savefiledialog, &webview_manager) //savefiledialog
	C.webview_bind(webview_manager.webview, cstr("c2VsZWN0Zm9sZGVyZGlhbG9n"), C.js_selectfolderdialog, &webview_manager) //selectfolderdialog
	C.webview_bind(webview_manager.webview, cstr("bm90aWZ5cG9wdXA="), C.js_notifypopup, &webview_manager) //notifypopup
	C.webview_bind(webview_manager.webview, cstr("c2VydmVyX3ZlcnNpb24="), C.js_server_version, &webview_manager) //server_version
	C.webview_bind(webview_manager.webview, cstr("cmVhZF9maWxl"), C.js_read_file, &webview_manager) //read_file
	C.webview_bind(webview_manager.webview, cstr("d3JpdGVfZmlsZQ=="), C.js_write_file, &webview_manager) //write_file
	C.webview_bind(webview_manager.webview, cstr("b3Blbl9pbl9icm93c2Vy"), C.js_open_in_browser, &webview_manager) //open_in_browser
	C.webview_bind(webview_manager.webview, cstr("c3RvcmFnZV9zZXQ="), C.js_storage_set, &webview_manager) //storage_set
	C.webview_bind(webview_manager.webview, cstr("c3RvcmFnZV9nZXQ="), C.js_storage_get, &webview_manager) //storage_get
	C.webview_bind(webview_manager.webview, cstr("d2luZG93X21heGltaXpl"), C.js_window_maximize, &webview_manager) //window_maximize
	C.webview_bind(webview_manager.webview, cstr("d2luZG93X3VubWF4aW1pemU="), C.js_window_unmaximize, &webview_manager) //window_unmaximize
	C.webview_bind(webview_manager.webview, cstr("d2luZG93X21pbmltaXpl"), C.js_window_minimize, &webview_manager) //window_minimize
	C.webview_bind(webview_manager.webview, cstr("d2luZG93X3VubWluaW1pemU="), C.js_window_unminimize, &webview_manager) //window_unminimize
	C.webview_bind(webview_manager.webview, cstr("d2luZG93X2Z1bGxzY3JlZW4="), C.js_window_fullscreen, &webview_manager) //window_fullscreen
	C.webview_bind(webview_manager.webview, cstr("d2luZG93X3VuZnVsbHNjcmVlbg=="), C.js_window_unfullscreen, &webview_manager) //window_unfullscreen
	C.webview_bind(webview_manager.webview, cstr("d2luZG93X2lzX21heGltaXplZA=="), C.js_window_is_maximized, &webview_manager) //window_is_maximized
	C.webview_bind(webview_manager.webview, cstr("d2luZG93X21vdmU="), C.js_window_move, &webview_manager) //window_move
	C.webview_bind(webview_manager.webview, cstr("d2luZG93X21vdmVfYnk="), C.js_window_move_by, &webview_manager) //window_move_by
	C.webview_bind(webview_manager.webview, cstr("d2luZG93X2lzX2Z1bGxzY3JlZW4="), C.js_window_is_fullscreen, &webview_manager) //window_is_fullscreen
	C.webview_bind(webview_manager.webview, cstr("d2luZG93X25ldw=="), C.js_window_new, &webview_manager) //window_new
	C.webview_bind(webview_manager.webview, cstr("d2luZG93X3NldF9kZWNvcmF0ZWQ="), C.js_window_set_decorated, &webview_manager) //window_set_decorated
	C.webview_bind(webview_manager.webview, cstr("d2luZG93X2Nsb3Nl"), C.js_window_close, &webview_manager) //window_close
	C.webview_bind(webview_manager.webview, cstr("d2luZG93X3NldF9yZXNpemFibGU="), C.js_window_set_resizable, &webview_manager) //window_set_resizable
	C.webview_bind(webview_manager.webview, cstr("d2luZG93X3NldF9hbHdheXNfb25fdG9w"), C.js_window_set_always_on_top, &webview_manager) //window_set_always_on_top
	C.webview_bind(webview_manager.webview, cstr("d2luZG93X2lzX2Fsd2F5c19vbl90b3A="), C.js_window_is_always_on_top, &webview_manager) //window_is_always_on_top
	C.webview_bind(webview_manager.webview, cstr("d2luZG93X3NldF9pY29u"), C.js_window_set_icon, &webview_manager) //window_set_icon
	C.webview_bind(webview_manager.webview, cstr("d2luZG93X2ZvY3Vz"), C.js_window_focus, &webview_manager) //window_focus
	C.webview_bind(webview_manager.webview, cstr("d2luZG93X3Jlc2l6ZQ=="), C.js_window_resize, &webview_manager) //window_resize
	C.webview_bind(webview_manager.webview, cstr("d2luZG93X2lzX2RlY29yYXRlZA=="), C.js_window_is_decorated, &webview_manager) //window_is_decorated
	C.webview_bind(webview_manager.webview, cstr("d2luZG93X2dldF90aXRsZQ=="), C.js_window_get_title, &webview_manager) //window_get_title
	C.webview_bind(webview_manager.webview, cstr("d2luZG93X3Jlc2l6ZV9ieQ=="), C.js_window_resize_by, &webview_manager) //window_resize_by
	C.webview_bind(webview_manager.webview, cstr("aHR0cF9yZXF1ZXN0"), C.js_http_request, &webview_manager) //http_request
	C.webview_bind(webview_manager.webview, cstr("b3NfdmVyc2lvbg=="), C.js_os_version, &webview_manager) //os_version
	C.webview_bind(webview_manager.webview, cstr("Z2V0X3N0YXRz"), C.js_get_stats, &webview_manager) //get_stats
	C.webview_bind(webview_manager.webview, cstr("YXBwZW5kX2ZpbGU="), C.js_append_file, &webview_manager) //append_file
	C.webview_bind(webview_manager.webview, cstr("cmVtb3ZlX2ZpbGU="), C.js_remove_file, &webview_manager) //remove_file
	C.webview_bind(webview_manager.webview, cstr("bW92ZV9maWxl"), C.js_move_file, &webview_manager) //move_file
	C.webview_bind(webview_manager.webview, cstr("Y29weV9maWxl"), C.js_copy_file, &webview_manager) //copy_file
	C.webview_bind(webview_manager.webview, cstr("cmVhZF9kaXJlY3Rvcnk="), C.js_read_directory, &webview_manager) //read_directory
	C.webview_bind(webview_manager.webview, cstr("Y3JlYXRlX2RpcmVjdG9yeQ=="), C.js_create_directory, &webview_manager) //create_directory
	C.webview_bind(webview_manager.webview, cstr("cmVtb3ZlX2RpcmVjdG9yeQ=="), C.js_remove_directory, &webview_manager) //remove_directory
	C.webview_bind(webview_manager.webview, cstr("aHR0cF9kb3dubG9hZA=="), C.js_http_download, &webview_manager) //http_download
	
	C.webview_set_size(webview_manager.webview, webview_manager.config.default_size.width, webview_manager.config.default_size.height, C.WEBVIEW_HINT_NONE)

	js_window_set_decorated(cstr(""),cstr("["+webview_manager.config.decorated.str()+"]"),webview_manager)

	C.webview_navigate(webview_manager.webview, cstr(webview_manager.config.main_page))

	$if linux {
		C.g_signal_connect(C.webview_get_window(webview_manager.webview) ,cstr("destroy"), close_webview_event, &webview_manager)
	} $else $if windows {
		webview_manager.title=webview_manager.config.title
	}

	webviews << webview_manager

	println(webview_manager.id)
	$if linux {
		C.gtk_init(0, C.NULL)
		for;alive_windows[webview_manager.id];time.sleep(time.millisecond*1000/60){for;C.gtk_events_pending();{C.gtk_main_iteration()}}
	} $else $if windows {
		C.webview_run(webview_manager.webview)
		active_window_count--
	} $else {
		println("[ERR ]: Multi-window not implemented")
	}
	println("Closed: "+webview_manager.id.str())
}

fn main() {
	os.chdir(os.dir(os.executable()))?
	print(vebview_js_art)

	active_window_count=0
	latest_id=1

	app_config=json.decode(Config, os.read_file("app.config")or{os.read_file("res/app.config")or{"{}"}}) or {panic("[ERR ]: app.config -> Unable to parse")}

	if os.exists(storage_file_location) {
		user_data_storage=json.decode(map[string]string, os.read_file(storage_file_location)or{"{}"}) or {print("[WARN]: Storage file was corrupted.") map[string]string }
	} else {
		user_data_storage=map[string]string
	}

	if app_config.localhost {
		mut webview_server := &Server{}
		webview_server.mount_static_folder_at(app_config.mount_folder, '/')
		go vweb.run(webview_server, app_config.port)
		app_config.main_page="http://localhost:"+app_config.port.str()+"/"+app_config.main_page
	} else if app_config.custom_backend!="" || app_config.cloud_loading {
		if app_config.custom_backend!="" {
			print("Custom Backend not implemented")
			exit(2)
		}
	} else {
		$if windows {
			C._putenv(cstr("--allow-file-access-from-files"))
		}
		app_config.main_page="file://"+os.resource_abs_path(app_config.mount_folder+"/"+app_config.main_page)
	}

	go create_webview(app_config)

	$if linux || windows {
		for;active_window_count<1;{} //wait until a window created
		for;active_window_count>0;time.sleep(time.millisecond*200){} //wait until all windows closed
		exit(0)
	} $else {
		println("<Crashed>: Main() not compatible with this OS. :(")
		exit(1)
	}
}

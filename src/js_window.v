module main

import json

fn C.js_set_title(&char, &char, &WebviewManager)
[export:"js_set_title"]
fn js_set_title(seq &char, req &char, webview &WebviewManager) {
	unsafe {
        title:=json.decode([]string,req.vstring())or{return}[0]
		C.webview_set_title(webview.webview, cstr(title))
        $if windows {
            webview.title=title
        }
	}
}

fn C.js_window_maximize(&char, &char, &WebviewManager)
[export:"js_window_maximize"]
fn js_window_maximize(seq &char, req &char, webview &WebviewManager) {
	unsafe {
        $if linux {
            C.gtk_window_maximize(C.webview_get_window(webview.webview))
        } $else $if windows {
            C.ShowWindow(C.webview_get_window(webview.webview), C.SW_MAXIMIZE)
        } $else {
            println("[WARN]: Window.maximize not implemented on this os")
        }
	}
}

fn C.js_window_unmaximize(&char, &char, &WebviewManager)
[export:"js_window_unmaximize"]
fn js_window_unmaximize(seq &char, req &char, webview &WebviewManager) {
	unsafe {
        $if linux {
            C.gtk_window_unmaximize(C.webview_get_window(webview.webview))
        } $else $if windows {
            C.ShowWindow(C.webview_get_window(webview.webview), C.SW_RESTORE)
        } $else {
            println("[WARN]: Window.unmaximize not implemented on this os")
        }
	}
}

fn C.js_window_minimize(&char, &char, &WebviewManager)
[export:"js_window_minimize"]
fn js_window_minimize(seq &char, req &char, webview &WebviewManager) {
	unsafe {
        $if linux {
            C.gtk_window_iconify(C.webview_get_window(webview.webview))
        } $else $if windows {
            C.ShowWindow(C.webview_get_window(webview.webview), C.SW_MINIMIZE)
        } $else {
            println("[WARN]: Window.minimize not implemented on this os")
        }
	}
}

fn C.js_window_unminimize(&char, &char, &WebviewManager)
[export:"js_window_unminimize"]
fn js_window_unminimize(seq &char, req &char, webview &WebviewManager) {
	unsafe {
        $if linux {
            C.gtk_window_deiconify(C.webview_get_window(webview.webview))
        } $else $if windows {
            C.ShowWindow( C.webview_get_window(webview.webview), C.SW_SHOWNORMAL )
        } $else {
            println("[WARN]: Window.unminimize not implemented on this os")
        }
	}
}

fn C.js_window_fullscreen(&char, &char, &WebviewManager)
[export:"js_window_fullscreen"]
fn js_window_fullscreen(seq &char, req &char, webview &WebviewManager) {
	unsafe {
        webview.is_fullscreen = true
        $if linux {
            C.gtk_window_fullscreen(C.webview_get_window(webview.webview))
        } $else $if windows {
            webview.is_fullscreen=true

            mut hwnd:=C.webview_get_window(webview.webview)
            C.GetWindowPlacement( hwnd, &webview.window_placement )
            if webview.hwnd_style    == 0 { webview.hwnd_style = C.GetWindowLong(hwnd, C.GWL_STYLE) }
            if webview.hwnd_style_ex == 0 { webview.hwnd_style_ex = C.GetWindowLong(hwnd, C.GWL_EXSTYLE) }
            mut new_hwnd_style:=webview.hwnd_style
            new_hwnd_style &= ~C.WS_BORDER
            new_hwnd_style &= ~C.WS_DLGFRAME
            new_hwnd_style &= ~C.WS_THICKFRAME
            mut new_hwnd_style_ex:=webview.hwnd_style_ex
            new_hwnd_style_ex &= ~C.WS_EX_WINDOWEDGE
            C.SetWindowLong( hwnd, C.GWL_STYLE, new_hwnd_style | C.WS_POPUP)
            C.SetWindowLong( hwnd, C.GWL_EXSTYLE, new_hwnd_style_ex | C.WS_EX_TOPMOST )
            C.ShowWindow(hwnd, C.SW_MAXIMIZE)

        } $else {
            webview.is_fullscreen = false
            println("[WARN]: Window.fullscreen not implemented on this os")
        }
	}
}

fn C.js_window_unfullscreen(&char, &char, &WebviewManager)
[export:"js_window_unfullscreen"]
fn js_window_unfullscreen(seq &char, req &char, webview &WebviewManager) {
	unsafe {
        webview.is_fullscreen = false
        $if linux {
            C.gtk_window_unfullscreen(C.webview_get_window(webview.webview))
        } $else $if windows {

            mut hwnd:=C.webview_get_window(webview.webview)
            C.SetWindowLong( hwnd, C.GWL_STYLE, webview.hwnd_style )
            C.SetWindowLong( hwnd, C.GWL_EXSTYLE, webview.hwnd_style_ex )
            C.ShowWindow( hwnd, C.SW_SHOWNORMAL )
            C.SetWindowPlacement( hwnd, &webview.window_placement )
        } $else {
            println("[WARN]: Window.unfullscreen not implemented on this os")
        }
	}
}

fn C.js_window_is_maximized(&char, &char, &WebviewManager)
[export:"js_window_is_maximized"]
fn js_window_is_maximized(seq &char, req &char, webview &WebviewManager) {
	unsafe {
        $if linux {
            C.webview_return(webview.webview, seq, 0, cstr(
                C.gtk_window_is_maximized(C.webview_get_window(webview.webview)).str()
            ))
        } $else $if windows {
            C.webview_return(webview.webview, seq, 0, cstr(
               C.IsZoomed(C.webview_get_window(webview.webview)).str()
            ))
        } $else {
            println("[WARN]: Window.is_maximized not implemented on this os")
            C.webview_return(webview.webview, seq, 0, cstr("false"))
        }
	}
}

fn C.js_window_is_fullscreen(&char, &char, &WebviewManager)
[export:"js_window_is_fullscreen"]
fn js_window_is_fullscreen(seq &char, req &char, webview &WebviewManager) {
	unsafe {
        C.webview_return(webview.webview, seq, 0, cstr(webview.is_fullscreen.str()))
	}
}

fn C.js_window_move(&char, &char, &WebviewManager)
[export:"js_window_move"]
fn js_window_move(seq &char, req &char, webview &WebviewManager) {
    unsafe {
        details:=json.decode([]string,req.vstring())or{return}
        $if linux {
            C.gtk_window_move(C.webview_get_window(webview.webview), details[0].int(), details[1].int()) //x, y
        } $else $if windows {
            mut hwnd:=C.webview_get_window(webview.webview)
            rect:=C.RECT{}
            C.GetWindowRect(hwnd, &rect)
            C.MoveWindow( hwnd, details[0].int(), details[1].int(), rect.right-rect.left, rect.bottom-rect.top, true)
        } $else {
            println("[WARN]: Window.move not implemented on this os")
        }
    }
}

fn C.js_window_move_by(&char, &char, &WebviewManager)
[export:"js_window_move_by"]
fn js_window_move_by(seq &char, req &char, webview &WebviewManager) {
    unsafe {
        details:=json.decode([]string,req.vstring())or{return}
        $if linux {
            mut x, mut y:=0, 0
            C.gtk_window_get_position(C.webview_get_window(webview.webview), &x, &y)
            C.gtk_window_move(C.webview_get_window(webview.webview), details[0].int()+x, details[1].int()+y) //x, y
        } $else $if windows {
            mut hwnd:=C.webview_get_window(webview.webview)
            rect:=C.RECT{}
            C.GetWindowRect(hwnd, &rect)
            C.MoveWindow( hwnd, details[0].int()+rect.left, details[1].int()+rect.top, rect.right-rect.left, rect.bottom-rect.top, true)
        } $else {
            println("[WARN]: Window.move_by not implemented on this os")
        }
    }
}

fn C.js_window_new(&char, &char, &WebviewManager)
[export:"js_window_new"]
fn js_window_new(seq &char, req &char, webview &WebviewManager){
    unsafe{
        $if linux {
			create_webview(app_config)
		} $else $if windows {
			go create_webview(app_config)
		} $else {
            println("[WARN]: Multi-Window not implemented on this os")
        }
    }
}

fn C.js_window_set_decorated(&char, &char, &WebviewManager)
[export:"js_window_set_decorated"]
fn js_window_set_decorated(seq &char, req &char, webview &WebviewManager){
    unsafe{
        $if linux {
            details:=json.decode([]string,req.vstring())or{return}
			C.gtk_window_set_decorated(C.webview_get_window(webview.webview),details[0]=="true")
		} $else $if windows {
            details:=json.decode([]string,req.vstring())or{return}
            mut hwnd:=C.webview_get_window(webview.webview)
            webview.is_decorated=details[0]=="true"
            if webview.is_decorated {
                C.SetWindowLong( hwnd, C.GWL_STYLE, webview.hwnd_style )
                C.SetWindowPos( hwnd, C.NULL, 0, 0, 0, 0, C.SWP_NOMOVE | C.SWP_NOSIZE | C.SWP_NOZORDER | C.SWP_NOACTIVATE | C.SWP_FRAMECHANGED )
            } else {
                C.GetWindowPlacement( hwnd, &webview.window_placement )
                if webview.hwnd_style == 0 { webview.hwnd_style = C.GetWindowLong(hwnd, C.GWL_STYLE) }
                mut new_hwnd_style:=webview.hwnd_style
                new_hwnd_style &= ~(C.WS_CAPTION | C.WS_THICKFRAME)
                C.SetWindowLong( hwnd, C.GWL_STYLE, new_hwnd_style )
                C.SetWindowPos( hwnd, C.NULL, 0, 0, 0, 0, C.SWP_NOMOVE | C.SWP_NOSIZE | C.SWP_NOZORDER | C.SWP_NOACTIVATE | C.SWP_FRAMECHANGED )
            }
        } $else {
            println("[WARN]: Window.set_decorated not implemented on this os")
        }
    }
}

fn C.js_window_is_decorated(&char, &char, &WebviewManager)
[export:"js_window_is_decorated"]
fn js_window_is_decorated(seq &char, req &char, webview &WebviewManager){
    unsafe{
        $if linux {
            C.webview_return(webview.webview, seq, 0, cstr(C.gtk_window_get_decorated(C.webview_get_window(webview.webview)).str()))
		} $else $if windows {
            C.webview_return(webview.webview, seq, 0, cstr(webview.is_decorated.str()))
        } $else {
            println("[WARN]: Window.is_decorated not implemented on this os")
        }
    }
}

fn C.js_window_close(&char, &char, &WebviewManager)
[export:"js_window_close"]
fn js_window_close(seq &char, req &char, webview &WebviewManager){
    unsafe{
        $if linux {
            C.gtk_window_close(C.webview_get_window(webview.webview))
		} $else $if windows {
            C.DestroyWindow(C.webview_get_window(webview.webview))
        } $else {
            println("[WARN]: Window.close not implemented on this os")
        }
    }
}

fn C.js_window_set_resizable(&char, &char, &WebviewManager)
[export:"js_window_set_resizable"]
fn js_window_set_resizable(seq &char, req &char, webview &WebviewManager){
    unsafe{
        $if linux {
            details:=json.decode([]string,req.vstring())or{return}
            C.gtk_window_set_resizable(C.webview_get_window(webview.webview),details[0]=="true")
		} $else {
            println("[WARN]: Window.set_resizable not implemented on this os")
        }
    }
}

fn C.js_window_set_always_on_top(&char, &char, &WebviewManager)
[export:"js_window_set_always_on_top"]
fn js_window_set_always_on_top(seq &char, req &char, webview &WebviewManager){
    unsafe{
        $if linux {
            details:=json.decode([]string,req.vstring())or{return}
            C.gtk_window_set_keep_above(C.webview_get_window(webview.webview),details[0]=="true")
            webview.is_always_on_top=details[0]=="true"
		} $else $if windows {
            details:=json.decode([]string,req.vstring())or{return}
            mut hwnd:=C.webview_get_window(webview.webview)
            webview.is_always_on_top=details[0]=="true"
            if webview.is_always_on_top{
                C.SetWindowPos( hwnd, C.HWND_TOPMOST,
                    0, 0, 0, 0, C.SWP_NOMOVE | C.SWP_NOSIZE )
            } else {
                C.SetWindowPos( hwnd, C.HWND_NOTOPMOST,
                    0, 0, 0, 0, C.SWP_NOMOVE | C.SWP_NOSIZE )
            }
		} $else {
            println("[WARN]: Window.set_always_on_top not implemented on this os")
        }
    }
}

fn C.js_window_is_always_on_top(&char, &char, &WebviewManager)
[export:"js_window_is_always_on_top"]
fn js_window_is_always_on_top(seq &char, req &char, webview &WebviewManager){
    unsafe{
        C.webview_return(webview.webview, seq, 0, cstr(webview.is_always_on_top.str()))
    }
}

fn C.js_window_set_icon(&char, &char, &WebviewManager)
[export:"js_window_set_icon"]
fn js_window_set_icon(seq &char, req &char, webview &WebviewManager){
    unsafe{
        $if linux {
            details:=json.decode([]string,req.vstring())or{return}
            pixbuf := C.gdk_pixbuf_new_from_file(cstr(details[0]), C.NULL)
            C.gtk_window_set_icon(C.webview_get_window(webview.webview), pixbuf)
        } $else $if windows {
            details:=json.decode([]string,req.vstring())or{return}
            C.SetPngIconForWindow(C.webview_get_window(webview.webview), cstr(details[0]))
        } $else {
            println("[WARN]: Window.set_icon not implemented on this os")
        }
    }
}

fn C.js_window_focus(&char, &char, &WebviewManager)
[export:"js_window_focus"]
fn js_window_focus(seq &char, req &char, webview &WebviewManager){
    unsafe{
        $if linux {
            C.gtk_window_present(C.webview_get_window(webview.webview))
        } $else $if windows {
            C.SetForegroundWindow(C.webview_get_window(webview.webview))
        } $else {
            println("[WARN]: Window.focus not implemented on this os")
        }
    }
}

fn C.js_window_resize(&char, &char, &WebviewManager)
[export:"js_window_resize"]
fn js_window_resize(seq &char, req &char, webview &WebviewManager){
    unsafe{
        details:=json.decode([]string,req.vstring())or{return}
        $if linux {
            C.gtk_window_resize(C.webview_get_window(webview.webview), details[0].int(), details[1].int())
        } $else $if windows {
            mut hwnd:=C.webview_get_window(webview.webview)
            rect:=C.RECT{}
            C.GetWindowRect(hwnd, &rect)
            C.MoveWindow( hwnd, rect.left, rect.top, details[0].int(), details[1].int(), true)
        } $else {
            println("[WARN]: Window.resize not implemented on this os")
        }
    }
}

fn C.js_window_resize_by(&char, &char, &WebviewManager)
[export:"js_window_resize_by"]
fn js_window_resize_by(seq &char, req &char, webview &WebviewManager){
    unsafe{
        details:=json.decode([]string,req.vstring())or{return}
        $if linux {
            mut w, mut h:=0, 0
            C.gtk_window_get_size(C.webview_get_window(webview.webview), &w, &h)
            C.gtk_window_resize(C.webview_get_window(webview.webview), details[0].int()+w, details[1].int()+h)
        } $else $if windows {
            mut hwnd:=C.webview_get_window(webview.webview)
            rect:=C.RECT{}
            C.GetWindowRect(hwnd, &rect)
            C.MoveWindow( hwnd, rect.left, rect.top, rect.right-rect.left+details[0].int(), rect.bottom-rect.top+details[1].int(), true)
        } $else  {
            println("[WARN]: Window.resize_by not implemented on this os")
        }
    }
}

fn C.js_window_get_title(&char, &char, &WebviewManager)
[export:"js_window_get_title"]
fn js_window_get_title(seq &char, req &char, webview &WebviewManager){
    unsafe{
        $if linux {
            C.webview_return(webview.webview, seq, 0, vstring_to_jsstring(C.gtk_window_get_title(C.webview_get_window(webview.webview)).vstring()))
		} $else $if windows {
            C.webview_return(webview.webview, seq, 0, vstring_to_jsstring(webview.title))
        } $else {
            println("[WARN]: Window.get_title not implemented on this os")
        }
    }
}

fn C.js_window_set_progress(&char, &char, &WebviewManager)
[export:"js_window_set_progress"]
fn js_window_set_progress(seq &char, req &char, webview &WebviewManager){
    unsafe{
        $if linux {
            println("[WARN]: Don't call Window.set_progress on Linux")
		} $else $if windows {
            details:=json.decode([]string,req.vstring())or{return}
            C.SetProgressValue(C.webview_get_window(webview.webview), details[0].int())
            C.webview_return(webview.webview, seq, 0, cstr("true"))
        } $else {
            println("[WARN]: Window.set_progress not implemented on this os")
        }
    }
}

fn C.js_window_clear_progress(&char, &char, &WebviewManager)
[export:"js_window_clear_progress"]
fn js_window_clear_progress(seq &char, req &char, webview &WebviewManager){
    unsafe{
        $if linux {
            println("[WARN]: Don't call Window.clear_progress on Linux")
		} $else $if windows {
            C.ClearProgress(C.webview_get_window(webview.webview))
            C.webview_return(webview.webview, seq, 0, cstr("true"))
        } $else {
            println("[WARN]: Window.clear_progress not implemented on this os")
        }
    }
}
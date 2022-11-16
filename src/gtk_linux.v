module main

#include <gtk/gtk.h>

fn C.gtk_window_maximize(voidptr)
fn C.gtk_window_unmaximize(voidptr)
fn C.gtk_window_iconify(voidptr) //for minimize
fn C.gtk_window_deiconify(voidptr)
fn C.gtk_window_fullscreen(voidptr)
fn C.gtk_window_unfullscreen(voidptr)
fn C.gtk_window_close(voidptr)
fn C.gtk_window_is_maximized(voidptr) bool
fn C.gtk_window_set_decorated(voidptr, bool) //for border
fn C.gtk_window_set_keep_above(voidptr, bool) //for ontop
fn C.gtk_window_move(voidptr, int, int)
fn C.gtk_window_get_position(voidptr, &int, &int)
fn C.g_signal_connect(voidptr, &char, fn (&WebviewManager), &voidptr)
fn C.gtk_init(int, voidptr)
fn C.gtk_events_pending() bool
fn C.gtk_main_iteration()
fn C.gtk_window_get_decorated(voidptr) bool
fn C.gtk_window_set_resizable(voidptr, bool)
fn C.gdk_pixbuf_new_from_file(&char, &voidptr) &C.GdkPixbuf
fn C.gtk_window_set_icon(voidptr, C.GdkPixbuf)
fn C.gtk_window_present(voidptr)
fn C.gtk_window_resize(voidptr, int, int)
fn C.gtk_window_get_title(voidptr) &char
fn C.gtk_window_get_size(voidptr, &int, &int)
fn C.keybinder_init()
fn C.keybinder_bind(&char, fn(&char, voidptr), voidptr)
fn C.keybinder_unbind(&char, fn(&char, voidptr))
fn C.putenv(&char) int

fn C.close_webview_event(&WebviewManager)
[export:"close_webview_event"]
fn close_webview_event(webview &WebviewManager) {
	unsafe {
        active_window_count--
	}
}

module main

import clipboard

#include <windows.h>

fn C.ShowWindow(voidptr, int)
fn C.IsZoomed(voidptr) bool
fn C.GetWindowPlacement(voidptr, &voidptr)
fn C.SetWindowPlacement(voidptr, &voidptr)
fn C.GetWindowLong(voidptr, int) int
fn C.SetWindowLong(voidptr, voidptr, int)
fn C.MoveWindow(voidptr, int, int, int, int, bool)
fn C.GetWindowRect(voidptr, &C.RECT)
fn C._putenv(&char) int
fn C.SetWindowPos(voidptr, voidptr, int, int, int, int, int)
fn C.DestroyWindow(voidptr) int
fn C.SetForegroundWindow(voidptr)
fn C.SetPngIconForWindow(voidptr, &char)
fn C.SetProgressValue(voidptr, int)
fn C.ClearProgress(voidptr)

[typedef]
struct C.RECT{
    right   int
    left    int
    bottom  int
    top     int
}

fn win_clipboard_set(text string) bool {
    mut clip:=clipboard.new()
    result:=clip.copy(text)
    clip.destroy()
    return result
}

fn win_clipboard_get() string {
    mut clip:=clipboard.new()
    result:=clip.get_text()
    clip.destroy()
    return result
}
module main

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

[typedef]
struct C.RECT{
    right   int
    left    int
    bottom  int
    top     int
}

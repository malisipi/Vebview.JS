# vebview.window

## .set_title(title?)

Sets title of window. If title parameter was empty, clears title of window.

## .maximize()

## .minimize()

## .unmaximize()

## .unminimize()

## .fullscreen()

## .is_maximized() bool

## .move(x?, y?)

Moves window to x, y.

> You should use all parameters.

## .move_by(x?, y?)

Moves window to x, y as relative.

## .is_fullscreen() bool

## .new() 

> Work in Progress (Will be changed behavior in future). You should don't use the function until finish.

## .set_decoration(bool)

Sets decoration of window.

## .toggle_maximize()

## .toggle_fullscreen()

## .close()

## .set_resizable(bool)

Sets resizability of window.

> If window doesn't have decoration, if will not work. If you want to have resizable borderless window, look at [Borderless Window](../../tips/borderless/)

## .set_always_on_top(bool)

## .is_always_on_top() bool

## .toggle_always_on_top()

## .set_icon(file, exts?)

Sets windows icon. Exts parameter is extension of file for operating system (Windows: .ico, Linux: .png).

```
- app_icon.png
- app_icon.ico

.set_icon("app_icon")
```

> If you want to set icon from website, you should download first. [`http.download`](../http/#download)

## .focus()

## .resize(x?, y?)

Resizes window to x, y.

> You should use all parameters.

## .resize_by(x?, y?)

Resizes window to x, y as relative.

## .is_decorated() bool

## .get_title() string

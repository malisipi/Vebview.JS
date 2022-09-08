# app.config

```json
{
    "title":"Vebview.JS",
    "default_size":{
        "width":640,
        "height":480
    },
    "port":7001,
    "main_page":"index.html",
    "debug":false,
    "decorated":true,
    "maximized":false,
    "resizable":true,
    "localhost":true,
    "custom_backend":"",
    "cloud_loading":false,
    "mount_folder":"res"
}
```

> This json file should placed at `./app.config` or `./res/app.config`.

## Application Mode

If `"localhost":true`, sets application mode as `localhost`.
Else if `"custom_backend"!=""`, sets application mode as `custom backend`.
Else if `"cloud_loading":true`, sets application mode as `cloud loading`
Else, sets application mode as `"file://"`

> If your application uses `localhost` and works fine with `file://` protocol, you should use `file://` instead of `localhost`. Because `localhost` uses more power than `file://`.

## port

It's only required when you use `localhost`.

## mount_folder

`mount_folder` sets the folder as root in `localhost` and `file://`. Else, it's useless.

## main_page

If you use `localhost` or `file://`, `main_page` should be relative (like `index.html`), else if you use `cloud loading` or `custom backend`, `main_page` should be full path (like `http://localhost:8000/index.html`).

## debug

`debug` allows open to developer tools.

## resizable

It's useless when you use `"decorated":false`.

## decorated

If you want to make borderless window, you should look [tips](../tips/borderless/).

## custom_backend

If you want to external server for application, write into custom_backend (like `python3 -m http.server`).

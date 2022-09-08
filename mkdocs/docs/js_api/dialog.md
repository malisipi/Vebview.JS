# vebview.dialog

## .messagebox({title?, message?, icon?, type?}) result

* title: Title of messagebox
* message: Message of messagebox
* icon: Icon of messagebox as [vebview.dialog.icon](#icon)
* type: Type of messagebox as [vebview.dialog.type](#type)
* result: Result as [vebview.dialog.result](#result)

## .inputbox({title?, message?, default_text?}) string

* title: Title of inputbox
* message: Message of inputbox
* default_text: Default text of inputbox

## .passwordbox({title?, message?}) string

* title: Title of passwordbox
* message: Message of passwordbox

## .colorchooser({title?, default_color?}) string

* title: Title of colorchooser
* default_color: Default color of colorchooser as string like "#123456"
* (result): String like "#123456"

## .openfiledialog({title?}) string

* title: Title of openfiledialog

## .savefiledialog({title?}) string

* title: Title of savefiledialog

## .selectfolderdialog({title?}) string

* title: Title of selectfolderdialog

## .notifypopup({title?, message?, icon?})

* title: Title of notifypopup
* message: Message of notifypopup
* icon: Icon of notifypopup as [vebview.dialog.icon](#icon)

## .icon

* .INFO
* .WARN
* .ERROR

## .type

* .OK
* .OK_CANCEL
* .YES_NO
* .YES_NO_CANCEL

## .result

* .OK
* .YES
* .NO
* .CANCEL

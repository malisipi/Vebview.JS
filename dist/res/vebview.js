if(window["c2VydmVyX3ZlcnNpb24="]==null){
    console.warn("This library designed for Vebview.JS");
} else {

const vebview={
    name:"Vebview.JS",
    ver:{
        client:"0.0.1",
        server:"0.0.0"
    },
    dialog:{
        messagebox:async ({title="", message="", icon=vebview.dialog.icon.INFO, type=vebview.dialog.type.OK})=>{
            result=await window["bWVzc2FnZWJveA=="](title, message, type, icon);
            if(type==vebview.dialog.type.OK || type==vebview.dialog.type.OK_CANCEL){
                return [vebview.dialog.result.CANCEL,vebview.dialog.result.OK][result];
            } else if(type==vebview.dialog.type.YES_NO){
                return [vebview.dialog.result.NO,vebview.dialog.result.YES][result];
            } else if(type==vebview.dialog.type.YES_NO_CANCEL){
                return [vebview.dialog.result.CANCEL,vebview.dialog.result.YES,vebview.dialog.result.NO][result];
            }
        },
        inputbox:async ({title="", message="", default_text=""})=>{
            return await window["aW5wdXRib3g="](title, message, default_text);
        },
        passwordbox:async ({title="", message=""})=>{
            return await window["cGFzc3dvcmRib3g="](title, message);
        },
        colorchooser:async ({title="", default_color=""})=>{
            return await window["Y29sb3JjaG9vc2Vy"](title, default_color);
        },
        openfiledialog:async ({title=""})=>{
            return await window["b3BlbmZpbGVkaWFsb2c="](title);
        },
        savefiledialog:async ({title=""})=>{
            return await window["c2F2ZWZpbGVkaWFsb2c="](title);
        },
        selectfolderdialog:async ({title=""})=>{
            return await window["c2VsZWN0Zm9sZGVyZGlhbG9n"](title);
        },
        notifypopup:async ({title="", message="", icon=""})=>{
            return await window["bm90aWZ5cG9wdXA="](title, message, icon);
        },
        type:{
            OK:"ok",
            OK_CANCEL:"okcancel",
            YES_NO:"yesno",
            YES_NO_CANCEL:"yesnocancel"
        },
        icon:{
            INFO:"info",
            WARN:"warn",
            ERROR:"error"
        },
        result:{
            OK:1,
            YES:1,
            CANCEL:0,
            NO:2
        }
    },
    fs:{
        read_file:async (file="")=>{
            if(file=="") return false;
            return await window["cmVhZF9maWxl"](file);
        },
        write_file:async (file="",data="")=>{
            if(file=="") return false;
            return await window["d3JpdGVfZmlsZQ=="](file, data);
        },
        append_file:async (file="",data="")=>{
            if(file=="") return false;
            return await window["YXBwZW5kX2ZpbGU="](file, data);
        },
        remove_file:async (file="")=>{
            if(file=="") return false;
            return await window["cmVtb3ZlX2ZpbGU="](file);
        },
        move_file:async (file_a="",file_b="")=>{
            if(file_a=="" || file_b=="") return false;
            return await window["bW92ZV9maWxl"](file_a,file_b);
        },
        copy_file:async (file_a="",file_b="")=>{
            if(file_a=="" || file_b=="") return false;
            return await window["Y29weV9maWxl"](file_a,file_b);
        },
        read_dir:async (dir="")=>{
            if(dir=="") return false;
            return JSON.parse(
                await window["cmVhZF9kaXJlY3Rvcnk="](dir)
            );
        },
        create_dir:async (dir="")=>{
            if(dir=="") return false;
            return JSON.parse(
                await window["Y3JlYXRlX2RpcmVjdG9yeQ=="](dir)
            );
        },
        remove_dir:async (dir="")=>{
            if(dir=="") return false;
            return JSON.parse(
                await window["cmVtb3ZlX2RpcmVjdG9yeQ=="](dir)
            );
        },
        get_stats:async (file_or_directory_path="")=>{
            return JSON.parse(
                await window["Z2V0X3N0YXRz"](file_or_directory_path)
            );
        }
    },
    os:{
        get_version:async ()=>{
            return await window["b3NfdmVyc2lvbg=="]();
        },
        open_in_browser:async (url="")=>{
            if(url=="") return false;
            await window["b3Blbl9pbl9icm93c2Vy"](url);
        },
        os_versions:{
            WINDOWS:0,
            LINUX:1,
            UNKNOWN:9
        }
    },
    storage:{
        set:async (key="",value="")=>{
            if(key=="") return;
            await window["c3RvcmFnZV9zZXQ="](String(key),JSON.stringify(value));
        },
        get:async (key="")=>{
            if(key=="") return;
            return JSON.parse(await window["c3RvcmFnZV9nZXQ="](String(key)));
        },
    },
    window:{
        set_title:(title="")=>{
            window["c2V0X3RpdGxl"](String(title));
            if(vebview._._assign._title!=null){
                vebview._._assign._title.innerText=String(title);
            }
        },
        maximize:async ()=>{
            await window["d2luZG93X21heGltaXpl"]();
        },
        unmaximize:async ()=>{
            await window["d2luZG93X3VubWF4aW1pemU="]();
        },
        minimize:async ()=>{
            await window["d2luZG93X21pbmltaXpl"]();
        },
        unminimize:async ()=>{
            await window["d2luZG93X3VubWluaW1pemU="]();
        },
        fullscreen:async ()=>{
            await window["d2luZG93X2Z1bGxzY3JlZW4="]();
        },
        unfullscreen:async ()=>{
            await window["d2luZG93X3VuZnVsbHNjcmVlbg=="]();
        },
        is_maximized:async ()=>{
            return await window["d2luZG93X2lzX21heGltaXplZA=="]();
        },
        move:async (x, y)=>{
            await window["d2luZG93X21vdmU="](String(x),String(y));
        },
        move_by:async (x, y)=>{
            await window["d2luZG93X21vdmVfYnk="](String(x),String(y));
        },
        is_fullscreen:async ()=>{
            return await window["d2luZG93X2lzX2Z1bGxzY3JlZW4="]();
        },
        new:window["d2luZG93X25ldw=="],
        set_decoration:async (active=true)=>{
            await window["d2luZG93X3NldF9kZWNvcmF0ZWQ="](String(active));
        },
        toggle_maximize:async ()=>{
            if(await vebview.window.is_maximized()){
                await vebview.window.unmaximize();
            } else {
                await vebview.window.maximize();
            }
        },
        toggle_fullscreen:async ()=>{
            if(await vebview.window.is_fullscreen()){
                await vebview.window.unfullscreen();
            } else {
                await vebview.window.fullscreen();
            }
        },
        close:async ()=>{
            window["d2luZG93X2Nsb3Nl"]();
        },
        set_resizable:async (active=true)=>{
            await window["d2luZG93X3NldF9yZXNpemFibGU="](String(active));
        },
        set_always_on_top:async (active=false)=>{
            await window["d2luZG93X3NldF9hbHdheXNfb25fdG9w"](String(active));
        },
        is_always_on_top:async ()=>{
            return await window["d2luZG93X2lzX2Fsd2F5c19vbl90b3A="]()
        },
        toggle_always_on_top:async ()=>{
            await vebview.window.set_always_on_top(!(await vebview.window.is_always_on_top()))
        },
        set_icon:async (file="",exts=[".ico",".png"])=>{
            if(file!=""){
                if(await vebview.os.get_version()==vebview.os.os_versions.WINDOWS){
                    await window["d2luZG93X3NldF9pY29u"](file+exts[0]);
                } else {
                    await window["d2luZG93X3NldF9pY29u"](file+exts[1]);
                }
            }
        },
        focus:async ()=>{
            await window["d2luZG93X2ZvY3Vz"]();
        },
        resize:async (width=800, height=600)=>{
            await window["d2luZG93X3Jlc2l6ZQ=="](String(width), String(height));
        },
        resize_by:async (width=0, height=0)=>{
            await window["d2luZG93X3Jlc2l6ZV9ieQ=="](String(width), String(height));
        },
        is_decorated:async ()=>{
            return await window["d2luZG93X2lzX2RlY29yYXRlZA=="]();
        },
        get_title:async ()=>{
            return await window["d2luZG93X2dldF90aXRsZQ=="]();
        }
    },
    http:{
        request:async (site="")=>{
            return await window["aHR0cF9yZXF1ZXN0"](site);
        },
        webview:{
            render:async (object="",site="")=>{
                if(object!="" && site!=""){
                    if(object.tagName.toLowerCase()!="iframe"){console.warn("Object isn't a iframe");return}
                    object.setAttribute("_vebview_src",site)
                    object.setAttribute("sandbox","allow-same-origin allow-popups allow-forms")
                    object.srcdoc="<base href=\""+site+"\">";
                    object.onload=async (e)=>{
                        /*e.target.contentWindow.onsubmit=(e)=>{
                            parent.vebview.http.webview.render(
                                parent.document.querySelector("iframe"),
                                e.target.action+"?"+(new URLSearchParams(new FormData(e.target))).toString()
                            );
                            return false;
                        }*/
                        e.target.contentDocument.body.innerHTML=await vebview.http.request(e.target.getAttribute("_vebview_src"));
                        e.target.onload=undefined;
                    }
                } else {
                    console.warn("Object or site is missing")
                }
            }
        }
    },
    assign:{
        title:async (obj)=>{
            vebview._._assign._title=obj;
            vebview._._assign._title.innerText=await vebview.window.get_title();
        }
    },
    unassign:{
        title:(obj)=>{vebview._._assign._title=null;}
    },
    _:{
        _app_region:{
            _click:false,
            _x:0,
            _y:0
        },
        _assign:{
            _title:null
        }
    }
}

window["c2VydmVyX3ZlcnNpb24="]().then(ver => {
    vebview.ver.server=ver;
    if(vebview.ver.client!=vebview.ver.server){
        console.error("You use different versions of vebview.js client and server. You should use same version of client and server to prevent crashes.");
    }
})

document.onmousedown=(e)=>{
    if(e.target.getAttribute("app-region")=="drag"){
        vebview._._app_region._click="drag";
        vebview._._app_region._x=e.pageX;
        vebview._._app_region._y=e.pageY;
        document.body.setAttribute("_vebview_app_region_mouse_move","true");
        return false;
    } else if(e.target.getAttribute("app-region")=="nw-resize"){
        vebview._._app_region._click="nw-resize";
        vebview._._app_region._x=[window.innerWidth,e.pageX];
        vebview._._app_region._y=[window.innerHeight,e.pageY];
        document.body.setAttribute("_vebview_app_region_mouse_move","true");
        return false;
    }
}

document.onmousemove=(e)=>{
    if(vebview._._app_region._click=="drag"){
        vebview.window.move(e.screenX-vebview._._app_region._x, e.screenY-vebview._._app_region._y);
        return false;
    } else if(vebview._._app_region._click=="nw-resize"){
        vebview.window.resize(
            vebview._._app_region._x[0]+(e.pageX-vebview._._app_region._x[1]),
            vebview._._app_region._y[0]+(e.pageY-vebview._._app_region._y[1])
        );
        return false;
    }
}

document.onmouseup=()=>{
    document.body.setAttribute("_vebview_app_region_mouse_move","false");
    vebview._._app_region._click=false;
}

window["vebview"]=vebview;

}
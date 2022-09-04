module main

import json
import net.http

fn C.js_http_request(&char, &char, &WebviewManager)
[export:"js_http_request"]
fn js_http_request(seq &char, req &char, webview &WebviewManager){
    unsafe{
		details:=json.decode([]string,req.vstring())or{return}
		mut request:=http.new_request(.get,details[0],"")or{
			C.webview_return(webview.webview, seq, 0, vstring_to_jsstring(""))
			return
		}
		request.header.add(.user_agent,"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36")
		response:=request.do()or{
			C.webview_return(webview.webview, seq, 0, vstring_to_jsstring(""))
			return
		}
        C.webview_return(webview.webview, seq, 0, vstring_to_jsstring(response.body))
    }
}
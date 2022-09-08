clear
mkdir build
x86_64-w64-mingw32-g++ -c libs/webview/webview.cc -std=c++17 -I "libs/webview2/build/native/include" -I "$W10_SDK/winrt/" -o build/webview.o
v -gc none src -enable-globals -o build/vebview.c -os windows
x86_64-w64-mingw32-gcc -c build/vebview.c -std=gnu99 -o build/vebview.o -I "libs/tinyfd" -I "libs/webview" -I "$V_LOC/thirdparty/vschannel/" -I "$V_LOC/thirdparty/cJSON/" -lpthread -lssl -lcrypto -ldl -lpthread -municode -ldbghelp -ladvapi32 -lws2_32 -lcrypt32 -lsecur32 -luser32 -lurlmon
x86_64-w64-mingw32-gcc -c "$V_LOC/thirdparty/cJSON/cJSON.c" -std=c99 -o build/cJSON.o
x86_64-w64-mingw32-gcc -c libs/tinyfd/tinyfiledialogs.c -std=c99 -o build/tinyfd.o
x86_64-w64-mingw32-windres src/app_info.rc -O coff -o build/app_info.res
cp "libs/webview2/build/native/x64/WebView2Loader.dll" "dist/WebView2Loader.dll"
x86_64-w64-mingw32-g++ build/vebview.o build/webview.o build/cJSON.o build/tinyfd.o build/app_info.res -I "libs/tinyfd" -I "libs/webview" -Ilibs/webview2/build/native/include  -L "libs/webview2/build/native/x64" -I "$W10_SDK/winrt/" -I "$V_LOC/thirdparty/cJSON/" -lpthread -lpthread  -lcrypt32 -lwsock32 -lws2_32 -lole32 -loleaut32 -lsecur32 -lshell32 -lshlwapi -luser32 -lWebView2Loader.dll -municode -lcomdlg32 -o ./dist/vebview.exe -municode -ldbghelp -ladvapi32 -lws2_32 -lcrypt32 -lsecur32 -luser32 -lurlmon -mwindows
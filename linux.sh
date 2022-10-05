clear
mkdir build
g++ -c libs/webview/webview.cc -std=c++11 $(pkg-config --cflags gtk+-3.0 webkit2gtk-4.0) -o build/webview.o
v -gc none src/ -enable-globals -o build/vebview.c
gcc -c build/vebview.c -std=gnu99 -o build/vebview.o -I "libs/tinyfd" -I "libs/webview" -I "$V_LOC/thirdparty/cJSON/" $(pkg-config --cflags gtk+-3.0 webkit2gtk-4.0 x11) -I "libs/libkeybinder" -I "$V_LOC/thirdparty/mbedtls/library" -I "$V_LOC/thirdparty/mbedtls/include" -I "$V_LOC/thirdparty/mbedtls/3rdparty/everest/include" -I "$V_LOC/thirdparty/mbedtls/3rdparty/everest/include/everest" -I "$V_LOC/thirdparty/mbedtls/3rdparty/everest/include/everest/kremlib"
gcc -c "$V_LOC/thirdparty/cJSON/cJSON.c" -std=c99 -o build/cJSON.o
gcc -c libs/tinyfd/tinyfiledialogs.c -std=c99 -o build/tinyfd.o
gcc -c libs/libkeybinder/bind.c -std=c99 -o build/keybinder.o  $(pkg-config --cflags gtk+-3.0 x11) 
mkdir build/mbedtls
mbedtls_flags=""
library="/library"
for f in $V_LOC/thirdparty/mbedtls/library/*.c; do gcc -c "$f" -std=c99 -o "build/mbedtls/$(basename -a "$f").o" -I "$V_LOC/thirdparty/mbedtls/library" -I "$V_LOC/thirdparty/mbedtls/include" -I "$V_LOC/thirdparty/mbedtls/3rdparty/everest/include" -I "$V_LOC/thirdparty/mbedtls/3rdparty/everest/include/everest" -I "$V_LOC/thirdparty/mbedtls/3rdparty/everest/include/everest/kremlib"; done
for f in build/mbedtls/*.o; do mbedtls_flags+=" $f "; done
g++ build/vebview.o build/webview.o build/cJSON.o build/tinyfd.o build/keybinder.o $mbedtls_flags $(pkg-config --libs gtk+-3.0 webkit2gtk-4.0 x11) -I "libs/libkeybinder" -I "libs/tinyfd" -I "libs/webview" -I "$V_LOC/thirdparty/cJSON/" -o dist/vebview
upx --lzma --overlay=strip dist/vebview
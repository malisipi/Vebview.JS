clear
mkdir build
g++ -c libs/webview/webview.cc -std=c++11 $(pkg-config --cflags gtk+-3.0 webkit2gtk-4.0) -o build/webview.o
v -gc none src/ -enable-globals -o build/vebview.c
gcc -c build/vebview.c -std=gnu99 -o build/vebview.o -I "/usr/include" -L "/usr/lib" -I "/usr/local/include/openssl" -I "libs/tinyfd" -I "libs/webview" -I "$V_LOC/thirdparty/cJSON/" -lpthread -lssl -lcrypto -ldl -lpthread $(pkg-config --cflags gtk+-3.0 webkit2gtk-4.0)
gcc -c "$V_LOC/thirdparty/cJSON/cJSON.c" -std=c99 -o build/cJSON.o
gcc -c libs/tinyfd/tinyfiledialogs.c -std=c99 -o build/tinyfd.o
g++ build/vebview.o build/webview.o build/cJSON.o build/tinyfd.o $(pkg-config --libs gtk+-3.0 webkit2gtk-4.0) -I "libs/tinyfd" -I "libs/webview" -I "$V_LOC/thirdparty/cJSON/" -I "/usr/include" -L "/usr/lib" -I "/usr/local/include/openssl" -lpthread -lssl -lcrypto -ldl -lpthread -o dist/vebview
upx --lzma --overlay=strip dist/vebview

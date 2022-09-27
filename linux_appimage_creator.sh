rm -rdf appimage
mkdir appimage
wget -nc "https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage"
chmod a+x appimagetool-x86_64.AppImage
echo -n "App Name:"
read app_name
echo -n "Icon Location (.png): ./dist/"
read icon_location
cp -rdf dist/[!webview]*[!.dll] appimage/
echo "[Desktop Entry]
Name=${app_name}
Exec=vebview
Icon=vebview
Type=Application
Categories=Utility;" >> appimage/vebview.desktop
cp dist/vebview appimage/AppRun
cp "dist/${icon_location}" "appimage/vebview.png"
chmod a+x appimage/AppRun
ARCH=x86_64 ./appimagetool-x86_64.AppImage appimage

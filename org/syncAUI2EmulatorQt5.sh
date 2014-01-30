# This script syncs abstractui files from the localhost to the Sailfish Emulator
# and then sets owners and rights

# make this script executable with chmod 755 syncAUI2EmulatorQt5.sh 
# cd ~/SailfishProjects/abstractui
# call it with ./syncAUI2EmulatorQt5.sh

cp -p build-abstractui-MerSDK_SailfishOS_i486_x86-Debug/*.so org/flyingsheep/abstractui/ && \
cp -p build-abstractuibackend-MerSDK_SailfishOS_i486_x86-Debug/*.so org/flyingsheep/abstractui/backend/ && \
rsync -avz -e "ssh -p 2223 -i $HOME/SailfishOS/vmshare/ssh/private_keys/SailfishOS_Emulator/root" org root@localhost:/usr/lib/qt5/qml/ --exclude .DS_Store \
&& \
ssh -p 2223 -i ~/SailfishOS/vmshare/ssh/private_keys/SailfishOS_Emulator/root root@localhost "cd /usr/lib/qt5/qml/ && \
chown -R root:root org && \
cd org/flyingsheep/abstractui && \
chmod 755 *.so && \
chmod 644 *.qml &&  \
chmod 644 qmldir &&  \
ls -ahl && \
cd backend && \
chmod 755 *.so && \
chmod 644 *.qml &&  \
chmod 644 qmldir &&  \
ls -ahl && \
exit  \
; bash"
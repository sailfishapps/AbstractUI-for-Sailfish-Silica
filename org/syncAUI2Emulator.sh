# This script syncs abstractui files from the localhost to the Sailfish Emulator
# and then sets owners and rights

# make this script executable with chmod 755 syncAUI2Emulator.sh 
# call it with ./syncAUI2Emulator.sh

rsync -avz -e "ssh -p 2223 -i $HOME/.ssh/mer-qt-creator-rsa" flyingsheep root@localhost:/usr/lib/qt4/imports/org/ --exclude .DS_Store \
&& \
ssh -p 2223 -i ~/.ssh/mer-qt-creator-rsa root@localhost "cd /usr/lib/qt4/imports/org/ && \
chown -R root:root flyingsheep && \
cd flyingsheep/abstractui && \
chmod 755 *.so && \
chmod 644 *.qml &&  \
chmod 644 qmldir &&  \
ls -ahl && \
exit  \
; bash"
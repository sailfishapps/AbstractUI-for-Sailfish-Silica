# This script syncs abstractui files from the localhost to the Sailfish Jolla Device amr7hl
# and then sets owners and rights

# make this script executable with chmod 755 syncAUI2JollaQt5.sh 
# cd ~/SailfishProjects/abstractui
# call it with ./syncAUI2JollaQt5.sh


# As ssh via root is blocked (unlike the Emulator) this script tranfers to a directory in in /home/nemo/tempimports/org/flyingsheep
# The proper install location (/usr/lib/qt5/qml/org/flyingsheep) is actually a soft link pointing to /home/nemo/tempimports/org/flyingsheep
# Before running this script ssh into the Jolla and run the following commands

# On the Jolla device:
# mkdir /home/nemo/tempimports
# mkdir /home/nemo/tempimports/org
# mkdir /home/nemo/tempimports/org/flyingsheep
# devel-su
# ln -s /home/nemo/tempimports/org/flyingsheep /usr/lib/qt5/qml/org/flyingsheep

cp -p build-abstractui-MerSDK_SailfishOS_armv7hl-Debug/*.so org/flyingsheep/abstractui/ && \
cp -p build-abstractuibackend-MerSDK_SailfishOS_armv7hl-Debug/*.so org/flyingsheep/abstractui/backend/ && \
rsync -avz -e "ssh -p 22 -i $HOME/.ssh/jolla_rsa" org nemo@192.168.2.17:/home/nemo/tempimports/ --exclude .DS_Store \
&& \
ssh -p 22 -i ~/.ssh/jolla_rsa nemo@192.168.2.17 "cd /usr/lib/qt5/qml/org/flyingsheep/abstractui && \
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

# As ssh via root is blocked (unlike the Emulator) this script tranfers to a directory in in /home/nemo/tempimports/org/flyingsheep
# The proper install location (/usr/lib/qt5/qml/org/flyingsheep) is actually a soft link pointing to /home/nemo/tempimports/org/flyingsheep
# Before running this script ssh into the Jolla and run the following commands

# On the Jolla device:
# mkdir /home/nemo/tempimports
# mkdir /home/nemo/tempimports/org
# mkdir /home/nemo/tempimports/org/flyingsheep
# devel-su
# ln -s /home/nemo/tempimports/org/flyingsheep /usr/lib/qt5/qml/org/flyingsheep
# SailfishOS version of the abstractui user interface components abstraction layer
TEMPLATE = lib
TARGET = abstractui
TARGET = $$qtLibraryTarget($$TARGET)
QT += declarative
CONFIG += qt plugin
# DEPLOYMENT_PATH = /opt/sdk/share/$$TARGET

SOURCES += \
    plugin.cpp

HEADERS += \
    auimdialogstatus.h \
    auimpagestatus.h \
    auimpageorientation.h \
    plugin.h


# DISPLAY QML FILES IN PROJECT: Work in Progress
# auiqmls is a symlink from the current directory($$PWD) to the directory containing the qmls
# The symlink was created from the current directory with:
# ln -s ../org/flyingsheep/abstractui/ auiqmls

OTHER_FILES += $$PWD/auiqmls/*.qml

# The .desktop file
desktop.files = abstractui.desktop

# Please do not modify the following line.
# include(sailfishapplication/sailfishapplication.pri)

OTHER_FILES += rpm/abstractui.yaml \
            rpm/abstractui.spec

TARGETPATH = /opt/sdk/bin
target.path = $$TARGETPATH

DEPLOYMENT_PATH = /opt/sdk/share/$$TARGET
qml.path = $$DEPLOYMENT_PATH
desktop.path = /opt/sdk/share/applications

contains(CONFIG, desktop) {
    DEFINES *= DESKTOP
    QT += opengl
}

INSTALLS += target qml desktop
DEFINES += DEPLOYMENT_PATH=\"\\\"\"$${DEPLOYMENT_PATH}/\"\\\"\"

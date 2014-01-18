TEMPLATE = lib
TARGET = abstractuibackend
QT += qml quick
CONFIG += qt plugin

TARGET = $$qtLibraryTarget($$TARGET)
uri = com.mycompany.qmlcomponents

# Input
SOURCES += \
    abstractuibackendplugin.cpp

HEADERS += \
    abstractuibackendplugin.h \
    auicontactdetailtype.h \
    auicontactnametype.h \
    auicontactfiltertype.h \
    auicontactmatchflagtype.h \
    auicontactblankpolicytype.h

# DISPLAY QML FILES IN PROJECT: Work in Progress
# auiqmls is a symlink from the current directory($$PWD) to the directory containing the qmls
# The symlink was created from the current directory with:
# cd ~/SailfishProjects/abstractui/abstractuibackend
# ln -s ../org/flyingsheep/abstractui/backend auiqmls


OTHER_FILES += $$PWD/auiqmls/*.qml

!equals(_PRO_FILE_PWD_, $$OUT_PWD) {
    copy_qmldir.target = $$OUT_PWD/qmldir
    copy_qmldir.depends = $$_PRO_FILE_PWD_/qmldir
    copy_qmldir.commands = $(COPY_FILE) \"$$replace(copy_qmldir.depends, /, $$QMAKE_DIR_SEP)\" \"$$replace(copy_qmldir.target, /, $$QMAKE_DIR_SEP)\"
    QMAKE_EXTRA_TARGETS += copy_qmldir
    PRE_TARGETDEPS += $$copy_qmldir.target
}

qmldir.files = qmldir
unix {
    installPath = $$[QT_INSTALL_QML]/$$replace(uri, \\., /)
    qmldir.path = $$installPath
    target.path = $$installPath
    INSTALLS += target qmldir
}


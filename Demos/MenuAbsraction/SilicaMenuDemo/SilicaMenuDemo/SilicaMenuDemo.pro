# The name of your app
TARGET = SilicaMenuDemo

# C++ sources
SOURCES += main.cpp

# C++ headers
HEADERS +=

# QML files and folders
qml.files = *.qml pages cover main.qml

# The .desktop file
desktop.files = SilicaMenuDemo.desktop

# Please do not modify the following line.
include(sailfishapplication/sailfishapplication.pri)

OTHER_FILES = rpm/SilicaMenuDemo.yaml


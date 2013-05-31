# The name of your app
TARGET = SilicaAbstractMenuDemo

# C++ sources
SOURCES += main.cpp

# C++ headers
HEADERS +=

# QML files and folders
qml.files = *.qml pages cover main.qml

# The .desktop file
desktop.files = SilicaAbstractMenuDemo.desktop

# Please do not modify the following line.
include(sailfishapplication/sailfishapplication.pri)

OTHER_FILES = rpm/SilicaAbstractMenuDemo.yaml


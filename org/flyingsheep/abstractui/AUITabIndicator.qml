import QtQuick 2.0
import Sailfish.Silica 1.0

//IconButton {
BackgroundItem {
    id: tabIndicator

    property alias text: label.text
    property alias iconSource: image.source
    property bool __selected
    property Item tab

    width: parent.width / parent.children.length

    Connections {
        target: tab.parent
        onCurrentTabChanged: __selected = tab.parent.currentTab == tab;
    }

    Image {
        id: image
        visible: source != null
        opacity: __selected ? 1 : 0.5
        anchors.centerIn: parent
    }

    Label {
        visible: (image != visible) && (text.length > 0)
        id: label
        text: ""
        color: Theme.secondaryHighlightColor
        font.pixelSize: Theme.fontSizeExtraLarge
        font.bold: __selected
        anchors.centerIn: parent
    }

    onClicked: {
        tab.parent.currentTab = tab;
    }
}

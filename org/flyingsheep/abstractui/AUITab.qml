import QtQuick 2.0
import Sailfish.Silica 1.0

Rectangle {
    id: tab
    visible: false
    color: "transparent"
    property bool activeTab: false
    onActiveTabChanged: {
        console.log ("activeTab changed: " + activeTab)
        console.log ("tab.visible: " + tab.visible)
        tab.visible = activeTab
        console.log ("tab.visible: " + tab.visible)
    }
}

import QtQuick 2.0
//import com.nokia.meego 1.0
import Sailfish.Silica 1.0

//Button as drawn by sailfish has a horrible look and feel

BackgroundItem {
    id: thisButton
    property color primaryColor: "black"
    property bool transparent: true

    property bool checked: false
    property bool checkable: false

    property alias text: label.text
    property url iconSource
    width: parent.width
    height: 120
    Label {
        id: label
        text: ""
        anchors.centerIn: parent
        color: thisButton.primaryColor
        visible: text != ""
    }

    Image {
        id: icon
        anchors.left: label.visible ? parent.left : undefined
        anchors.leftMargin: label.visible ? Theme.paddingLarge  : 0
        anchors.centerIn: label.visible ? undefined : parent
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -1
        source: thisButton.iconSource
        visible: source != ""
    }

    onPressed: {
        console.log("icon.visible: " + icon.visible);
        console.log("label.visible: " + label.visible);
    }
}

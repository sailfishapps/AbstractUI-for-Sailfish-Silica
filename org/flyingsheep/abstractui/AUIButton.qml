import QtQuick 2.0
//import com.nokia.meego 1.0
import Sailfish.Silica 1.0
import Sailfish.Silica.theme 1.0

/*
//Button as drawn by sailfish has a horrible look and feel
Button {
    //property Style platformStyle: ButtonStyle {}
    property AUIStyle platformStyle: null
    property url iconSource
    onClicked: console.log("button pressed")
}
*/

BackgroundItem {

    property alias text: thisLabel.text
    property AUIButtonStyle platformStyle: null
    property url iconSource
    width: parent.width
    height: 120
    Label {
        id: thisLabel
        text: "Hello Sailors"
        anchors.centerIn: parent
//TODO: Qt5
        //color: "white"
        color: platformStyle.textColor

    }

    onPlatformStyleChanged: {
        console.log("AUIButtonStyle changed to: " + platformStyle);
        console.log("AUIButtonStyle mainColor changed to: " + platformStyle.mainColor);
        console.log("AUIButtonStyle textColor changed to: " + platformStyle.textColor);
    }
}

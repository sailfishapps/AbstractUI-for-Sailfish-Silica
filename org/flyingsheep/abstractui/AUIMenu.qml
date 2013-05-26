import QtQuick 1.1
//import com.nokia.meego 1.0
import Sailfish.Silica 1.0

SilicaFlickable {

    property alias visualParent: pullDownMenu.visualParent;

    anchors.fill: parent

    PullDownMenu {
        id: pullDownMenu
        property Item visualParent
    }
}

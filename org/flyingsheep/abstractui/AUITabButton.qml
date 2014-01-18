import QtQuick 2.0
//import com.nokia.meego 1.0
import Sailfish.Silica 1.0

IconButton {

    property Item tab

    property url iconSource
    onIconSourceChanged: {
        icon.source = iconSource
    }
}

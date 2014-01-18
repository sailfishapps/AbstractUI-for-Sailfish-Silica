import QtQuick 2.0
//import com.nokia.meego 1.0
import Sailfish.Silica 1.0
import org.flyingsheep.abstractui 1.0

MouseArea {
    id: root

    width: parent ? parent.width : 0
    height: parent ? parent.height : 0

    property Item visualParent
    property int status: DialogStatus.Closed

    function open() {
        parent = visualParent || __findParent();
        //sheet.state = "";
    }

    function close() {
        //sheet.state = "closed";
    }

    function __findParent() {
        var next = parent;
        while (next && next.parent
               && next.objectName != "appWindowContent"
               && next.objectName != "windowContent") {
            next = next.parent;
        }
        return next;
    }
}

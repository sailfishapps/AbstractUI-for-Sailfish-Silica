import QtQuick 2.0
import Sailfish.Silica 1.0

Item {
    property Item currentTab

    onCurrentTabChanged: __setCurrentTab()

    function __setCurrentTab() {
        for ( var i = 0 ; i < children.length; i++ ) {
            if (children[i] == currentTab) {
                children[i].visible = true;
            }
            else {
                children[i].visible = false;
            }
        }
    }
}

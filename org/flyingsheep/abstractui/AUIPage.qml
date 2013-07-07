import QtQuick 1.1
//import com.nokia.meego 1.0
import Sailfish.Silica 1.0
import org.flyingsheep.abstractui 1.0

Page {
    property Item tools: null;
    property int orientationLock: AUIPageOrientation.Automatic

//We now have a dedicated AUIPageWithMenu element to support menus
//This element is used for Pages that do not require a menu
/*
    //MENU HANDLING
    //Basic idea for menu handling copied from THP
    //With the following differences:
    //1) simplified and condensed
    //2) we also provide the ListView as a child of the Page, rather than expecting it to be passed from
    //the declaration of the AUIPage component

    //What I don't yet like about this approach is that every page has a menu, even if it is not used.

    property alias menuitems: menuModel.children

    ListView { id: menuListView
        anchors.fill: parent
        Item { id: menuModel }

        PullDownMenu {
            id: pullDownMenu
            Repeater {
                model: menuModel.children
                MenuItem {
                    text: modelData.text
                    onClicked: modelData.clicked()
                }
            }
        }
    }
*/
    property int hasMenu: 0
//TODO Add a C++ enum for these values
        //0: no menu
        //1: Harmattan style toolbar pullup Menu
        //2: Sailfish PullDownMenu
        //3: Sailfish PushUpMenu

}

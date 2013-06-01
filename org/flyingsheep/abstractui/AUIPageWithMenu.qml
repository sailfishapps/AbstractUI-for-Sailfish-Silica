import QtQuick 1.1
//import com.nokia.meego 1.0
import Sailfish.Silica 1.0

Page {
    id: thisPage
    property Item tools: null;
    property int orientationLock: PageOrientation.Automatic
    property alias menuitems: menuModel.children
    default property alias children: menuListView.children
    //http://stackoverflow.com/questions/5021350/how-do-you-assign-a-qml-item-to-a-component-property-in-qml-and-then-use-that-ob

    //MENU HANDLING
    //Basic idea for abstracted menu handling inspired by THP
    //@ http://thpmaemo.blogspot.ch/2013/03/porting-harmattan-apps-to-sailfish.html
    //With the following differences:
    //1) simplified and condensed
    //2) we also provide the ListView as a child of the Page, rather than expecting it to be passed from
    //the declaration of the AUIPage component

    //As this means every page would have a menu, even if not used or displayed
    //I have created two components
    //a) AUIPageWithMenu, which has this handling
    //b) AUIPage, which has no menu
    //The two are otherwise identical

    //SilicaFlickable {
    //If I use a SilicaFlickable (in place of the current ListView),
    //then "nothing happens" other than XISlaveSwitch console output when I try to drag the menu down.
    //ListView allows me to drag down the menu, but the children reparented from the instance
    //do not drag down together with the menu as expected.
    //However I also get the console warning:
    //Warning: PullDownMenu must be added to an instance of SilicaFlickable.
    ListView {
        id: menuListView
        anchors.fill: parent
        //contentHeight: childrenRect.height

        Item { id: menuModel }

        //Harmattan has Menu, Silica has PullDownMenu
        PullDownMenu {
            id: pullDownMenu
            objectName: "pullDownMenu"

            //Harmattan has MenuLayout here as child of Menu, parent of Repeater, Silica does not.
            Repeater {
                model: menuModel.children
                MenuItem {
                    z:9999
                    text: modelData.text
                    onClicked: modelData.clicked()
                }
            }
        }

        Component.onCompleted: {
            console.log ("menuListView child count: " +menuListView.children.length)
            for(var i = 0; i < menuListView.children.length; i++) {
                console.log("child objectName: " + menuListView.children[i].objectName)
            }
        }
    }
}


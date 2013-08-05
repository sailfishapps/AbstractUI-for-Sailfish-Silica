import QtQuick 2.0
//import com.nokia.meego 1.0
import Sailfish.Silica 1.0
import org.flyingsheep.abstractui 1.0

Page {
    //MENU HANDLING
    //Basic idea for abstracted menu handling inspired by THP
    //@ http://thpmaemo.blogspot.ch/2013/03/porting-harmattan-apps-to-sailfish.html
    //With the following differences:
    //1) simplified and condensed
    //2) we provide the ListView as a child of the Page, rather than expecting it to be passed from
    //the declaration of the AUIPage component

    //As this means every page would have a menu, even if not used or displayed
    //I have created two components
    //a) AUIPageWithMenu, which has menu handling
    //b) AUIPage, which has no menu
    //The two should be otherwise identical

    //This version uses a PushUpMenu, as that is closer to the Harmattan ToolBar / Menu idiom
    //Maybe in future versions of this control the user will be able to switch between PullDownMenu / PushUpMenu
    //Or we have to offer 2 versions. Food for thought here.

    id: thisPage
    objectName: "thisPage"
    property Item tools: null;
    property int orientationLock: AUIPageOrientation.Automatic
    property alias menuitems: menuModel.children

    //not sure if we actually need these signals, it may be enough to pass on the menu.active property via alias
    //the stuff I am doing via the internal signal handlers could be done from onActiveChanged
    signal menuOpening()
    signal menuClosing()


    //Attempt to reparent childs of this page to the ListView, so they slide with the ListView when the menu opens
    //while the reparenting works, things don't slide as expected.
    //Even worse: If I have line below, and have an QtObject instance on my MainPage, I get the error:
    //"Cannot assign object to list"
    //    default property alias children: menuListView.children

    //http://stackoverflow.com/questions/5021350/how-do-you-assign-a-qml-item-to-a-component-property-in-qml-and-then-use-that-ob

    //As I have not got other childs to slide with the menu (but I am stil working on that..)
    //as a workaround I do the following:
    //a) increase the z: property of the ListView on opening, so it slides above other childs (and decrease it on
    //closing, otherwise the close menu steals mouse input!
    //b) and make other childs invisible while the menu is open.
    //Should this workaround (which is not bad in itself) have to become the permenant solution,
    //then several improvements can be made: e.g.
    //i) use transitions so the change is not so abrupt
    //ii) store current visibility in an array structure, so the same settings can be restored.
    //iii) maybe the childs can just be made "faint" rather than totally invisible ...

    //Rather than making invisible / visible, reducing and increasing the opacity works very well
    //this has the added benefit that I can just divide and multiply, and do not need to have an intermediate store
    //of the previous value

    //Possibly a final verison of this Control will have 3 behaviours for other childs (set by property)
    // 1: reduceOpacityOnMenuOpening
    // 2: invisibleOnMenuOpening
    // 3: slideAwayOnMenuOpening


    //SilicaFlickable {
    //If I use a SilicaFlickable (in place of the current ListView),
    //then "nothing happens" other than XISlaveSwitch console output when I try to drag the menu down.
    //ListView allows me to drag down the menu, but the children reparented from the instance
    //do not drag down together with the menu as expected.
    //However using ListView I also get the console warning:
    //Warning: PullDownMenu must be added to an instance of SilicaFlickable.
    ListView {
        id: menuListView
        objectName: "menuListView"
        anchors.fill: parent
        z: (thisMenu.active) ? 9999 : 0
        //contentHeight: childrenRect.height

        Item { id: menuModel; objectName: "menuModel"; }

        //Harmattan has Menu, Silica has PullDownMenu/PushUpMenu
        PushUpMenu {
            id: thisMenu
            objectName: "thisMenu"

            //Harmattan has MenuLayout here as child of Menu, parent of Repeater, Silica does not.
            Repeater {
                objectName: "repeater"
                model: menuModel.children
                MenuItem {
                    objectName: "menuItem"
                    text: modelData.text
                    onClicked: {
                        console.log ("Menu active: " + thisMenu.active);
                        modelData.clicked();
                    }
                }
            }
            onActiveChanged: {
                (thisMenu.active == true) ? thisPage.menuOpening() : thisPage.menuClosing();
            }
        }

        Component.onCompleted: {
            //temporary console output, gives me an idea of what belongs to what
            console.log ("thisPage child count: " +thisPage.children.length)
            for(var i = 0; i < thisPage.children.length; i++) {
                console.log("child objectName: " + thisPage.children[i].objectName +", opacity: " + thisPage.children[i].opactity)
            }
            console.log ("menuListView child count: " +menuListView.children.length)
            for(var i = 0; i < menuListView.children.length; i++) {
                console.log("child objectName: " + menuListView.children[i].objectName)
            }
            console.log ("menuListView.contentItem objectName: " + menuListView.contentItem.objectName)
            console.log ("menuListView.contentItem child count: " + menuListView.contentItem.children.length)
            console.log ("Menu active: " + thisMenu.active);
        }
    }

    //Indicate to the instance of the Page if a Menu is present, and the type of menu
    property int hasMenu: (menuitems.length > 0) ? 3 : 0
    //TODO Add a C++ enum for these values
    //0: no menu
    //1: Harmattan style toolbar pullup Menu
    //2: Sailfish PullDownMenu
    //3: Sailfish PushUpMenu

    NumberAnimation {
        id: fadeChilds
        properties: "opacity"
        to: 0.2
        duration: 500
    }




    NumberAnimation {
        id: unFadeChilds
        properties: "opacity"
        to: 1
        duration: 500
    }

    onMenuOpening: {
        console.log ("AUI Menu is opening: thisMenu height: " + thisMenu.height + " _activeHeight: " + thisMenu._activeHeight)
        //Ok at this point we are opening, but the height is still 0,
        //but the internal propery _activeHeight does give us a positive value
        //thisPage.children[i].opacity = thisPage.children[i].opacity / 10;
        fadeChilds.targets = setChildsToFade();
        fadeChilds.start();
    }
    onMenuClosing: {
        console.log ("AUI Menu is closing: thisMenu height: " + thisMenu.height);
        //thisPage.children[i].opacity = thisPage.children[i].opacity * 10;
        unFadeChilds.targets = setChildsToFade();
        unFadeChilds.start();
    }

    //in theory we could call this just on menuOpening:, store in a variable
    //and just reuse the varible on closing, thereby only unFading the same objects
    //and saving a loop around the ojbects
    function setChildsToFade() {
        var childsToFade = [];
        for(var i = 0; i < thisPage.children.length; i++) {
            if (thisPage.children[i].objectName != menuListView.objectName) {
                //thisPage.children[i].opacity = thisPage.children[i].opacity * 10;
                childsToFade.push(thisPage.children[i])
            }
        }
        return childsToFade;
    }

}


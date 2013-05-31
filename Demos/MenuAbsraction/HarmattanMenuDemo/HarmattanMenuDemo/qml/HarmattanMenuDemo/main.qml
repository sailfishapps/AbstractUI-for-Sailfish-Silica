import QtQuick 1.1
import com.nokia.meego 1.0

//This demo project shows how a Harmattan Menu works
//It is intended to contrast with the Sailfish OS equivalent
//and wtih a "common" version importing abstractui

PageStackWindow {
    id: appWindow

    initialPage: mainPage

    MainPage {
        id: mainPage
    }

    ToolBarLayout {
        id: commonTools

        ToolIcon {
            platformIconId: "toolbar-view-menu"
            anchors.right: (parent === undefined) ? undefined : parent.right
            onClicked: (myMenu.status === DialogStatus.Closed) ? myMenu.open() : myMenu.close()
        }
    }

// In the SailfishOS native version, the Menu is implemented on FirstPage, not as here on main.qml

    Menu {
        id: myMenu
        visualParent: pageStack
        MenuLayout {
            MenuItem {
                text: qsTr("increment counter")
                onClicked: {
                    mainPage.qmlCounter++;
                }
            }
            MenuItem {
                text: qsTr("decrement counter")
                onClicked: {
                    mainPage.qmlCounter--;
                }
            }
        }
    }
}

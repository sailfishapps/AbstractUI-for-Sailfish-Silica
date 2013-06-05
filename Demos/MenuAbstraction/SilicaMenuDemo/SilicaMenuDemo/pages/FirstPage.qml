import QtQuick 1.1
import Sailfish.Silica 1.0

Page {
    id: page   
    property int qmlCounter: 0
    onQmlCounterChanged: {
        console.log ("onQmlCounterChanged: " + qmlCounter);
        labelQmlCounterOnChanged.text = qmlCounter
    }

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent
        
        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: "increment counter"
                onClicked: {
                    page.qmlCounter++
                }
            }
            MenuItem {
                text: "decrement counter"
                onClicked: {
                    page.qmlCounter--
                }
            }
        }
        
        // Tell SilicaFlickable the height of its content.
        contentHeight: childrenRect.height
        
        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            width: page.width
            spacing: theme.paddingLarge
            PageHeader {
                title: "silica native menu demo"
            }
            Row {
                Label {
                    x: theme.paddingLarge
                    text: "qml.counter onChanged: "
                    color: theme.secondaryHighlightColor
                    font.pixelSize: theme.fontSizeSmall
                }
                Label { id: labelQmlCounterOnChanged
                    x: theme.paddingLarge
                    text: "0"
                    color: theme.secondaryHighlightColor
                    font.pixelSize: theme.fontSizeSmall
                }
            }
        }
    }
}



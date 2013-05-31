import QtQuick 1.1
//import Sailfish.Silica 1.0
import org.flyingsheep.abstractui 1.0

AUIPageWithMenu {
    id: page
    property int qmlCounter: 0
    onQmlCounterChanged: {
        console.log ("onQmlCounterChanged: " + qmlCounter);
        labelQmlCounterOnChanged.text = qmlCounter
    }

    menuitems: [
        AUIMenuAction {
            text: "increment counter"
            onClicked: {
                page.qmlCounter++
            }
        },
        AUIMenuAction {
            text: "decrement counter"
            onClicked: {
                page.qmlCounter--
            }
        }
    ]

    // Place our content in a Column.  The PageHeader is always placed at the top
    // of the page, followed by our content.
    Column {
        width: page.width
        spacing: theme.paddingLarge
        AUIPageHeader {
            title: "abstract menu demo"
        }
        Row {
            AUILabel {
                x: theme.paddingLarge
                text: "qml.counter onChanged: "
                color: theme.secondaryHighlightColor
                font.pixelSize: theme.fontSizeSmall
            }
            AUILabel { id: labelQmlCounterOnChanged
                x: theme.paddingLarge
                text: "0"
                color: theme.secondaryHighlightColor
                font.pixelSize: theme.fontSizeSmall
            }
        }
    }
}



import QtQuick 1.1
import org.flyingsheep.abstractui 1.0

AUIPageWithMenu {
    id: page
    //tools: commonTools

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
    Column {
        width: page.width
        spacing: 20
        Text {
            text: "abstract menu demo"
            font.pointSize: 15
        }
        Row {
            Text {
                x: 10
                text: "counter: "
                color: "black"
                font.pointSize: 10

                //font.pixelSize: theme.fontSizeSmall
            }
            Text { id: labelQmlCounterOnChanged
                x: 10
                text: "0"
                color: "black"
                font.pointSize: 10
            }
        }
    }

}

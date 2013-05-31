import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    id: page
    tools: commonTools

    property int qmlCounter: 0
    onQmlCounterChanged: {
        console.log ("onQmlCounterChanged: " + qmlCounter);
        labelQmlCounterOnChanged.text = qmlCounter
    }


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

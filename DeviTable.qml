import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Rectangle {
    id: deviTable
    width: settings.width-buttonWidth - button1.anchors.leftMargin * 2
    height: window1.height
    color: "#00000000"
    property int elementHeight: height / 9
    property int elementWidht: width / 9
    property bool stepTable: true //10-true,15-false
    property bool degaus: false //true -on, false-off

    Button {
        id: butStepTable
        text: stepTable === true ? "10" : "15"
        height: elementHeight
        width: elementWidht
        anchors.left: parent.left
        anchors.leftMargin: parent.width / 6
        anchors.top: parent.top
        anchors.topMargin: parent.height/7
        style: ButtonStyle {
            label: Text {
                renderType: Text.NativeRendering
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.family: "Helvetica"
                font.pointSize: buttonFontSize
                color: "black"
                text: control.text
            }
            background: Rectangle {
                id:butStepTableBack
                implicitWidth: 100
                implicitHeight: 25
                border.width: control.activeFocus ? 2 : 1
                border.color: "#888"
                radius: 4
            }
        }
        onClicked: {
            stepTable = !stepTable
        }
    }

    Button {
        id: butDegaus
        text: "РУ"
        height: elementHeight
        width: elementWidht * 4
        anchors.top: butStepTable.top
        anchors.topMargin: 0
        anchors.left: butStepTable.right
        anchors.leftMargin: 0
        style: ButtonStyle {
            label: Text {
                renderType: Text.NativeRendering
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.family: "Helvetica"
                font.pointSize: buttonFontSize
                color: "black"
                text: control.text
            }
            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 25
                border.width: control.activeFocus ? 2 : 1
                border.color: "#888"
                radius: 4
                color: degaus === true ? "#42e73a":"white"

            }
        }
        onClicked: {
            degaus = !degaus
        }
    }
    Button {
        id: deviA
        text:"A="
        height: elementHeight
        anchors.left: butStepTable.left
        anchors.leftMargin: 0
        anchors.top: butStepTable.bottom
        anchors.topMargin: 0
        width: elementWidht
        style: ButtonStyle {
            label: Text {
                renderType: Text.NativeRendering
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.family: "Helvetica"
                font.pointSize: buttonFontSize
                color: "black"
                text: control.text
            }
            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 25
                border.width: control.activeFocus ? 2 : 1
                border.color: "#888"
                radius: 4
                color: degaus === true ? "#42e73a":"white"

            }
        }
    }
    Button {
        id: deviB
        text:"B="
        height: elementHeight
        width: elementWidht
        anchors.top: deviA.bottom
        anchors.topMargin: 0
        anchors.left: butStepTable.left
        anchors.leftMargin: 0
        style: ButtonStyle {
            label: Text {
                renderType: Text.NativeRendering
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.family: "Helvetica"
                font.pointSize: buttonFontSize
                color: "black"
                text: control.text
            }
            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 25
                border.width: control.activeFocus ? 2 : 1
                border.color: "#888"
                radius: 4
                color: degaus === true ? "#42e73a":"white"

            }
        }
    }
    Button {
        id: deviC
        text:"C="
        height: elementHeight
        width: elementWidht
        anchors.top: deviB.bottom
        anchors.topMargin: 0
        anchors.left: butStepTable.left
        anchors.leftMargin: 0
        style: ButtonStyle {
            label: Text {
                renderType: Text.NativeRendering
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.family: "Helvetica"
                font.pointSize: buttonFontSize
                color: "black"
                text: control.text
            }
            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 25
                border.width: control.activeFocus ? 2 : 1
                border.color: "#888"
                radius: 4
                color: degaus === true ? "#42e73a":"white"

            }
        }
    }
    Button {
        id: deviD
        text:"D="
        height: elementHeight
        width: elementWidht
        anchors.top: deviC.bottom
        anchors.topMargin: 0
        anchors.left: butStepTable.left
        anchors.leftMargin: 0
        style: ButtonStyle {
            label: Text {
                renderType: Text.NativeRendering
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.family: "Helvetica"
                font.pointSize: buttonFontSize
                color: "black"
                text: control.text
            }
            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 25
                border.width: control.activeFocus ? 2 : 1
                border.color: "#888"
                radius: 4
                color: degaus === true ? "#42e73a":"white"

            }
        }
    }
    Button {
        id: deviE
        text: "E="
        height: elementHeight
        width: elementWidht
        anchors.top: deviD.bottom
        anchors.topMargin: 0
        anchors.left: butStepTable.left
        anchors.leftMargin: 0
        style: ButtonStyle {
            label: Text {
                renderType: Text.NativeRendering
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.family: "Helvetica"
                font.pointSize: buttonFontSize
                color: "black"
                text: control.text
            }
            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 25
                border.width: control.activeFocus ? 2 : 1
                border.color: "#888"
                radius: 4
                color: degaus === true ? "#42e73a":"white"

            }
        }
    }
    TableView{
        id: table
        width: elementWidht*4
        height:elementHeight * 5
        anchors.left: butStepTable.right
        anchors.leftMargin: 0
        anchors.top: butStepTable.bottom
        anchors.topMargin: 0
        style: TableViewStyle{
            itemDelegate: Rectangle{
                height: 100
                border.width: 5

            }
        }

        TableViewColumn {
                    id: courseColumn
                    title: "Title"
                    role: "title"
                    movable: false
                    resizable: false
                    width: table.width/2

                }
        TableViewColumn {
                    id: dataColumn
                    title: "data"
                    role: "title"
                    movable: false
                    resizable: false
                    width: table.width/2
                }
    }
    
}

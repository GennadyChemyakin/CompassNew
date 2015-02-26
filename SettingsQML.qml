import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Rectangle {
    id: settings
    width: window1.width
    height: window1.height
    property int buttonWidth:340
    property int buttonHeight:100
    property int buttonNum:0
    //color: "#028000"


    Compensation
    {
        id:compensationDisplay
        x: 1440
        width: settings.width-buttonWidth - button1.anchors.leftMargin * 2
        height: settings.height
        anchors.rightMargin: -compensationDisplay.width
        anchors.right: parent.right
        z:2
    }
    KeyBoard
    {
        id:keyboardDisplay
        x: 1440
        width: settings.width-buttonWidth - button1.anchors.leftMargin * 2
        height: settings.height
        anchors.rightMargin: -keyboardDisplay.width
        anchors.right: parent.right
        z:2
    }
    ParallelAnimation {
        id: slideKeybordForward
        PropertyAnimation {
            target: keyboardDisplay
            properties: "anchors.rightMargin"
            to: 0
            duration: 300
        }
    }
    ParallelAnimation {
        id: slideCompForward
        PropertyAnimation {
            target: compensationDisplay
            properties: "anchors.rightMargin"
            to: 0
            duration: 300
        }
    }
    ParallelAnimation {
        id: slideCompBack
        PropertyAnimation {
            target: compensationDisplay
            properties: "anchors.rightMargin"
            to: -compensationDisplay.width
            duration: 0
        }
        PropertyAnimation {
            target: keyboardDisplay
            properties: "anchors.rightMargin"
            to: -compensationDisplay.width
            duration: 0
        }
    }
    Image {
        id: settingsBackground
        z: 1
        anchors.fill: parent
        source: "content/steel4.png"

        Button {
            id: button1
            width: settings.buttonWidth
            height:settings.buttonHeight
            text: qsTr("Компенсация")

            anchors.left: parent.left
            anchors.leftMargin: 50
            anchors.top: parent.top
            anchors.topMargin: 300
            style: ButtonStyle {
                    label: Text {
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.pointSize: 27
                        color: "black"
                        text: control.text
                      }
                    background: Rectangle {
                        implicitWidth: 100
                        implicitHeight: 25
                        border.width: control.activeFocus ? 2 : 1
                        border.color: "#888"
                        radius: 4
                        color: buttonNum === 1 ? "#3960f0":"white"

                    }
                }
            onClicked:
            {
                slideCompBack.start()
                slideCompForward.start()
                buttonNum = 1
            }
        }

        Button {
            id: button2
            width: settings.buttonWidth
            height: 100
            text: qsTr("Изменить фон")
            anchors.left: parent.left
            anchors.leftMargin: 50
            anchors.top: button1.bottom
            anchors.topMargin: 20
            style: ButtonStyle {
                    label: Text {
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.pointSize: 27
                        color: "black"
                        text: control.text
                      }
                    background: Rectangle {
                        implicitWidth: 100
                        implicitHeight: 25
                        border.width: control.activeFocus ? 2 : 1
                        border.color: "#888"
                        radius: 4
                        color: buttonNum === 2 ? "#3960f0":"white"

                    }
                }
            onClicked:
            {
                slideCompBack.start()
                buttonNum = 2
            }
        }

        Button {
            id: button3
            width: settings.buttonWidth
            height:settings.buttonHeight
            text: qsTr("Склонение")
            anchors.left: parent.left
            anchors.leftMargin: 50
            anchors.top: button2.bottom
            anchors.topMargin: 20
            style: ButtonStyle {
                    label: Text {
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.pointSize: 27
                        color: "black"
                        text: control.text
                      }
                    background: Rectangle {
                        implicitWidth: 100
                        implicitHeight: 25
                        border.width: control.activeFocus ? 2 : 1
                        border.color: "#888"
                        radius: 4
                        color: buttonNum === 3 ? "#3960f0":"white"

                    }
                }
            onClicked:
            {
                slideCompBack.start()
                slideKeybordForward.start()
                buttonNum = 3
            }
        }

        Button {
            id: button4
            width: settings.buttonWidth
            height:settings.buttonHeight
            text: qsTr("Доп. информация")
            anchors.left: parent.left
            anchors.leftMargin: 50
            anchors.top: button3.bottom
            anchors.topMargin: 20
            style: ButtonStyle {
                    label: Text {
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.pointSize: 27
                        color: "black"
                        text: control.text
                      }
                    background: Rectangle {
                        implicitWidth: 100
                        implicitHeight: 25
                        border.width: control.activeFocus ? 2 : 1
                        border.color: "#888"
                        radius: 4
                        color: buttonNum === 4 ? "#3960f0":"white"

                    }
                }
            onClicked:
            {
                slideCompBack.start()
                buttonNum = 4
            }
        }

        Button {
            id: button5
            width: settings.buttonWidth
            height:settings.buttonHeight
            text: qsTr("Истинный/Магнитный курс")
            anchors.left: parent.left
            anchors.leftMargin: 50
            anchors.top: button4.bottom
            anchors.topMargin: 20
            style: ButtonStyle {
                    label: Text {
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.pointSize: 18
                        color: "black"
                        text: control.text
                      }
                    background: Rectangle {
                        implicitWidth: 100
                        implicitHeight: 25
                        border.width: control.activeFocus ? 2 : 1
                        border.color: "#888"
                        radius: 4
                        color: buttonNum === 5 ? "#3960f0":"white"

                    }
                }
            onClicked:
            {
                slideCompBack.start()
                buttonNum = 5
            }
        }

        Rectangle {
            id: rectangle1
            width: 1
            color: "#ffffff"
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.left: button1.right
            anchors.leftMargin: 30
        }

        Rectangle {
            id: rectangle2
            y: 66
            height: 1
            color: "#ffffff"
            anchors.bottom: button1.top
            anchors.bottomMargin: 30
            z: 1
            anchors.right: rectangle1.left
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
        }
    }
}

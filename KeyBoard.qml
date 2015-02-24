import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Rectangle {
    width: settings.width-buttonWidth - button1.anchors.leftMargin * 2
    height: window1.height
    color: "#00000000"
    Image {
        id: compensationBackground
        visible: true
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.fill: parent
        //source: "content/steel4.png"

        Button {
            id: but7
            x: 132
            width: 166
            height: 107
            text: qsTr("7")
            anchors.top: textField1.bottom
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
            }
        }

        Button {
            id: but8
            x: 329
            width: 166
            height: 107
            text: qsTr("8")
            anchors.top: textField1.bottom
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
            }
        }

        Button {
            id: but9
            x: 521
            width: 166
            height: 107
            text: qsTr("9")
            anchors.top: textField1.bottom
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
            }
        }

        Button {
            id: but4
            x: 132
            width: 166
            height: 107
            text: qsTr("4")
            anchors.top: but7.bottom
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
            }
        }

        Button {
            id: but5
            x: 329
            width: 166
            height: 107
            text: qsTr("5")
            anchors.top: but7.bottom
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
            }
        }

        Button {
            id: but6
            x: 521
            width: 166
            height: 107
            text: qsTr("6")
            anchors.top: but7.bottom
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
            }
        }

        Button {
            id: but1
            x: 132
            width: 166
            height: 107
            text: qsTr("1")
            anchors.top: but4.bottom
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
            }
        }

        Button {
            id: but2
            x: 329
            width: 166
            height: 107
            text: qsTr("2")
            anchors.top: but4.bottom
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
            }
        }

        Button {
            id: but3
            x: 521
            width: 166
            height: 107
            text: qsTr("3")
            anchors.top: but4.bottom
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
            }
        }

        Button {
            id: butSave
            x: 227
            width: 166
            height: 107
            text: qsTr("Сохранить")
            anchors.top: but1.bottom
            anchors.topMargin: 20
            style: ButtonStyle {
                    label: Text {
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.pointSize: 24
                        color: "black"
                        text: control.text
                      }
            }
        }

        Button {
            id: button0
            x: 425
            width: 166
            height: 107
            text: qsTr("0")
            anchors.top: but1.bottom
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
            }
        }

        TextField {
            id: textField1
            x: 132
            y: 184
            width: 390
            height: 106
            z: 1
            placeholderText: qsTr("Text Field")
        }

        Button {
            id: butDel
            x: 528
            y: 184
            width: 159
            height: 107
            text: qsTr("<-")
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
            }
        }

        Button {
            id: butPlus
            x: 718
            y: 365
            width: 166
            height: 107
            text: qsTr("+")
            anchors.top: textField1.bottom
            anchors.topMargin: 79
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
            }
        }

        Button {
            id: butMinus
            x: 718
            y: 495
            width: 166
            height: 107
            text: qsTr("-")
            anchors.top: textField1.bottom
            anchors.topMargin: 213
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
            }
        }
    }

}

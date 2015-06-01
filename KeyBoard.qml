import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Rectangle {
    id: keyboard
    width: settings.width-buttonWidth - button1.anchors.leftMargin * 2
    height: window1.height
    color: "#00000000"
    property bool modeSKL : true
    property int buttonWidthKeyboard: window1.width/8.674698795
    property int buttonHeightKeyboard: window1.height/9.158878505
    property int buttonFontSize:window1.width/53.333333333
    function setMod(arg){
        modeSKL = arg
    }

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
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
            text: qsTr("7")
            anchors.left: textField1.left
            anchors.leftMargin: 0
            anchors.top: textField1.bottom
            anchors.topMargin: window1.width/72
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
            }
            onClicked: modeSKL===true ? compass.addSKL("7") : compass.addA("7")
        }
        Button {
            id: butPLUSMINUS
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
            text: qsTr("+/-")
            anchors.left: butDel.right
            anchors.leftMargin: but1.height/5.5
            anchors.top: textField1.top
            anchors.topMargin: 0
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
            }
            onClicked: modeSKL===true ? compass.addSKL("+/-") : compass.addA("+/-")
        }

        Button {
            id: but8
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
            text: qsTr("8")
            anchors.left: but7.right
            anchors.leftMargin: but1.height/5.5
            anchors.top: textField1.bottom
            anchors.topMargin: window1.width/72
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
            }
            onClicked: modeSKL===true ? compass.addSKL("8") : compass.addA("8")
        }

        Button {
            id: but9
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
            text: qsTr("9")
            anchors.left: but8.right
            anchors.leftMargin: but1.height/5.5
            anchors.top: textField1.bottom
            anchors.topMargin: window1.width/72
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
            }
            onClicked: modeSKL===true ? compass.addSKL("9") : compass.addA("9")
        }

        Button {
            id: but4
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
            text: qsTr("4")
            anchors.left: but7.left
            anchors.leftMargin: 0
            anchors.top: but7.bottom
            anchors.topMargin: window1.width/72
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
            }
            onClicked: modeSKL===true ? compass.addSKL("4") : compass.addA("4")
        }

        Button {
            id: but5
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
            text: qsTr("5")
            anchors.left: but4.right
            anchors.leftMargin: but1.height/5.5
            anchors.top: but7.bottom
            anchors.topMargin: window1.width/72
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
            }
            onClicked: modeSKL===true ? compass.addSKL("5") : compass.addA("5")
        }

        Button {
            id: but6
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
            text: qsTr("6")
            anchors.left: but5.right
            anchors.leftMargin: but1.height/5.5
            anchors.top: but7.bottom
            anchors.topMargin: window1.width/72
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
            }
            onClicked: modeSKL===true ? compass.addSKL("6") : compass.addA("6")
        }

        Button {
            id: but1
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
            text: qsTr("1")
            anchors.left: but7.left
            anchors.leftMargin: 0
            anchors.top: but4.bottom
            anchors.topMargin: window1.width/72
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
            }
            onClicked: modeSKL===true ? compass.addSKL("1") : compass.addA("1")
        }

        Button {
            id: but2
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
            text: qsTr("2")
            anchors.left: but1.right
            anchors.leftMargin: but1.height/5.5
            anchors.top: but4.bottom
            anchors.topMargin: window1.width/72
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
            }
            onClicked: modeSKL===true ? compass.addSKL("2") : compass.addA("2")
        }

        Button {
            id: but3
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
            text: qsTr("3")
            anchors.left: but2.right
            anchors.leftMargin: but1.height/5.5
            anchors.top: but4.bottom
            anchors.topMargin: window1.width/72
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
            }
            onClicked: modeSKL===true ? compass.addSKL("3") : compass.addA("3")
        }

        Button {
            id: butSave
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
            text: qsTr("Сохранить")
            anchors.left: but1.left
            anchors.leftMargin: but1.width/2
            anchors.top: but1.bottom
            anchors.topMargin: window1.width/72
            style: ButtonStyle {
                    label: Text {
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.pointSize: window1.width/60
                        color: "black"
                        text: control.text
                      }
            }
            onClicked: modeSKL===true ? compass.addSKL("save") : compass.addA("save")
        }

        Button {
            id: button0
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
            text: qsTr("0")
            anchors.left: butSave.right
            anchors.leftMargin: but1.height/5.5
            anchors.top: but1.bottom
            anchors.topMargin: window1.width/72
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
            }
            onClicked: modeSKL===true ? compass.addSKL("0") : compass.addA("0")
        }

        TextField {
            id: textField1
            x: (keyboard.width - (textField1.width + 5 + butDel.width + 10 + butPLUSMINUS.width))/2
            y: window1.height/5.326086957
            width: window1.width/3.692307692
            height: window1.height/9.245283019
            z: 1
            placeholderText: qsTr("Text Field")
            text: modeSKL===true ? (skl_str > 0.1 ? "+" + skl_str : skl_str ): (a_str > 0.1 ? "+" + a_str : a_str)
            font.pixelSize: window1.width/16.363636364
        }

        Button {
            id: butDel
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
            text: qsTr("<-")
            anchors.top: textField1.top
            anchors.topMargin: 0
            anchors.left: textField1.right
            anchors.leftMargin: window1.width/288
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
            }
            onClicked: modeSKL===true ? compass.addSKL("<-") : compass.addA("<-")
        }

        Button {
            id: butPlus
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
            text: qsTr("+0.1")
            anchors.left: but9.right
            anchors.leftMargin: but1.height/5.5
            anchors.top: but9.top
            anchors.topMargin: but9.height/2 + window1.width/144
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
            }
            onClicked: modeSKL===true ? compass.addSKL("+0.1") : compass.addA("+0.1")
        }

        Button {
            id: butMinus
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
            text: qsTr("-0.1")
            anchors.bottom: but3.bottom
            anchors.bottomMargin: but3.height/2 + window1.width/144
            anchors.left: but3.right
            anchors.leftMargin: but1.height/5.5
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
            }
            onClicked: modeSKL===true ? compass.addSKL("-0.1") : compass.addA("-0.1")
        }
    }

}

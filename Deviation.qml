import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Rectangle {
    id: rectangle1
    width: settings.width-buttonWidth - button1.anchors.leftMargin * 2
    height: window1.height
    color: "#00000000"
    property bool modeSKL : true
    property int  deviationCourse: 1
    property string delta : ""
    property int buttonNumber : 0
    property bool degaus : false
    property string degausButText : "РУ выкл"
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
            width: 166
            height: 107
            text: qsTr("7")
            anchors.left: parent.left
            anchors.leftMargin: 132
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
            onClicked: degaus === false ? compass.addDelta("7",deviationCourse) : compass.addDeltaDegaus("7",deviationCourse)
        }
        Button {
            id: butPLUSMINUS
            width: 166
            text: qsTr("+/-")
            anchors.bottom: textField1.top
            anchors.bottomMargin: -107
            anchors.left: butDel.right
            anchors.leftMargin: 31
            anchors.top: textField1.bottom
            anchors.topMargin: -106
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
            onClicked: degaus === false ? compass.addDelta("+/-",deviationCourse) : compass.addDeltaDegaus("+/-",deviationCourse)
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
            onClicked: degaus === false ? compass.addDelta("8",deviationCourse) : compass.addDeltaDegaus("8",deviationCourse)
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
            onClicked: degaus === false ?  compass.addDelta("9",deviationCourse) : compass.addDeltaDegaus("9",deviationCourse)
        }

        Button {
            id: but4
            width: 166
            height: 107
            text: qsTr("4")
            anchors.left: parent.left
            anchors.leftMargin: 132
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
            onClicked: degaus === false ? compass.addDelta("4",deviationCourse) : compass.addDeltaDegaus("4",deviationCourse)
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
            onClicked: degaus === false ? compass.addDelta("5",deviationCourse) : compass.addDeltaDegaus("5",deviationCourse)
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
            onClicked: degaus === false ? compass.addDelta("6",deviationCourse) : compass.addDeltaDegaus("6",deviationCourse)
        }

        Button {
            id: but1
            width: 166
            height: 107
            text: qsTr("1")
            anchors.left: parent.left
            anchors.leftMargin: 132
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
            onClicked: degaus === false ? compass.addDelta("1",deviationCourse) : compass.addDeltaDegaus("1",deviationCourse)
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
            onClicked: degaus === false ? compass.addDelta("2",deviationCourse) : compass.addDeltaDegaus("2",deviationCourse)
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
            onClicked: degaus === false ? compass.addDelta("3",deviationCourse) : compass.addDeltaDegaus("3",deviationCourse)
        }

        Button {
            id: butSave
            width: 166
            height: 107
            text: qsTr("Сохранить")
            anchors.left: parent.left
            anchors.leftMargin: 227
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
            onClicked:  degaus === false ? compass.addDelta("save",deviationCourse) : compass.addDeltaDegaus("save",deviationCourse)
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
            onClicked: degaus === false ? compass.addDelta("0",deviationCourse) : compass.addDeltaDegaus("0",deviationCourse)
        }

        TextField {
            id: textField1
            x: 138
            y: 281
            width: 390
            height: 106
            z: 1
            placeholderText: qsTr("Text Field")
            text:  degaus === false ? (delta_str > 0.1 ? "+" + delta_str : delta_str) : (deltaDegaus_str > 0.1 ? "+" + deltaDegaus_str : deltaDegaus_str)
            font.pixelSize: 88
        }

        Button {
            id: butDel
            width: 159
            height: 107
            text: qsTr("<-")
            anchors.top: textField1.bottom
            anchors.topMargin: -107
            anchors.left: textField1.right
            anchors.leftMargin: 6
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
            onClicked: degaus === false ? compass.addDelta("<-",deviationCourse) : compass.addDeltaDegaus("<-",deviationCourse)
        }

        Button {
            id: butPlus
            x: 718
            y: 365
            width: 166
            height: 107
            text: qsTr("+0.1")
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
            onClicked:  degaus === false ? compass.addDelta("+0.1",deviationCourse) : compass.addDeltaDegaus("+0.1",deviationCourse)
        }

        Button {
            id: butMinus
            x: 718
            y: 495
            width: 166
            height: 107
            text: qsTr("-0.1")
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
            onClicked: degaus === false ? compass.addDelta("-0.1",deviationCourse) : compass.addDeltaDegaus("-0.1",deviationCourse)
        }
        Button {
            id: buttonC0
            x: 138
            y: -82
            width: 166
            height: 107
            text: qsTr("0")
            anchors.right: but7.left
            anchors.rightMargin: -172
            anchors.bottom: but7.top
            anchors.bottomMargin: 285
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
                        color: deviationCourse === 1 ? "#42e73a":"white"
                    }
            }
            onClicked: {
                deviationCourse = 1
                degaus === false ? compass.addDelta("reset",deviationCourse) : compass.addDeltaDegaus("reset",deviationCourse)
            }
        }

        Button {
            id: buttonC45
            width: 166
            height: 107
            text: qsTr("45")
            anchors.top: buttonC0.bottom
            anchors.topMargin: -107
            anchors.left: buttonC0.right
            anchors.leftMargin: 2
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
                    color: deviationCourse === 2 ? "#42e73a":"white"
                }
            }
            onClicked: {
                deviationCourse = 2
                degaus === false ? compass.addDelta("reset",deviationCourse) : compass.addDeltaDegaus("reset",deviationCourse)
            }
        }

        Button {
            id: buttonC90
            width: 166
            height: 107
            text: qsTr("90")
            anchors.top: buttonC0.bottom
            anchors.topMargin: -107
            anchors.left: buttonC45.right
            anchors.leftMargin: 2
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
                    color: deviationCourse === 3 ? "#42e73a":"white"
                }
            }
            onClicked: {
                deviationCourse = 3
                degaus === false ? compass.addDelta("reset",deviationCourse) : compass.addDeltaDegaus("reset",deviationCourse)
            }
        }

        Button {
            id: buttonC135
            width: 166
            height: 107
            text: qsTr("135")
            anchors.top: buttonC0.bottom
            anchors.topMargin: -107
            anchors.left: buttonC90.right
            anchors.leftMargin: 2
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
                    color: deviationCourse === 4 ? "#42e73a":"white"
                }
            }
            onClicked: {
                deviationCourse = 4
                degaus === false ? compass.addDelta("reset",deviationCourse) : compass.addDeltaDegaus("reset",deviationCourse)
            }
        }

        Button {
            id: buttonC180
            width: 166
            height: 107
            text: qsTr("180")
            anchors.left: buttonC0.right
            anchors.leftMargin: -166
            anchors.top: buttonC0.bottom
            anchors.topMargin: 2
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
                        color: deviationCourse === 5 ? "#42e73a":"white"
                    }
            }
            onClicked: {
                deviationCourse = 5
                degaus === false ? compass.addDelta("reset",deviationCourse) : compass.addDeltaDegaus("reset",deviationCourse)
            }
        }

        Button {
            id: buttonC225
            width: 166
            height: 107
            text: qsTr("225")
            anchors.top: buttonC45.bottom
            anchors.topMargin: 2
            anchors.left: buttonC180.right
            anchors.leftMargin: 2
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
                        color: deviationCourse === 6 ? "#42e73a":"white"
                    }
            }
            onClicked: {
                deviationCourse = 6
                degaus === false ? compass.addDelta("reset",deviationCourse) : compass.addDeltaDegaus("reset",deviationCourse)
            }
        }

        Button {
            id: buttonC270
            width: 166
            height: 107
            text: qsTr("270")
            anchors.top: buttonC90.bottom
            anchors.topMargin: 2
            anchors.left: buttonC225.right
            anchors.leftMargin: 2
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
                    color: deviationCourse === 7 ? "#42e73a":"white"
                }
            }
            onClicked: {
                deviationCourse = 7
                degaus === false ? compass.addDelta("reset",deviationCourse) : compass.addDeltaDegaus("reset",deviationCourse)
            }
        }

        Button {
            id: buttonC315
            width: 166
            height: 107
            text: qsTr("315")
            anchors.top: buttonC135.bottom
            anchors.topMargin: 2
            anchors.left: buttonC270.right
            anchors.leftMargin: 2
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
                        color: deviationCourse === 8 ? "#42e73a":"white"
                    }
            }
            onClicked: {
                deviationCourse = 8
                degaus === false ? compass.addDelta("reset",deviationCourse) : compass.addDeltaDegaus("reset",deviationCourse)
            }
        }
        Button {
            id: degausButton
            width: 166
            text: degaus===false ? degausButText="РУ выкл" : degausButText = "РУ вкл"
            anchors.left: buttonC135.right
            anchors.leftMargin: 5
            anchors.bottom: buttonC315.top
            anchors.bottomMargin: -52
            anchors.top: buttonC135.bottom
            anchors.topMargin: -53
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
                        color: degaus === true ? "#42e73a":"white"
                    }
            }
            onClicked: {
                degaus = !degaus
            }
        }

    }





}


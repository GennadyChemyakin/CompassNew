import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Rectangle {
    id: rectangle1
    width: settings.width-buttonWidth - button1.anchors.leftMargin * 2
    height: window1.height
    color: "#00000000"
    property int devFontSize: window1.width/53.333333333
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
            width: window1.width/8.674698795
            height: window1.width/13.457943925
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
                        font.pointSize: devFontSize
                        color: "black"
                        text: control.text
                      }
            }
            onClicked: degaus === false ? compass.addDelta("7",deviationCourse) : compass.addDeltaDegaus("7",deviationCourse)
        }
        Button {
            id: butPLUSMINUS
            width: window1.width/8.674698795
            height: window1.width/13.457943925
            text: qsTr("+/-")
            anchors.left: butDel.right
            anchors.leftMargin: window1.width/48
            anchors.top: textField1.bottom
            anchors.topMargin: -window1.width/13.457943925
            style: ButtonStyle {
                    label: Text {
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.pointSize: devFontSize
                        color: "black"
                        text: control.text
                      }
            }
            onClicked: degaus === false ? compass.addDelta("+/-",deviationCourse) : compass.addDeltaDegaus("+/-",deviationCourse)
        }

        Button {
            id: but8
            width: window1.width/8.674698795
            height: window1.width/13.457943925
            text: qsTr("8")
            anchors.left: but7.right
            anchors.leftMargin: window1.width/48
            anchors.top: textField1.bottom
            anchors.topMargin: window1.width/72
            style: ButtonStyle {
                    label: Text {
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.pointSize: devFontSize
                        color: "black"
                        text: control.text
                      }
            }
            onClicked: degaus === false ? compass.addDelta("8",deviationCourse) : compass.addDeltaDegaus("8",deviationCourse)
        }

        Button {
            id: but9
            width: window1.width/8.674698795
            height: window1.width/13.457943925
            text: qsTr("9")
            anchors.left: but8.right
            anchors.leftMargin: window1.width/48
            anchors.top: textField1.bottom
            anchors.topMargin: window1.width/72
            style: ButtonStyle {
                    label: Text {
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.pointSize: devFontSize
                        color: "black"
                        text: control.text
                      }
            }
            onClicked: degaus === false ?  compass.addDelta("9",deviationCourse) : compass.addDeltaDegaus("9",deviationCourse)
        }

        Button {
            id: but4
            width: window1.width/8.674698795
            height: window1.width/13.457943925
            text: qsTr("4")
            anchors.left: textField1.left
            anchors.leftMargin: 0
            anchors.top: but7.bottom
            anchors.topMargin: window1.width/72
            style: ButtonStyle {
                    label: Text {
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.pointSize: devFontSize
                        color: "black"
                        text: control.text
                      }
            }
            onClicked: degaus === false ? compass.addDelta("4",deviationCourse) : compass.addDeltaDegaus("4",deviationCourse)
        }

        Button {
            id: but5
            width: window1.width/8.674698795
            height: window1.width/13.457943925
            text: qsTr("5")
            anchors.left: but4.right
            anchors.leftMargin: window1.width/48
            anchors.top: but7.bottom
            anchors.topMargin: window1.width/72
            style: ButtonStyle {
                    label: Text {
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.pointSize: devFontSize
                        color: "black"
                        text: control.text
                      }
            }
            onClicked: degaus === false ? compass.addDelta("5",deviationCourse) : compass.addDeltaDegaus("5",deviationCourse)
        }

        Button {
            id: but6
            width: window1.width/8.674698795
            height: window1.width/13.457943925
            text: qsTr("6")
            anchors.left: but5.right
            anchors.leftMargin: window1.width/48
            anchors.top: but7.bottom
            anchors.topMargin: window1.width/72
            style: ButtonStyle {
                    label: Text {
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.pointSize: devFontSize
                        color: "black"
                        text: control.text
                      }
            }
            onClicked: degaus === false ? compass.addDelta("6",deviationCourse) : compass.addDeltaDegaus("6",deviationCourse)
        }

        Button {
            id: but1
            width: window1.width/8.674698795
            height: window1.width/13.457943925
            text: qsTr("1")
            anchors.left: textField1.left
            anchors.leftMargin: 0
            anchors.top: but4.bottom
            anchors.topMargin: window1.width/72
            style: ButtonStyle {
                    label: Text {
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.pointSize: devFontSize
                        color: "black"
                        text: control.text
                      }

            }
            onClicked: degaus === false ? compass.addDelta("1",deviationCourse) : compass.addDeltaDegaus("1",deviationCourse)
        }

        Button {
            id: but2
            width: window1.width/8.674698795
            height: window1.width/13.457943925
            text: qsTr("2")
            anchors.left: but1.right
            anchors.leftMargin: window1.width/48
            anchors.top: but4.bottom
            anchors.topMargin: window1.width/72
            style: ButtonStyle {
                    label: Text {
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.pointSize: devFontSize
                        color: "black"
                        text: control.text
                      }
            }
            onClicked: degaus === false ? compass.addDelta("2",deviationCourse) : compass.addDeltaDegaus("2",deviationCourse)
        }

        Button {
            id: but3
            width: window1.width/8.674698795
            height: window1.width/13.457943925
            text: qsTr("3")
            anchors.left: but2.right
            anchors.leftMargin: window1.width/48
            anchors.top: but4.bottom
            anchors.topMargin: window1.width/72
            style: ButtonStyle {
                    label: Text {
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.pointSize: devFontSize
                        color: "black"
                        text: control.text
                      }
            }
            onClicked: degaus === false ? compass.addDelta("3",deviationCourse) : compass.addDeltaDegaus("3",deviationCourse)
        }

        Button {
            id: butSave
            width: window1.width/8.674698795
            height: window1.width/13.457943925
            text: qsTr("Сохранить")
            anchors.left: textField1.left
            anchors.leftMargin: 0
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
            onClicked:  degaus === false ? compass.addDelta("save",deviationCourse) : compass.addDeltaDegaus("save",deviationCourse)
        }

        Button {
            id: button0
            width: window1.width/8.674698795
            height: window1.width/13.457943925
            text: qsTr("0")
            anchors.left: butSave.right
            anchors.leftMargin: window1.width/48
            anchors.top: but1.bottom
            anchors.topMargin: window1.width/72
            style: ButtonStyle {
                    label: Text {
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.pointSize: devFontSize
                        color: "black"
                        text: control.text
                      }
            }
            onClicked: degaus === false ? compass.addDelta("0",deviationCourse) : compass.addDeltaDegaus("0",deviationCourse)
        }

        TextField {
            id: textField1
            y: window1.width/5.329959514
            width: window1.width/3.692307692
            height: window1.width/13.58490566
            z: 1
            placeholderText: qsTr("Text Field")
            text:  degaus === false ? (delta_str > 0.1 ? "+" + delta_str : delta_str) : (deltaDegaus_str > 0.1 ? "+" + deltaDegaus_str : deltaDegaus_str)
            anchors.left: parent.left
            anchors.leftMargin: (rectangle1.width-(buttonC0.width*4 + degausButton.width))/2
            font.pixelSize: window1.width/16.363636364
        }

        Button {
            id: butDel
            width: window1.width/8.674698795
            height: window1.width/13.457943925
            text: qsTr("<-")
            anchors.top: textField1.bottom
            anchors.topMargin: -window1.width/13.457943925
            anchors.left: textField1.right
            anchors.leftMargin: window1.width/288
            style: ButtonStyle {
                    label: Text {
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.pointSize: devFontSize
                        color: "black"
                        text: control.text
                      }
            }
            onClicked: degaus === false ? compass.addDelta("<-",deviationCourse) : compass.addDeltaDegaus("<-",deviationCourse)
        }

        Button {
            id: butPlus
            y: window1.width/3.945205479
            width: window1.width/8.674698795
            height: window1.width/13.457943925
            text: qsTr("+0.1")
            anchors.left: but9.right
            anchors.leftMargin: window1.width/48
            anchors.top: textField1.bottom
            anchors.topMargin: window1.width/18.227848101
            style: ButtonStyle {
                    label: Text {
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.pointSize: devFontSize
                        color: "black"
                        text: control.text
                      }
            }
            onClicked:  degaus === false ? compass.addDelta("+0.1",deviationCourse) : compass.addDeltaDegaus("+0.1",deviationCourse)
        }

        Button {
            id: butMinus
            y: window1.width/2.909090909
            width: window1.width/8.674698795
            height: window1.width/13.457943925
            text: qsTr("-0.1")
            anchors.left: but3.right
            anchors.leftMargin: window1.width/48
            anchors.top: textField1.bottom
            anchors.topMargin: window1.width/6.76056338
            style: ButtonStyle {
                    label: Text {
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.pointSize: devFontSize
                        color: "black"
                        text: control.text
                      }
            }
            onClicked: degaus === false ? compass.addDelta("-0.1",deviationCourse) : compass.addDeltaDegaus("-0.1",deviationCourse)
        }
        Button {
            id: buttonC0
            x: window1.width/10.909090909
            y: window1.width/96
            width: window1.width/8.674698795
            height: window1.width/13.457943925
            text: qsTr("0")
            anchors.right: but7.right
            anchors.rightMargin: 0
            anchors.bottom: but7.top
            anchors.bottomMargin: window1.width/5.052631579
            style: ButtonStyle {
                    label: Text {
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.pointSize: devFontSize
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
            width: window1.width/8.674698795
            height: window1.width/13.457943925
            text: qsTr("45")
            anchors.top: buttonC0.top
            anchors.topMargin: 0
            anchors.left: buttonC0.right
            anchors.leftMargin: 2
            style: ButtonStyle {
                label: Text {
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.pointSize: devFontSize
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
            width: window1.width/8.674698795
            height: window1.width/13.457943925
            text: qsTr("90")
            anchors.top: buttonC0.top
            anchors.topMargin: 0
            anchors.left: buttonC45.right
            anchors.leftMargin: 2
            style: ButtonStyle {
                label: Text {
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.pointSize: devFontSize
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
            width: window1.width/8.674698795
            height: window1.width/13.457943925
            text: qsTr("135")
            anchors.top: buttonC0.top
            anchors.topMargin: 0
            anchors.left: buttonC90.right
            anchors.leftMargin: 2
            style: ButtonStyle {
                label: Text {
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.pointSize: devFontSize
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
            width: window1.width/8.674698795
            height: window1.width/13.457943925
            text: qsTr("180")
            anchors.left: buttonC0.left
            anchors.leftMargin: 0
            anchors.top: buttonC0.bottom
            anchors.topMargin: 2
            style: ButtonStyle {
                    label: Text {
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.pointSize: devFontSize
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
            width: window1.width/8.674698795
            height: window1.width/13.457943925
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
                        font.pointSize: devFontSize
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
            width: window1.width/8.674698795
            height: window1.width/13.457943925
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
                        font.pointSize: devFontSize
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
            width: window1.width/8.674698795
            height: window1.width/13.457943925
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
                        font.pointSize: devFontSize
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
            width: window1.width/8.674698795
            text: degaus===false ? degausButText="РУ выкл" : degausButText = "РУ вкл"
            anchors.left: buttonC135.right
            anchors.leftMargin: 5
            anchors.bottom: buttonC315.bottom
            anchors.bottomMargin: window1.width/27.169811321
            anchors.top: buttonC135.top
            anchors.topMargin: window1.width/27.169811321
            style: ButtonStyle {
                label: Text {
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.pointSize: devFontSize
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
            id: buttonDo
            width: window1.width/8.674698795
            height: window1.width/13.457943925
            text: qsTr("Расчитать")
            anchors.left: button0.right
            anchors.leftMargin: window1.width/48
            anchors.top: butMinus.bottom
            anchors.topMargin: window1.width/17.777777778
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
            onClicked: compass.getDevCoef()
        }

    }





}


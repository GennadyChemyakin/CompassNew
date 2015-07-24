import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Rectangle {
    id: deviationRect
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


    property int buttonWidthKeyboard: window1.width/9.0
    property int buttonHeightKeyboard: window1.height/9.0
    property int buttonFontSize:buttonHeightKeyboard / 3.0
    property real buttonMargin:buttonHeightKeyboard / 5.5

    function setMod(arg){
        modeSKL = arg
    }

    function changeDeviationButtonState(deviationCourse){
        if(deviationCourse === 1){
            buttonC0.buttonC0Color = "#42e73a";
        } else if(deviationCourse === 2){
            buttonC45.buttonC45Color = "#42e73a";
        } else if(deviationCourse === 3){
            buttonC90.buttonC90Color = "#42e73a";
        } else if(deviationCourse === 4){
            buttonC135.buttonC135Color = "#42e73a";
        } else if(deviationCourse === 5){
            buttonC180.buttonC180Color = "#42e73a";
        } else if(deviationCourse === 6){
            buttonC225.buttonC225Color = "#42e73a";
        }else if(deviationCourse === 7){
            buttonC270.buttonC270Color = "#42e73a";
        }else if(deviationCourse === 8){
            buttonC315.buttonC315Color = "#42e73a";
        }
    }

    function deviationButtonsStateReset(){
        buttonC0.buttonC0Color = Qt.binding(function(){return deviationCourse === 1 ? "#42e73a":"white";})
        buttonC45.buttonC45Color = Qt.binding(function(){return deviationCourse === 2 ? "#42e73a":"white";})
        buttonC90.buttonC90Color = Qt.binding(function(){return deviationCourse === 3 ? "#42e73a":"white";})
        buttonC135.buttonC135Color = Qt.binding(function(){return deviationCourse === 4 ? "#42e73a":"white";})
        buttonC180.buttonC180Color = Qt.binding(function(){return deviationCourse === 5 ? "#42e73a":"white";})
        buttonC225.buttonC225Color = Qt.binding(function(){return deviationCourse === 6 ? "#42e73a":"white";})
        buttonC270.buttonC270Color = Qt.binding(function(){return deviationCourse === 7 ? "#42e73a":"white";})
        buttonC315.buttonC315Color = Qt.binding(function(){return deviationCourse === 8 ? "#42e73a":"white";})
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
            anchors.topMargin: buttonMargin
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
            onClicked: degaus === false ? compass.addDelta("7",deviationCourse) : compass.addDeltaDegaus("7",deviationCourse)
        }
        Button {
            id: butPLUSMINUS
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
            text: qsTr("+/-")
            anchors.left: butDel.right
            anchors.leftMargin: buttonMargin
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
            onClicked: degaus === false ? compass.addDelta("+/-",deviationCourse) : compass.addDeltaDegaus("+/-",deviationCourse)
        }

        Button {
            id: but8
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
            text: qsTr("8")
            anchors.left: but7.right
            anchors.leftMargin: buttonMargin
            anchors.top: textField1.bottom
            anchors.topMargin: buttonMargin
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
            onClicked: degaus === false ? compass.addDelta("8",deviationCourse) : compass.addDeltaDegaus("8",deviationCourse)
        }

        Button {
            id: but9
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
            text: qsTr("9")
            anchors.left: but8.right
            anchors.leftMargin: buttonMargin
            anchors.top: textField1.bottom
            anchors.topMargin: buttonMargin
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
            onClicked: degaus === false ?  compass.addDelta("9",deviationCourse) : compass.addDeltaDegaus("9",deviationCourse)
        }

        Button {
            id: but4
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
            text: qsTr("4")
            anchors.left: but7.left
            anchors.leftMargin: 0
            anchors.top: but7.bottom
            anchors.topMargin: buttonMargin
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
            onClicked: degaus === false ? compass.addDelta("4",deviationCourse) : compass.addDeltaDegaus("4",deviationCourse)
        }

        Button {
            id: but5
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
            text: qsTr("5")
            anchors.left: but4.right
            anchors.leftMargin: buttonMargin
            anchors.top: but7.bottom
            anchors.topMargin: buttonMargin
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
            onClicked: degaus === false ? compass.addDelta("5",deviationCourse) : compass.addDeltaDegaus("5",deviationCourse)
        }

        Button {
            id: but6
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
            text: qsTr("6")
            anchors.left: but5.right
            anchors.leftMargin: buttonMargin
            anchors.top: but7.bottom
            anchors.topMargin: buttonMargin
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
            onClicked: degaus === false ? compass.addDelta("6",deviationCourse) : compass.addDeltaDegaus("6",deviationCourse)
        }

        Button {
            id: but1
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
            text: qsTr("1")
            anchors.left: but7.left
            anchors.leftMargin: 0
            anchors.top: but4.bottom
            anchors.topMargin: buttonMargin
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
            onClicked: degaus === false ? compass.addDelta("1",deviationCourse) : compass.addDeltaDegaus("1",deviationCourse)
        }

        Button {
            id: but2
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
            text: qsTr("2")
            anchors.left: but1.right
            anchors.leftMargin: buttonMargin
            anchors.top: but4.bottom
            anchors.topMargin: buttonMargin
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
            onClicked: degaus === false ? compass.addDelta("2",deviationCourse) : compass.addDeltaDegaus("2",deviationCourse)
        }

        Button {
            id: but3
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
            text: qsTr("3")
            anchors.left: but2.right
            anchors.leftMargin: buttonMargin
            anchors.top: but4.bottom
            anchors.topMargin: buttonMargin
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
            onClicked: degaus === false ? compass.addDelta("3",deviationCourse) : compass.addDeltaDegaus("3",deviationCourse)
        }

        Button {
            id: butSave
            signal saveClicked(int deviationCourse)
            Component.onCompleted: {
                butSave.saveClicked.connect(changeDeviationButtonState)
            }
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
            text: qsTr("Сохранить")
            anchors.left: but1.left
            anchors.leftMargin: 0
            anchors.top: but1.bottom
            anchors.topMargin: buttonMargin
            style: ButtonStyle {
                    label: Text {
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.pointSize: buttonFontSize / 2
                        color: "black"
                        text: control.text
                      }
                    background:
                        Rectangle {
                            gradient: Gradient {
                                GradientStop { position: 0 ; color: control.pressed ? "#42e73a" : "white" }
                                GradientStop { position: 1 ; color: control.pressed ? "#42e73a" : "white" }
                            }
                        }
            }
            onClicked:{
                degaus === false ? compass.addDelta("save",deviationCourse) : compass.addDeltaDegaus("save",deviationCourse)
                butSave.saveClicked(deviationCourse)
            }
        }

        Button {
            id: button0
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
            text: qsTr("0")
            anchors.left: butSave.right
            anchors.leftMargin: buttonMargin
            anchors.top: but1.bottom
            anchors.topMargin: buttonMargin
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
            onClicked: degaus === false ? compass.addDelta("0",deviationCourse) : compass.addDeltaDegaus("0",deviationCourse)
        }

        TextField {
            id: textField1
            x: (deviationRect.width - (14 + 5 * buttonWidthKeyboard))/2
            y: (deviationRect.height - (4 * buttonMargin + 5 * buttonHeightKeyboard) + buttonMargin + 2 * buttonHeightKeyboard)/2
            width: buttonWidthKeyboard * 2 + buttonMargin
            height: buttonHeightKeyboard
            z: 1
            placeholderText: qsTr("Text Field")
            text:  degaus === false ? (delta_str > 0 ? "+" + delta_str : delta_str) : (deltaDegaus_str > 0 ? "+" + deltaDegaus_str : deltaDegaus_str)
            font.pixelSize: textField1.height / 1.5
        }

        Button {
            id: butDel
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
            text: qsTr("<-")
            anchors.top: textField1.top
            anchors.topMargin: 0
            anchors.left: textField1.right
            anchors.leftMargin: buttonMargin
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
            onClicked: degaus === false ? compass.addDelta("<-",deviationCourse) : compass.addDeltaDegaus("<-",deviationCourse)

        }

        Button {
            id: butPlus
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
            text: qsTr("+0.1")
            anchors.left: but9.right
            anchors.leftMargin: buttonMargin
            anchors.top: but9.top
            anchors.topMargin: but9.height/2 + buttonMargin / 2
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
            onClicked:  degaus === false ? compass.addDelta("+0.1",deviationCourse) : compass.addDeltaDegaus("+0.1",deviationCourse)
        }

        Button {
            id: butMinus
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
            text: qsTr("-0.1")
            anchors.bottom: but3.bottom
            anchors.bottomMargin: but3.height/2 + buttonMargin / 2
            anchors.left: but3.right
            anchors.leftMargin: buttonMargin
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
            onClicked: degaus === false ? compass.addDelta("-0.1",deviationCourse) : compass.addDeltaDegaus("-0.1",deviationCourse)
        }
        Button {
            id: buttonC0
            property color buttonC0Color: deviationCourse === 1 ? "#42e73a":"white"
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
            text: qsTr("0")
            anchors.right: but7.right
            anchors.rightMargin: 0
            anchors.bottom: textField1.top
            anchors.bottomMargin: buttonMargin + buttonHeightKeyboard  + 2
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
                        id: buttonC0backGround
                        implicitWidth: 100
                        implicitHeight: 25
                        border.width: control.activeFocus ? 2 : 1
                        border.color: "#888"
                        radius: 4
                        color: buttonC0.buttonC0Color
                    }
            }
            onClicked: {
                deviationCourse = 1
                degaus === false ? compass.addDelta("reset",deviationCourse) : compass.addDeltaDegaus("reset",deviationCourse)
            }
        }

        Button {
            id: buttonC45
            property color buttonC45Color: deviationCourse === 2 ? "#42e73a":"white"
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
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
                    id: buttonC45backGround
                    implicitWidth: 100
                    implicitHeight: 25
                    border.width: control.activeFocus ? 2 : 1
                    border.color: "#888"
                    radius: 4
                    color: buttonC45.buttonC45Color
                }
            }
            onClicked: {
                deviationCourse = 2
                degaus === false ? compass.addDelta("reset",deviationCourse) : compass.addDeltaDegaus("reset",deviationCourse)
            }
        }

        Button {
            id: buttonC90
            property color buttonC90Color: deviationCourse === 3 ? "#42e73a":"white"
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
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
                    id: buttonC90backGround
                    implicitWidth: 100
                    implicitHeight: 25
                    border.width: control.activeFocus ? 2 : 1
                    border.color: "#888"
                    radius: 4
                    color: buttonC90.buttonC90Color
                }
            }
            onClicked: {
                deviationCourse = 3
                degaus === false ? compass.addDelta("reset",deviationCourse) : compass.addDeltaDegaus("reset",deviationCourse)
            }
        }

        Button {
            id: buttonC135
            property color buttonC135Color: deviationCourse === 4 ? "#42e73a":"white"
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
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
                    color: buttonC135.buttonC135Color
                }
            }
            onClicked: {
                deviationCourse = 4
                degaus === false ? compass.addDelta("reset",deviationCourse) : compass.addDeltaDegaus("reset",deviationCourse)
            }
        }

        Button {
            id: buttonC180
            property color buttonC180Color: deviationCourse === 5 ? "#42e73a":"white"
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
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
                        color: buttonC180.buttonC180Color
                    }
            }
            onClicked: {
                deviationCourse = 5
                degaus === false ? compass.addDelta("reset",deviationCourse) : compass.addDeltaDegaus("reset",deviationCourse)
            }
        }

        Button {
            id: buttonC225
            property color buttonC225Color: deviationCourse === 6 ? "#42e73a":"white"
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
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
                        color: buttonC225.buttonC225Color
                    }
            }
            onClicked: {
                deviationCourse = 6
                degaus === false ? compass.addDelta("reset",deviationCourse) : compass.addDeltaDegaus("reset",deviationCourse)
            }
        }

        Button {
            id: buttonC270
            property color buttonC270Color: deviationCourse === 7 ? "#42e73a":"white"
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
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
                    color: buttonC270.buttonC270Color
                }
            }
            onClicked: {
                deviationCourse = 7
                degaus === false ? compass.addDelta("reset",deviationCourse) : compass.addDeltaDegaus("reset",deviationCourse)
            }
        }

        Button {
            id: buttonC315
            property color buttonC315Color: deviationCourse === 8 ? "#42e73a":"white"
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
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
                        color: buttonC315.buttonC315Color
                    }
            }
            onClicked: {
                deviationCourse = 8
                degaus === false ? compass.addDelta("reset",deviationCourse) : compass.addDeltaDegaus("reset",deviationCourse)
            }
        }
        Button {
            id: degausButton
            width: buttonWidthKeyboard
            text: degaus===false ? degausButText="РУ выкл" : degausButText = "РУ вкл"
            anchors.left: buttonC135.right
            anchors.leftMargin: 5
            anchors.bottom: buttonC315.bottom
            anchors.bottomMargin: buttonHeightKeyboard / 2
            anchors.top: buttonC135.top
            anchors.topMargin: buttonHeightKeyboard / 2
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
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
            text: qsTr("Расчитать")
            signal doClicked()

            Component.onCompleted: {
                buttonDo.doClicked.connect(deviationButtonsStateReset)
            }

            anchors.left: button0.right
            anchors.leftMargin: buttonMargin
            anchors.top: but3.bottom
            anchors.topMargin: buttonMargin
            style: ButtonStyle {
                    label: Text {
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.pointSize: buttonFontSize / 2
                        color: "black"
                        text: control.text
                      }
                    background:
                        Rectangle {
                            gradient: Gradient {
                                GradientStop { position: 0 ; color: control.pressed ? "#42e73a" : "white" }
                                GradientStop { position: 1 ; color: control.pressed ? "#42e73a" : "white" }
                            }
                        }
            }
            onClicked: {
                compass.getDevCoef()
                buttonDo.doClicked()
            }
        }

    }





}


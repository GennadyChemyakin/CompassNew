import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Rectangle {
    id: deviationRect
    width: settings.width-buttonWidth - button1.anchors.leftMargin * 2
    height: window1.height
//    width: 800
//    height: 600
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


    function setDelta(num,value){
        if(degaus == false)
            compass.addDelta(num, value);
        else
            compass.addDeltaDegaus(num, value);
    }



    Image {
        id: compensationBackground
        visible: true
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.fill: parent


        NewKeyboard{
            id:keyboardDisplay
            width: 640
            height: 480
            anchors.topMargin: buttonHeightKeyboard + buttonMargin
            anchors.left: buttonC0.left
            anchors.leftMargin: 0
            anchors.top: buttonC0.bottom
            z:2
            Connections{
                onSaved:{
                    setDelta(deviationCourse,keyboardDisplay.getValue());
                    changeDeviationButtonState(deviationCourse);
                }
            }
        }

        Button {
            id: buttonC0
            property color buttonC0Color: deviationCourse === 1 ? "#42e73a":"white"
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
            text: qsTr("0")
            x: buttonWidth/4
            y: buttonHeight/2
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
                degaus === false ? keyboardDisplay.setRes(compass.getDelta(deviationCourse)) : keyboardDisplay.setRes(compass.getDeltaDegaus(deviationCourse))
                compass.ledOn()
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
                degaus === false ? keyboardDisplay.setRes(compass.getDelta(deviationCourse)) : keyboardDisplay.setRes(compass.getDeltaDegaus(deviationCourse))
                compass.ledOn()
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
                degaus === false ? keyboardDisplay.setRes(compass.getDelta(deviationCourse)) : keyboardDisplay.setRes(compass.getDeltaDegaus(deviationCourse))
                compass.ledOn()
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
                degaus === false ? keyboardDisplay.setRes(compass.getDelta(deviationCourse)) : keyboardDisplay.setRes(compass.getDeltaDegaus(deviationCourse))
                compass.ledOn()
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
                degaus === false ? keyboardDisplay.setRes(compass.getDelta(deviationCourse)) : keyboardDisplay.setRes(compass.getDeltaDegaus(deviationCourse))
                compass.ledOn()
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
                degaus === false ? keyboardDisplay.setRes(compass.getDelta(deviationCourse)) : keyboardDisplay.setRes(compass.getDeltaDegaus(deviationCourse))
                compass.ledOn()
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
                degaus === false ? keyboardDisplay.setRes(compass.getDelta(deviationCourse)) : keyboardDisplay.setRes(compass.getDeltaDegaus(deviationCourse))
                compass.ledOn()
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
                degaus === false ? keyboardDisplay.setRes(compass.getDelta(deviationCourse)) : keyboardDisplay.setRes(compass.getDeltaDegaus(deviationCourse))
                compass.ledOn()
            }
        }
        Button {
            id: degausButton
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
            text: degaus===false ? degausButText="РУ выкл" : degausButText = "РУ вкл"
            anchors.left: buttonC135.right
            anchors.leftMargin: 5
            anchors.top: buttonC0.top
            anchors.topMargin: 0
            signal degausClicked()
            Component.onCompleted: {
                degausButton.degausClicked.connect(deviationButtonsStateReset)
            }
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
                degausClicked();
                console.log(degaus);
                degaus === false ? keyboardDisplay.setRes(compass.getDelta(deviationCourse)) : keyboardDisplay.setRes(compass.getDeltaDegaus(deviationCourse))
                compass.ledOn()
            }
        }

        Button {
            id: buttonDo
            width: buttonWidthKeyboard
            height: buttonHeightKeyboard
            anchors.left: buttonC315.right
            anchors.leftMargin: 5
            anchors.top: buttonC315.top
            anchors.topMargin: 0
            text: qsTr("Расчитать")
            signal doClicked()
            x: 656
            y: 112

            Component.onCompleted: {
                buttonDo.doClicked.connect(deviationButtonsStateReset)
            }
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
                            radius: 4
                        }
            }
            onClicked: {
                compass.getDevCoef()
                buttonDo.doClicked()
                compass.ledOn()
            }
        }

    }





}


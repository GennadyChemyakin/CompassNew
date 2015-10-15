import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Rectangle {
    id: keyboard
    //width: settings.width-buttonWidth - button1.anchors.leftMargin * 2
    height: 4 * buttonMargin + 5 * buttonHeightKeyboard
    width: textField.width + 2 * buttonMargin + 2 * buttonWidthKeyboard
    //height: 480
    color: "#00000000"
    property int buttonWidthKeyboard: window1.width/9.0
    property int buttonHeightKeyboard: window1.height/9.0
    //property var buttonWidthKeyboard: 100
    //property var buttonHeightKeyboard: 100
    property var buttonFontSize:buttonHeightKeyboard / 3.0
    property var buttonMargin:20
    property var keyBoardRes :"0";

    function setRes(arg){
        keyBoardRes = arg;
        textField.text = Qt.binding(function(){return keyBoardRes;})
    }


    property bool modeSKL : true
    function setMod(arg){
        modeSKL = arg
    }

    function buttonClick(arg){
        if(arg == "<-"){
            keyBoardRes = keyBoardRes.toString().substring(0,keyBoardRes.toString().length-1);
            if(keyBoardRes == "" || keyBoardRes == "-")
                keyBoardRes = "0";
        }
        else if(arg == "+/-"){
            keyBoardRes *= -1;
        } else if(arg == "+0.1"){
            keyBoardRes = Math.round(((parseFloat(keyBoardRes) + 0.1)*10))/10;
        }
        else if(arg == "-0.1"){
            keyBoardRes = Math.round(((parseFloat(keyBoardRes) - 0.1)*10))/10;
        } else {
            if(keyBoardRes == "0" && arg != ".")
                keyBoardRes = "";
            keyBoardRes += arg;
        }

        if(keyBoardRes.toString().indexOf(".") > 0){
            keyBoardRes = keyBoardRes.toString().substring(0,keyBoardRes.toString().indexOf(".")+2);
        }



        if(keyBoardRes >= 180){
            keyBoardRes = "+180";
        } else if(keyBoardRes <= -180)
            keyBoardRes = "-180";

        textField.text = keyBoardRes;
    }

    signal saved()

    function getValue(){
        return parseFloat(keyBoardRes);
    }

    Component{
        id: keyboardButtonStyle

        ButtonStyle{
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
    }

    Button{
        id: button0
        anchors.left: buttonSave.right
        anchors.leftMargin: buttonMargin
        anchors.top: button2.bottom
        anchors.topMargin: buttonMargin
        width: buttonWidthKeyboard
        height: buttonHeightKeyboard
        text: qsTr("0")
        style: keyboardButtonStyle
        onClicked: buttonClick(text)
    }
    Button{
        id: button1
        anchors.left: button4.left
        anchors.leftMargin: 0
        anchors.top: button4.bottom
        anchors.topMargin: buttonMargin
        width: buttonWidthKeyboard
        height: buttonHeightKeyboard
        text: qsTr("1")
        style: keyboardButtonStyle
        onClicked: buttonClick(text)
    }
    Button{
        id: button2
        anchors.left: button1.right
        anchors.leftMargin: buttonMargin
        anchors.top: button5.bottom
        anchors.topMargin: buttonMargin
        width: buttonWidthKeyboard
        height: buttonHeightKeyboard
        text: qsTr("2")
        style: keyboardButtonStyle
        onClicked: buttonClick(text)
    }
    Button{
        id: button3
        anchors.left: button2.right
        anchors.leftMargin: buttonMargin
        anchors.top: button6.bottom
        anchors.topMargin: buttonMargin
        width: buttonWidthKeyboard
        height: buttonHeightKeyboard
        text: qsTr("3")
        style: keyboardButtonStyle
        onClicked: buttonClick(text)
    }
    Button{
        id: button4
        anchors.left: button7.left
        anchors.leftMargin: 0
        anchors.top: button7.bottom
        anchors.topMargin: buttonMargin
        width: buttonWidthKeyboard
        height: buttonHeightKeyboard
        text: qsTr("4")
        style: keyboardButtonStyle
        onClicked: buttonClick(text)
    }
    Button{
        id: button5
        anchors.left: button4.right
        anchors.leftMargin: buttonMargin
        anchors.top: button8.bottom
        anchors.topMargin: buttonMargin
        width: buttonWidthKeyboard
        height: buttonHeightKeyboard
        text: qsTr("5")
        style: keyboardButtonStyle
        onClicked: buttonClick(text)
    }
    Button{
        id: button6
        anchors.left: button5.right
        anchors.leftMargin: buttonMargin
        anchors.top: button9.bottom
        anchors.topMargin: buttonMargin
        width: buttonWidthKeyboard
        height: buttonHeightKeyboard
        text: qsTr("6")
        style: keyboardButtonStyle
        onClicked: buttonClick(text)
    }
    Button{
        id: button7
        width: buttonWidthKeyboard
        height: buttonHeightKeyboard
        text: qsTr("7")
        anchors.left: textField.left
        anchors.leftMargin: 0
        anchors.top: textField.bottom
        anchors.topMargin: buttonMargin
        style: keyboardButtonStyle
        onClicked: buttonClick(text)
    }
    Button{
        id: button8
        width: buttonWidthKeyboard
        height: buttonHeightKeyboard
        text: qsTr("8")
        anchors.left: button7.right
        anchors.leftMargin: buttonMargin
        anchors.top: button7.top
        anchors.topMargin: 0
        style: keyboardButtonStyle
        onClicked: buttonClick(text)
    }
    Button{
        id: button9
        width: buttonWidthKeyboard
        height: buttonHeightKeyboard
        text: qsTr("9")
        anchors.left: button8.right
        anchors.leftMargin: buttonMargin
        anchors.top: button8.top
        anchors.topMargin: 0
        style: keyboardButtonStyle
        onClicked: buttonClick(text)
    }
    Button{
        id: buttonSave
        anchors.left: button1.left
        anchors.leftMargin: 0
        anchors.top: button1.bottom
        anchors.topMargin: buttonMargin
        width: buttonWidthKeyboard
        height: buttonHeightKeyboard
        text: qsTr("Сохранить")
        style:  ButtonStyle {
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
        onClicked: saved();
    }
    Button{
        id: buttonPoint
        anchors.left: button0.right
        anchors.leftMargin: buttonMargin
        anchors.top: button3.bottom
        anchors.topMargin: buttonMargin
        width: buttonWidthKeyboard
        height: buttonHeightKeyboard
        text: qsTr(".")
        style: keyboardButtonStyle
        onClicked: buttonClick(text)
    }
    Button{
        id: buttonDel
        anchors.left: textField.right
        anchors.leftMargin: buttonMargin
        anchors.top: textField.top
        anchors.topMargin: 0
        width: buttonWidthKeyboard
        height: buttonHeightKeyboard
        text: qsTr("<-")
        style: keyboardButtonStyle
        onClicked: buttonClick(text)
    }
    Button{
        id: buttonPlusMinus
        anchors.left: button9.right
        anchors.leftMargin: buttonMargin
        anchors.top: buttonDel.bottom
        anchors.topMargin: buttonMargin
        width: buttonWidthKeyboard
        height: buttonHeightKeyboard
        text: qsTr("+/-")
        style: keyboardButtonStyle
        onClicked: buttonClick(text)
    }
    Button{
        id: buttonPlus
        anchors.left: button9.right
        anchors.leftMargin: buttonMargin
        anchors.top: buttonPlusMinus.bottom
        anchors.topMargin: buttonMargin
        width: buttonWidthKeyboard
        height: buttonHeightKeyboard
        text: qsTr("+0.1")
        style: keyboardButtonStyle
        onClicked: buttonClick(text)
    }
    Button{
        id: buttonMinus
        anchors.left: button6.right
        anchors.leftMargin: buttonMargin
        anchors.top: buttonPlus.bottom
        anchors.topMargin: buttonMargin
        width: buttonWidthKeyboard
        height: buttonHeightKeyboard
        text: qsTr("-0.1")
        style: keyboardButtonStyle
        onClicked: buttonClick(text)
    }
    TextField {
        id: textField
        x: 0
        y: 0
        width: buttonWidthKeyboard * 3 + buttonMargin * 2
        height: buttonHeightKeyboard
        z: 1
        placeholderText: qsTr("")
        text: keyBoardRes
        font.pixelSize: textField.height / 1.5
    }


}


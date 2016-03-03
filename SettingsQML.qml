import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Rectangle {
    id: settings
    //width: window1.width
    //height: window1.height
    width: 1440
    height: 980
    property int buttonWidth:window1.width / 4
    property int buttonHeight:window1.height / 14
    property int buttonFontSize:buttonHeight / 3
    property int buttonNum:0

    PasswordDial{
        id:passDial
        width: settings.width
        height: settings.height
        visible: false
        z:5
    }

    Compensation
    {
        id:compensationDisplay
        width: settings.width-buttonWidth - button1.anchors.leftMargin * 2
        height: settings.height
        anchors.rightMargin: -compensationDisplay.width
        anchors.right: parent.right
        z:2
    }
    Deviation
    {
        id:deviationDisplay
        width: settings.width-buttonWidth - button1.anchors.leftMargin * 2
        height: settings.height
        anchors.rightMargin: -deviationDisplay.width
        anchors.right: parent.right
        z:2
    }

    NewKeyboard
    {
        id:keyboardDisplay
        //width: settings.width-buttonWidth - button1.anchors.leftMargin * 2
        //height: settings.height
        anchors.rightMargin: -keyboardDisplay.width
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: (settings.height - keyboardDisplay.height)/2
        Component.onCompleted: {
            console.log(keyboardDisplay.height)
        }

        z:2
    }

    function setA(){
        compass.setA(keyboardDisplay.getValue());
    }
    function setSKL(){
        compass.setSKL(keyboardDisplay.getValue());
    }

    MoreInfo
       {
           id:moreInfoDisp
           width: settings.width-buttonWidth - button1.anchors.leftMargin * 2
           height: settings.height
           anchors.rightMargin: -compensationDisplay.width
           anchors.right: parent.right
           z:2
       }
       ParallelAnimation {
           id: slideMoreInfoForward
           PropertyAnimation {
               target: moreInfoDisp
               properties: "anchors.rightMargin"
               to: 0
               duration: 300
           }
       }
    Rectangle
    {
        id: backgroundviewer
        x: 0
        y: 0
        width: settings.width - buttonWidth - button1.anchors.leftMargin * 2
        height: settings.height
        color: "#00000000"
        anchors.rightMargin: -backgroundviewer.width
        anchors.right: parent.right
        z:2


    }
    ParallelAnimation{
        id:passDialShow
        PropertyAnimation{
            target:passDial
            properties: "visible"
            to: true
            duration:5
        }
    }
    ParallelAnimation{
        id:passDialClose
        PropertyAnimation{
            target:passDial
            properties: "visible"
            to: false
            duration:5
        }
    }
    ParallelAnimation{
        id:passDialAccept
        PropertyAnimation{
            target:passDial
            properties: "visible"
            to: false
            duration:1000
        }
    }

    ParallelAnimation {
        id: slideBackgroundForward
        PropertyAnimation {
            target: backgroundviewer
            properties: "anchors.rightMargin"
            to: 0
            duration: 300
        }
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
        id: slideDeviationForward
        PropertyAnimation {
            target: deviationDisplay
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
            to: -keyboardDisplay.width
            duration: 0
        }
        PropertyAnimation {
            target: deviationDisplay
            properties: "anchors.rightMargin"
            to: -deviationDisplay.width
            duration: 0
        }
        PropertyAnimation {
            target: moreInfoDisp
            properties: "anchors.rightMargin"
            to: -moreInfoDisp.width
            duration: 0
        }
        PropertyAnimation {
            target: backgroundviewer
            properties: "anchors.rightMargin"
            to: -backgroundviewer.width
            duration: 0
        }
    }
    Rectangle {
        id: settingsBackground
        z: 1
        anchors.fill: parent
        //source: (m_background === 0 ? "content/steel4.png" :( m_background === 1 ? "content/steel3.png":(m_background === 2 ? "content/steel2.png":(m_background === 3 ? "content/wood.png":(m_background === 4 ? "content/steel.png":"content/steel4.png")))))
        color: "#082567"
        Button {
            id: button1
            width: settings.buttonWidth
            height:settings.buttonHeight
            text: qsTr("Калибровка")

            anchors.left: parent.left
            anchors.leftMargin: width / 10
            anchors.top: rectangle2.bottom
            anchors.topMargin: height / 2
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
                        color: buttonNum === 1 ? "#42e73a":"white"

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
            id: button3
            width: settings.buttonWidth
            height:settings.buttonHeight
            text: qsTr("Склонение")
            anchors.left: parent.left
            anchors.leftMargin: width / 10
            anchors.top: button1.bottom
            anchors.topMargin: height / 2
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
                        color: buttonNum === 3 ? "#42e73a":"white"
                    }
                }

            onClicked:
            {
                keyboardDisplay.setMod(true)
                keyboardDisplay.setRes(compass.getSKL())
                keyboardDisplay.saved.disconnect(setA)
                keyboardDisplay.saved.connect(setSKL)
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
            anchors.leftMargin: width / 10
            anchors.top: button3.bottom
            anchors.topMargin: height / 2
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
                        color: buttonNum === 4 ? "#42e73a":"white"

                    }
                }
            onClicked:
            {
                slideCompBack.start()
                slideMoreInfoForward.start()
                buttonNum = 4
            }
        }

        Button
        {
            id: button5
            width: settings.buttonWidth
            height:settings.buttonHeight
            anchors.left: parent.left
            anchors.leftMargin: width / 10
            anchors.top: button4.bottom
            anchors.topMargin: height / 2
            style: ButtonStyle {
                label: Text {
                        id:button5Text
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.pointSize: buttonFontSize
                        color: "black"
                        text: "MK"
                        Component.onCompleted: button5Text.text = Qt.binding(function(){
                            if(trueMagneticCourse === 0)
                                return "KK";
                            else if(trueMagneticCourse === 1)
                                return "MK";
                            else if(trueMagneticCourse === 2)
                                return "ИК";
                        })
                      }
            }
            onClicked: compass.changeTrueMagneticCourse()
        }

        Button {
            id: dayNightButton
            width: settings.buttonWidth
            height:settings.buttonHeight
            anchors.left: parent.left
            anchors.leftMargin: width / 10
            anchors.top: button7.bottom
            anchors.topMargin: height / 2
            text: qsTr("ДЕНЬ")
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
            onClicked: {
                dayNight = !dayNight
                dayNight === true ? sourseCompass10 = "content/compass10day.png" : sourseCompass10 = "content/compass10night.png"
                dayNight === true ? sourseCompass360 = "content/compass360day.png" : sourseCompass360 = "content/compass360night.png"
                dayNight === true ? sourceBackground = "content/backgroundDay.png" : sourceBackground = "content/backgroundNight.png"
                dayNight === true ? dayNightButton.text = "ДЕНЬ" : dayNightButton.text = "НОЧЬ"
            }
        }



        Button {
            id: button6
            width: settings.buttonWidth
            height:settings.buttonHeight
            text: qsTr("Коэффициент A")
            anchors.left: parent.left
            anchors.leftMargin: width / 10
            anchors.top: button5.bottom
            anchors.topMargin: height / 2
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
                        color: buttonNum === 6 ? "#42e73a":"white"

                    }
                }

            onClicked:
            {
                keyboardDisplay.setMod(false)
                keyboardDisplay.setRes(compass.getA())
                keyboardDisplay.saved.disconnect(setSKL)
                keyboardDisplay.saved.connect(setA)
                slideCompBack.start()
                slideKeybordForward.start()
                buttonNum = 6
            }
        }
        Button {
            id: button7
            width: settings.buttonWidth
            height:settings.buttonHeight
            text: qsTr("Девиация")
            anchors.left: parent.left
            anchors.leftMargin: width / 10
            anchors.top: button6.bottom
            anchors.topMargin: height / 2
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
                        color: buttonNum === 7 ? "#42e73a":"white"

                    }
                }
            onClicked:
            {
                //deviationDisplay.setMod(false)
                slideCompBack.start()
                slideDeviationForward.start()
                buttonNum = 7
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
            anchors.leftMargin: button1.width / 10
        }

        Rectangle {
            id: rectangle2
            height: 1
            color: "#ffffff"
            anchors.top: parent.top
            anchors.topMargin: lcdDisplay.height * 1.5
            z: 1
            anchors.right: rectangle1.left
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
        }

    }
}

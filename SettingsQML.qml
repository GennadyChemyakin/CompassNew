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
    Rectangle
    {
        id: backgroundviewer
        x: 0
        y: 0
        width: settings.width-buttonWidth - button1.anchors.leftMargin * 2
        height: settings.height
        //width: 1980
        //height: 1020
        color: "#00000000"
        anchors.rightMargin: -backgroundviewer.width
        anchors.right: parent.right
        z:2

        Rectangle
        {
            id: image1rect
            width: 306
            height: 306
            color: "#00000000"
            anchors.left: parent.left
            anchors.leftMargin: 100
            anchors.top: parent.top
            anchors.topMargin: 100
            Image {
                id: image1
                source: "content/steel4.png"
                anchors.horizontalCenter: image1rect.horizontalCenter
                anchors.verticalCenter: image1rect.verticalCenter
                width: 300
                height: 300
            }
            border.width: 3
            border.color: (m_background===0 ? "green": "#00000000")
            MouseArea
            {
                anchors.fill: parent
                onClicked: compass.changeBackground(0)
            }
        }

        Rectangle
        {
            id: image2rect
            width: 306
            height: 306
            color: "#00000000"
            anchors.left: image1rect.right
            anchors.leftMargin: 100
            anchors.top: parent.top
            anchors.topMargin: 100
            Image {
                id: image2
                source: "content/steel3.png"
                anchors.horizontalCenter: image2rect.horizontalCenter
                anchors.verticalCenter: image2rect.verticalCenter
                width: 300
                height: 300
            }
            border.width: 3
            border.color: (m_background===1 ? "green": "#00000000")
            MouseArea
            {
                anchors.fill: parent
                onClicked: compass.changeBackground(1)
            }
        }

        Rectangle
        {
            id: image3rect
            width: 306
            height: 306
            color: "#00000000"
            anchors.left: image2rect.right
            anchors.leftMargin: 100
            anchors.top: parent.top
            anchors.topMargin: 100
            Image {
                id: image3
                source: "content/steel2.png"
                anchors.horizontalCenter: image3rect.horizontalCenter
                anchors.verticalCenter: image3rect.verticalCenter
                width: 300
                height: 300
            }
            border.width: 3
            border.color: m_background===2 ? "green": "#00000000"
            MouseArea
            {
                anchors.fill: parent
                onClicked: compass.changeBackground(2)
            }
        }
        Rectangle
        {
            id: image4rect
            width: 306
            height: 306
            color: "#00000000"
            anchors.left: parent.left
            anchors.leftMargin: 100
            anchors.top: image1rect.bottom
            anchors.topMargin: 150
            Image {
                id: image4
                source: "content/wood.png"
                anchors.horizontalCenter: image4rect.horizontalCenter
                anchors.verticalCenter: image4rect.verticalCenter
                width: 300
                height: 300
            }
            border.width: 3
            border.color: m_background===3 ? "green": "#00000000"
            MouseArea
            {
                anchors.fill: parent
                onClicked: compass.changeBackground(3)
            }
        }
        Rectangle
        {
            id: image5rect
            width: 306
            height: 306
            color: "#00000000"
            anchors.left: image4rect.right
            anchors.leftMargin: 100
            anchors.top: image2rect.bottom
            anchors.topMargin: 150
            Image {
                id: image5
                source: "content/steel.png"
                anchors.horizontalCenter: image5rect.horizontalCenter
                anchors.verticalCenter: image5rect.verticalCenter
                width: 300
                height: 300
            }
            border.width: 3
            border.color: m_background===4 ? "green": "#00000000"
            MouseArea
            {
                anchors.fill: parent
                onClicked: compass.changeBackground(4)
            }
        }
        Rectangle
        {
            id: image6rect
            width: 300
            height: 300
            color: "#00000000"
            anchors.left: image5rect.right
            anchors.leftMargin: 100
            anchors.top: image3rect.bottom
            anchors.topMargin: 150
            Image {
                id: image6
                source: "qrc:/qtquickplugin/images/template_image.png"
                anchors.horizontalCenter: image6rect.horizontalCenter
                anchors.verticalCenter: image6rect.verticalCenter
                width: 300
                height: 300
            }
            border.width: 3
            border.color: m_background===5 ? "green": "#00000000"
            MouseArea
            {
                anchors.fill: parent
                onClicked: compass.changeBackground(5)
            }
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
        PropertyAnimation {
            target: backgroundviewer
            properties: "anchors.rightMargin"
            to: -compensationDisplay.width
            duration: 0
        }
    }
    Image {
        id: settingsBackground
        z: 1
        anchors.fill: parent
        source: (m_background === 0 ? "content/steel4.png" :( m_background === 1 ? "content/steel3.png":(m_background === 2 ? "content/steel2.png":(m_background === 3 ? "content/wood.png":(m_background === 4 ? "content/steel.png":"content/steel4.png")))))

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
                slideBackgroundForward.start()
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

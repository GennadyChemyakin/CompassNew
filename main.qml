import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Window {
    id: window1
    width: 800
    height: 600
    title: qsTr("Compass")
    //visibility: "Windowed"
    visibility: "FullScreen"

    property string gradientcolor0: "#FF7C7C7C"
    property string gradientcolor1: "#FF4E4E4E"
    property string sourseCompass360: "content/compass360day.png"
    property string sourseCompass10: "content/compass10day.png"
    property string sourceBackground: "content/backgroundDay.png"
    property bool dayNight: true


    Rectangle
    {
        id: rectangle1
        anchors.fill: parent
        //width: 1440
        //height: 980

        function closeSettingsDisplay(){
            //settingsDisplay.settingsSlided = false;
            if(settingsDisplay.settingsSlided === true)
                slideLCDBack.start();
        }

        Connections {
            target: compass
            onCloseSettingsViewSignal: {
              rectangle1.closeSettingsDisplay()
            }
        }


        SettingsQML
        {
            id:settingsDisplay
            property bool settingsSlided: false
            width: window1.width
            height: window1.height
            anchors.right: parent.right
            anchors.rightMargin: -window1.width
            z:2
        }
        Image {
            id: backgrnCompass
            width: window1.height
            height: backgrnCompass.width
            property bool slided: false
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: 0
            z: 1
            source: sourceBackground
            Image {
                id: smallNeedle
                //x: 454
                //y: 16
                width: 4
                height: backgrnCompass.width / 4
                anchors.horizontalCenterOffset: -1
                anchors.verticalCenterOffset: -backgrnCompass.width / 4 - height / 2
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "content/needleSmall.png"
            }
        }
        ParallelAnimation {
            id: slideForward
            PropertyAnimation {
                target: backgrnCompass
                properties: "slided"
                to: true
                duration: 0
            }
            PropertyAnimation {
                target: backgrnCompass
                properties: "anchors.horizontalCenterOffset"
                to: -window1.width/4+window1.width/14.4
                duration: 300
            }
            PropertyAnimation {
                target: settingsDisplay
                properties: "anchors.rightMargin"
                to: 0
                duration: 300
            }
        }
        ParallelAnimation {
            id: slideBack
            PropertyAnimation {
                target: backgrnCompass
                properties: "slided"
                to: false
                duration: 0
            }
            PropertyAnimation {
                target: backgrnCompass
                properties: "anchors.horizontalCenterOffset"
                to: 0
                duration: 300
            }
            PropertyAnimation {
                target: settingsDisplay
                properties: "anchors.rightMargin"
                to: -settingsDisplay.width
                duration: 300
            }
        }

        ParallelAnimation {
            id: slideLCDForward
            PropertyAnimation {
                target: settingsDisplay
                properties: "settingsSlided"
                to: true
                duration: 0
            }
            PropertyAnimation {
                target: lcdDisplay
                properties: "anchors.horizontalCenterOffset"
                to: -window1.width / 2 + lcdDisplay.width / 2 + settingsDisplay.buttonWidth / 10
                duration: 300
            }
            PropertyAnimation {
                target: lcdDisplay
                properties: "anchors.verticalCenterOffset"
                to: -window1.height / 2 + lcdDisplay.height / 2 + settingsDisplay.buttonHeight / 2
                duration: 300
            }
            PropertyAnimation {
                target: lcdDisplay
                properties: "border.color"
                to: "faf0e6"
                duration: 300
            }
            PropertyAnimation {
                target: settingsDisplay
                properties: "anchors.rightMargin"
                to: 0
                duration: 300
            }
        }
        ParallelAnimation {
            id: slideLCDBack
            PropertyAnimation {
                target: settingsDisplay
                properties: "settingsSlided"
                to: false
                duration: 0
            }
            PropertyAnimation {
                target: lcdDisplay
                properties: "anchors.horizontalCenterOffset"
                to: 0
                duration: 300
            }
            PropertyAnimation {
                target: lcdDisplay
                properties: "anchors.verticalCenterOffset"
                to: 0
                duration: 300
            }
            PropertyAnimation {
                target: lcdDisplay
                properties: "border.color"
                to: dayNight === false ? "#000000" : "#faf0e6"
                duration: 300
            }
            PropertyAnimation {
                target: settingsDisplay
                properties: "anchors.rightMargin"
                to: -window1.width
                duration: 300
            }
        }
        Image {
            id: compass10
            x: 366
            y: 55
            width: compass360.width
            height: compass10.width
            anchors.centerIn: backgrnCompass
            z: 1
            anchors.verticalCenterOffset: 1
            anchors.horizontalCenterOffset: -2
            source: sourseCompass10
            transform: Rotation{
                angle: -fract_part*3.6
                axis.z: 1
                origin.x: compass10.width/2
                origin.y: compass10.height/2
                Behavior on angle
                   {
                       SpringAnimation
                       {
                           spring: 1.9
                           damping: 0.3
                       }
                   }
            }
        }

        Image {
            id: compass360
            anchors.centerIn: backgrnCompass
            z: 1
            width: backgrnCompass.width
            height: backgrnCompass.width
            source: sourseCompass360
            transform: Rotation{
                id: rotation1
                angle: -angle_value
                axis.z: 1
                origin.x: compass360.width/2
                origin.y: compass360.height/2
                Behavior on angle
                   {
                       SpringAnimation
                       {
                           spring: 1.9
                           damping: 0.3
                       }
                   }
            }
        }

        Image {
            id: border
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -110
            clip: false
            visible: false
            anchors.centerIn: parent
            z: 1
            source: "content/ramka.png"
        }

        Image {
            id: background
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.fill: parent
            z: 0
            //source: (m_background === 0 ? "content/steel4.png" :( m_background === 1 ? "content/steel3.png":(m_background === 2 ? "content/steel2.png":(m_background === 3 ? "content/wood.png":(m_background === 4 ? "content/steel.png":"content/steel4.png")))))
            source: dayNight === true ? "content/day.jpg" : "content/night.jpg"
        }

        Rectangle
        {
            id: lcdDisplay
            z: 3
            width: window1.width/4
            height: window1.height/6
            border.width: 3
            border.color: dayNight === false ? "#000000" : "#faf0e6"
            color: dayNight === false ? "#000000" : "#faf0e6"
            anchors.horizontalCenter: backgrnCompass.horizontalCenter
            anchors.verticalCenter: backgrnCompass.verticalCenter
            anchors.horizontalCenterOffset: 0
            anchors.verticalCenterOffset: 0
            FontLoader { id: a_LCDNovaObl; source: "content/a_LCDNovaObl.ttf" }
            Text
            {
                id: lcdNumbers
                anchors.centerIn: parent
                //text: afterComma === 0 ? full_angle%360+".0" : full_angle%360
                text: full_angle
                font.pixelSize: window1.width/9.6
                font.family: a_LCDNovaObl.name
                style: Text.Outline
                styleColor: "black"
                color: dayNight === false ? "#7fff00" : "black"
            }
        }

        Button
        {
            id: menuButton
            width: window1.width/7.0
            height: window1.height/10.0
            text: settingsDisplay.settingsSlided === false ? "Настройки":"Компас"
            anchors.right: parent.right
            anchors.rightMargin: 32
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            z:2
            style: ButtonStyle {
                label: Text {
                        id:menuText
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.pointSize: menuButton.height / 3
                        text: control.text
                      }
            }
            onClicked:{
                settingsDisplay.settingsSlided === false ? slideLCDForward.start():slideLCDBack.start();
                compass.startSettingsViewControlTimer(300000);
                settingsDisplay.settingsSlided === true ? tmkState.visible = false : tmkState.visible = true
            }

        }

        Button{
            id: tmkState
            y: 520
            width: menuButton.width
            height: menuButton.height
            anchors.left: parent.left
            anchors.leftMargin: 32
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            style: ButtonStyle {
                label: Text {
                        id:tmkStateText
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.pointSize: tmkState.height / 3
                        color: "black"
                        text: "MK"
                        Component.onCompleted: tmkStateText.text = Qt.binding(function(){
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
    }


}


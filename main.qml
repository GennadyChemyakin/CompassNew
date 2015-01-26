import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Window {
    id: window1
    width: 1440
    height: 980
    title: qsTr("Compass")

    visible: true

    property string gradientcolor0: "#FF7C7C7C"
    property string gradientcolor1: "#FF4E4E4E"

    Rectangle
    {
        id: rectangle1
        //anchors.fill: parent
    anchors.fill: parent

        Image {
            id: backgrnCompass
            anchors.centerIn: parent
            z: 2
            source: "content/baggraund.png"
            Image {
                id: smallNeedle
                x: 365
                y: 16
                width: 7
                source: "content/needleSmall.png"
            }
        }

        Image {
            id: compass10
            x: 370
            anchors.centerIn: parent
            z: 3
            width: 700
            height: 700
            anchors.horizontalCenterOffset: -3
            source: "content/kompasD12.png"
            transform: Rotation{
                angle: -fract_part*3.6
                axis.z: 1
                origin.x: 350
                origin.y: 350
                Behavior on angle
                   {
                       SpringAnimation
                       {
                           spring: 1.4
                           damping: 1
                       }
                   }
            }
        }

        Image {
            id: compass360
            anchors.centerIn: parent
            z: 3
            width: 700
            height: 700
            source: "content/kompas1(720).png"
            transform: Rotation{
                angle: -angle_value
                axis.z: 1
                origin.x: 350
                origin.y: 350
                Behavior on angle
                   {
                       SpringAnimation
                       {
                           spring: 1.4
                           damping: 0.5
                       }
                   }
            }
        }

        Image {
            id: border
            anchors.centerIn: parent
            z: 3
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
            source: (m_background === 0 ? "content/steel4.png" :( m_background === 1 ? "content/steel3.png":(m_background === 2 ? "content/steel2.png":(m_background === 3 ? "content/wood.png":"content/steel4.png"))))

        }

        Rectangle
        {
            id: lcdDisplay
            z: 5
            width: 177
            height: 85
            border.width: 3
            border.color: "green"
            color: "#000000"
            anchors.centerIn: parent
            FontLoader { id: a_LCDNovaObl; source: "content/a_LCDNovaObl.ttf" }
            Text
            {
                id: lcdNumbers
                anchors.centerIn: parent
                text: full_angle%360
                font.pixelSize: 50
                font.family: a_LCDNovaObl.name
                style: Text.Outline
                styleColor: "blue"
                color: "white"
            }
        }

//        Button {
//            id: buttonSettings
//            x: 1075
//            width: 200
//            height: 80
//            text: qsTr("Settings")
//            style: ButtonStyle {
//                    background: Rectangle {
//                        implicitWidth: 100
//                        implicitHeight: 25
//                        border.width: control.activeFocus ? 2 : 1
//                        border.color: "#888"
//                        radius: 4
//                        gradient: Gradient {
//                            GradientStop { position: 0 ; color: control.pressed ? "#FF7C7C7C" : "#FF4E4E4E" }
//                            GradientStop { position: 1 ; color: control.pressed ? "#FF4E4E4E" : "#FF7C7C7C" }
//                        }
//                    }
//                }
//            anchors.top: parent.top
//            anchors.topMargin: 100
//            anchors.right: parent.right
//            anchors.rightMargin: 10
//        }

//        Button {
//            id: buttonCoef
//            x: 1070
//            y: 0
//            width: 200
//            height: 80
//            text: qsTr("Coef")
//            style: ButtonStyle {
//                background: Rectangle {
//                    radius: 4
//                    implicitWidth: 100
//                    gradient: Gradient {
//                        GradientStop {
//                            position: 0
//                            color: control.pressed ? "#FF7C7C7C" : "#FF4E4E4E"
//                        }

//                        GradientStop {
//                            position: 1
//                            color: control.pressed ? "#FF4E4E4E" : "#FF7C7C7C"
//                        }
//                    }
//                    border.width: control.activeFocus ? 2 : 1
//                    border.color: "#888888"
//                    implicitHeight: 25
//                }
//            }
//            anchors.top: buttonSettings.bottom
//            anchors.rightMargin: 10
//            anchors.right: parent.right
//            anchors.topMargin: 40
//        }

//        Button {
//            id: buttonTrueCourse
//            x: 1070
//            y: 1
//            width: 200
//            height: 80
//            text: qsTr("True/Magnetic")
//            style: ButtonStyle {
//                background: Rectangle {
//                    radius: 4
//                    implicitWidth: 100
//                    gradient: Gradient {
//                        GradientStop {
//                            position: 0
//                            color: control.pressed ? "#FF7C7C7C" : "#FF4E4E4E"
//                        }

//                        GradientStop {
//                            position: 1
//                            color: control.pressed ? "#FF4E4E4E" : "#FF7C7C7C"
//                        }
//                    }
//                    border.width: control.activeFocus ? 2 : 1
//                    border.color: "#888888"
//                    implicitHeight: 25
//                }
//            }
//            anchors.top: buttonCoef.bottom
//            anchors.rightMargin: 10
//            anchors.right: parent.right
//            anchors.topMargin: 40
//        }

//        Button {
//            id: buttonBackGround
//            x: 1070
//            y: -3
//            width: 200
//            height: 80
//            text: qsTr("BackGround")
//            style: ButtonStyle {
//                background: Rectangle {
//                    radius: 4
//                    implicitWidth: 100
//                    gradient: Gradient {
//                        GradientStop {
//                            position: 0
//                            color: control.pressed ? "#FF7C7C7C" : "#FF4E4E4E"
//                        }

//                        GradientStop {
//                            position: 1
//                            color: control.pressed ? "#FF4E4E4E" : "#FF7C7C7C"
//                        }
//                    }
//                    border.width: control.activeFocus ? 2 : 1
//                    border.color: "#888888"
//                    implicitHeight: 25
//                }
//            }
//            anchors.top: buttonTrueCourse.bottom
//            anchors.rightMargin: 10
//            anchors.right: parent.right
//            anchors.topMargin: 40
//        }
        Rectangle
        {
            id: menuButton
            width: 200
            height: 100
            radius: 7
            anchors.top: parent.top
            anchors.topMargin: 80
            anchors.right: parent.right
            anchors.rightMargin: 8
            visible: true
            Text {
                id: menuText
                anchors.centerIn: parent;
                text: "Настройки"
                font.pixelSize: 15
                color: "#FFFFFF"
            }
            gradient: Gradient { // добавление градиента
                GradientStop {
                    id: bmenugradient0
                    position: 0
                    color: window1.gradientcolor0
                }
                GradientStop {
                    id: bmenugradient1
                    position: 1
                    color: window1.gradientcolor1
                }
            }
            ParallelAnimation {
                id: bmenuEnterAnim
                PropertyAnimation {
                    target: bmenugradient0
                    properties: "color"
                    to: window1.gradientcolor1
                    duration: 300
                }
                PropertyAnimation {
                    target: bmenugradient1
                    properties: "color"
                    to: window1.gradientcolor0
                    duration: 300
                }
            }
            ParallelAnimation {
                id: bmenuExitAnim
                PropertyAnimation {
                    target: bmenugradient0
                    properties: "color"
                    to: window1.gradientcolor0
                    duration: 300
                }
                PropertyAnimation {
                    target: bmenugradient1
                    properties: "color"
                    to: window1.gradientcolor1
                    duration: 300
                }
            }
            MouseArea
            {
                id: menuMouseArea
                anchors.fill: parent
                visible: true
                opacity: 1
                hoverEnabled: true
                onEntered: bmenuEnterAnim.start()
                onExited: bmenuExitAnim.start()
                onClicked: compass.changeSettings()
            }

        }
        Rectangle
        {
            id: colorButton
            width: menuButton.width
            height: menuButton.height
            anchors.top: tmcButton.bottom
            anchors.topMargin: 25
            visible: true
            radius: 7
            anchors.right: parent.right
            anchors.rightMargin: 8
            Text {
                id: colotText
                anchors.centerIn: parent;
                text: "Изменить фон"
                font.pixelSize: 15
                color: "#FFFFFF"
            }
            gradient: Gradient { // добавление градиента
                GradientStop {
                    id: bcolorgradient0
                    position: 0
                    color: window1.gradientcolor0
                }
                GradientStop {
                    id: bcolorgradient1
                    position: 1
                    color: window1.gradientcolor1
                }
            }
            ParallelAnimation {
                id: bcolorEnterAnim
                PropertyAnimation {
                    target: bcolorgradient0
                    properties: "color"
                    to: window1.gradientcolor1
                    duration: 300
                }
                PropertyAnimation {
                    target: bcolorgradient1
                    properties: "color"
                    to: window1.gradientcolor0
                    duration: 300
                }
            }
            ParallelAnimation {
                id: bcolorExitAnim
                PropertyAnimation {
                    target: bcolorgradient0
                    properties: "color"
                    to: window1.gradientcolor0
                    duration: 300
                }
                PropertyAnimation {
                    target: bcolorgradient1
                    properties: "color"
                    to: window1.gradientcolor1
                    duration: 300
                }
            }
            MouseArea
            {
                anchors.fill: parent
                id: colorMouseArea
                hoverEnabled: true
                onEntered: bcolorEnterAnim.start()
                onExited: bcolorExitAnim.start()
                onClicked: compass.changeBackground()
            }
        }
        Rectangle
        {
            id: tmcButton
            width: menuButton.width
            height: menuButton.height
            anchors.right: parent.right
            anchors.rightMargin: 8
            anchors.top: menuButton.bottom
            anchors.topMargin: 25
            visible: true
            radius: 7
            Text {
                id: tmcText
                anchors.centerIn: parent
                text: trueMagneticCourse === true ? "Истинный курс":"Магнитный курс"
                font.pixelSize: 15
                color: "#FFFFFF"
            }
            gradient: Gradient { // добавление градиента
                GradientStop {
                    id: tmcgradient0
                    position: 0
                    color: window1.gradientcolor0
                }
                GradientStop {
                    id: tmcgradient1
                    position: 1
                    color: window1.gradientcolor1
                }
            }
            ParallelAnimation {
                id: tmcEnterAnim
                PropertyAnimation {
                    target: tmcgradient0
                    properties: "color"
                    to: window1.gradientcolor1
                    duration: 300
                }
                PropertyAnimation {
                    target: tmcgradient1
                    properties: "color"
                    to: window1.gradientcolor0
                    duration: 300
                }
            }
            ParallelAnimation {
                id: tmcExitAnim
                PropertyAnimation {
                    target: tmcgradient0
                    properties: "color"
                    to: window1.gradientcolor0
                    duration: 300
                }
                PropertyAnimation {
                    target: tmcgradient1
                    properties: "color"
                    to: window1.gradientcolor1
                    duration: 300
                }
            }
            MouseArea
            {
                anchors.fill: parent
                id: tmcMouseArea
                visible: true
                hoverEnabled: true
                onEntered: tmcEnterAnim.start()
                onExited: tmcExitAnim.start()
                onClicked: compass.changeTrueMagneticCourse();
            }
        }
        Rectangle
        {
            id: compButton
            width: menuButton.width
            height: menuButton.height
            visible: true
            anchors.right: parent.right
            anchors.rightMargin: 8
            anchors.top: colorButton.bottom
            anchors.topMargin: 25
            radius: 7
            Text {
                id: compText
                anchors.centerIn: parent
                text: "Kомпенсация"
                font.pixelSize: 15
                color: "#FFFFFF"
            }
            gradient: Gradient { // добавление градиента
                GradientStop {
                    id: compgradient0
                    position: 0
                    color: window1.gradientcolor0
                }
                GradientStop {
                    id: compgradient1
                    position: 1
                    color: window1.gradientcolor1
                }
            }
            ParallelAnimation {
                id: compEnterAnim
                PropertyAnimation {
                    target: compgradient0
                    properties: "color"
                    to: window1.gradientcolor1
                    duration: 300
                }
                PropertyAnimation {
                    target: compgradient1
                    properties: "color"
                    to: window1.gradientcolor0
                    duration: 300
                }
            }
            ParallelAnimation {
                id: compExitAnim
                PropertyAnimation {
                    target: compgradient0
                    properties: "color"
                    to: window1.gradientcolor0
                    duration: 300
                }
                PropertyAnimation {
                    target: compgradient1
                    properties: "color"
                    to: window1.gradientcolor1
                    duration: 300
                }
            }
            MouseArea
            {
                anchors.fill: parent
                id: compMouseArea
                visible: true
                hoverEnabled: true
                onEntered: compEnterAnim.start()
                onExited: compExitAnim.start()
                //При нажатии вызвать функцию
                onClicked: compass.initComp();
            }
        }
        Rectangle
        {
            id: infoButton
            width: menuButton.width
            height: menuButton.height
            visible: true
            anchors.right: parent.right
            anchors.rightMargin: 8
            anchors.top: compButton.bottom
            anchors.topMargin: 25
            radius: 7
            Text {
                id:  infoButtonText
                anchors.centerIn: parent;
                text: "Доп. информация"
                font.pixelSize: 15
                color: "#FFFFFF"
            }
            gradient: Gradient { // добавление градиента
                GradientStop {
                    id: infogradient0
                    position: 0
                    color: window1.gradientcolor0
                }
                GradientStop {
                    id: infogradient1
                    position: 1
                    color: window1.gradientcolor1
                }
            }
            ParallelAnimation {
                id: infoEnterAnim
                PropertyAnimation {
                    target: infogradient0
                    properties: "color"
                    to: window1.gradientcolor1
                    duration: 300
                }
                PropertyAnimation {
                    target: infogradient1
                    properties: "color"
                    to: window1.gradientcolor0
                    duration: 300
                }
            }
            ParallelAnimation {
                id: infoExitAnim
                PropertyAnimation {
                    target: infogradient0
                    properties: "color"
                    to: window1.gradientcolor0
                    duration: 300
                }
                PropertyAnimation {
                    target: infogradient1
                    properties: "color"
                    to: window1.gradientcolor1
                    duration: 300
                }
            }
            MouseArea
            {
                anchors.fill: parent
                id:  pButtonMouseArea
                anchors.rightMargin: 0
                anchors.bottomMargin: -1
                anchors.leftMargin: 0
                anchors.topMargin: 1
                hoverEnabled: true
                onEntered: infoEnterAnim.start()
                onExited: infoExitAnim.start()
                onClicked: compass.changeInfoScreenVisibility()
            }
        }
        Rectangle
        {
            id: sklButton
            width: menuButton.width
            height: menuButton.height
            anchors.top: infoButton.bottom
            anchors.topMargin: 25
            visible: true
            radius: 7
            anchors.right: parent.right
            anchors.rightMargin: 8
            Text {
                id:  sklButtonText
                anchors.centerIn: parent;
                text: "Склонение"
                font.pixelSize: 15
                color: "#FFFFFF"
            }
            gradient: Gradient { // добавление градиента
                GradientStop {
                    id: bsklrgradient0
                    position: 0
                    color: window1.gradientcolor0
                }
                GradientStop {
                    id: bsklrgradient1
                    position: 1
                    color: window1.gradientcolor1
                }
            }
            ParallelAnimation {
                id: bsklEnterAnim
                PropertyAnimation {
                    target: bsklrgradient0
                    properties: "color"
                    to: window1.gradientcolor1
                    duration: 300
                }
                PropertyAnimation {
                    target: bsklrgradient1
                    properties: "color"
                    to: window1.gradientcolor0
                    duration: 300
                }
            }
            ParallelAnimation {
                id: bsklExitAnim
                PropertyAnimation {
                    target: bsklrgradient0
                    properties: "color"
                    to: window1.gradientcolor0
                    duration: 300
                }
                PropertyAnimation {
                    target: bsklrgradient1
                    properties: "color"
                    to: window1.gradientcolor1
                    duration: 300
                }
            }
            MouseArea
            {
                anchors.fill: parent
                id:  sklButtonMouseArea
                hoverEnabled: true
                onEntered: bsklEnterAnim.start()
                onExited: bsklExitAnim.start()
                //При нажатии вызвать функцию
                onClicked: compass.changeSkl()
            }
        }
        Rectangle
        {
            id: pitch
            visible: infoVisibility
            width: 114
            height: 44
            border.width: 2
            border.color: "#0500ff"
            color: "black"
            anchors.top: parent.top
            anchors.topMargin: 80
            anchors.left: parent.left
            anchors.leftMargin: 18
            Text
            {
                id: pitchText
                x: 0
                y: -30
                text: "Дифферент"
                font.pixelSize: 22
                font.family: a_LCDNovaObl.name
                color: "white";
            }
            Text
            {
                id: pitchArg
                anchors.centerIn: parent
                text: m_pitch
                font.pixelSize: 22
                font.family: a_LCDNovaObl.name
                style: Text.Outline
                styleColor: "white"
                color: "white";
            }
        }
        Rectangle
        {
            id: roll
            visible: infoVisibility
            width: 114
            height: 44
            border.width: 2
            border.color: "#0500ff"
            color: "black"
            anchors.top: pitch.bottom
            anchors.topMargin: 50
            anchors.left: parent.left
            anchors.leftMargin: 18
            Text
            {
                id: rollText
                x: 0
                y: -29
                text: "Крен"
                font.pixelSize: 22
                font.family: a_LCDNovaObl.name
                color: "white";
            }
            Text
            {
                id: rollArg
                anchors.centerIn: parent
                text: m_roll
                font.pixelSize: 22
                font.family: a_LCDNovaObl.name
                style: Text.Outline
                styleColor: "white"
                color: "white";
            }
        }
    }
}


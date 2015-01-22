import QtQuick 2.2
import QtQuick.Window 2.1
//import QtQuick.Controls 1.1
//import QtQuick.Controls.Styles 1.1

Window {
    id: window1
    width: 1440
    height: 980
    title: qsTr("Compass")

    visible: true

    Rectangle
    {
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
            source: "content/steel3.png"

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
    }
}

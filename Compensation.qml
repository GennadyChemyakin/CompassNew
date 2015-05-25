import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Rectangle {
    id: comprect
    //width: settings.width-buttonWidth - button1.anchors.leftMargin * 2
    //height: window1.height
    width: 1440
    height: 980
    color: "#00000000"
    Image {


        id: compensationBackground
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        //source: "content/steel4.png"
        anchors.fill: parent

        ProgressBar {
            Connections {
                    target: compass
                    onBinsChanged: progressBar1.value = compass.getBins(0)
            }
            id: progressBar1
            x: 64
            width: 400
            height: 70

            anchors.top: parent.top
            anchors.topMargin: 155
            value: compass.getBins(0)
            maximumValue: 16.0
        }

        ProgressBar {
            Connections {
                    target: compass
                    onBinsChanged: progressBar2.value = compass.getBins(1)
            }
            id: progressBar2
            x: 64
            width: 400
            height: 70
            anchors.top: progressBar1.bottom
            anchors.topMargin: 19
            value: compass.getBins(1)
            maximumValue: 16.0
        }

        ProgressBar {
            Connections {
                    target: compass
                    onBinsChanged: progressBar3.value = compass.getBins(2)
            }
            id: progressBar3
            x: 64
            width: 400
            height: 70
            anchors.top: progressBar2.bottom
            anchors.topMargin: 19
            value: compass.getBins(2)
            maximumValue: 16.0
        }

        ProgressBar {
            Connections {
                    target: compass
                    onBinsChanged: progressBar4.value = compass.getBins(3)
            }
            id: progressBar4
            x: 64
            width: 400
            height: 70
            anchors.top: progressBar3.bottom
            anchors.topMargin: 19
            value: compass.getBins(3)
            maximumValue: 16.0
        }

        ProgressBar {
            Connections {
                    target: compass
                    onBinsChanged: progressBar5.value = compass.getBins(4)
            }
            id: progressBar5
            x: 64
            width: 400
            height: 70
            anchors.top: progressBar4.bottom
            anchors.topMargin: 19
            value: compass.getBins(4)
            maximumValue: 16.0
        }

        ProgressBar {
            Connections {
                    target: compass
                    onBinsChanged: progressBar6.value = compass.getBins(5)
            }
            id: progressBar6
            x: 64
            width: 400
            height: 70
            anchors.top: progressBar5.bottom
            anchors.topMargin: 19
            value: compass.getBins(5)
            maximumValue: 16.0
        }

        ProgressBar {
            Connections {
                    target: compass
                    onBinsChanged: progressBar7.value = compass.getBins(6)
            }
            id: progressBar7
            x: 64
            width: 400
            height: 70
            anchors.top: progressBar6.bottom
            anchors.topMargin: 19
            value: compass.getBins(6)
            maximumValue: 16.0
        }
        ProgressBar {
            Connections {
                    target: compass
                    onBinsChanged: progressBar8.value = compass.getBins(7)
            }
            id: progressBar8
            x: 64
            width: 400
            height: 70
            anchors.top: progressBar7.bottom
            anchors.topMargin: 19
            value: compass.getBins(7)
            maximumValue: 16.0
        }

        Button {
            id: button1
            x: 560
            width: 400
            height: 130
            text: qsTr("Начать компенсацию")
            anchors.top: parent.top
            anchors.topMargin: 155
            style: ButtonStyle {
                    label: Text {
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.pointSize: 20
                        font.bold: true
                        color: "black"
                        text: control.text
                      }
            }
            onClicked: compass.initComp();
        }

        Button {
            id: button2
            x: 560
            width: 400
            height: 130
            text: qsTr("Остановить компенсацию")
            anchors.top: button1.bottom
            anchors.topMargin: 19
            style: ButtonStyle {
                    label: Text {
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.pointSize: 17
                        font.bold: true
                        color: "black"
                        text: control.text
                      }
            }
            onClicked: compass.stopComp();
        }

        Button {
            id: button3
            x: 560
            width: 400
            height: 130
            text: qsTr("Сбросить датчик")
            anchors.top: button2.bottom
            anchors.topMargin: 19
            style: ButtonStyle {
                    label: Text {
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.bold: true
                        font.pointSize: 20
                        color: "black"
                        text: control.text
                      }
            }
            onClicked: compass.revert()
        }

        Text {
            id: text1
            x: 336
            y: 166
            width: 60
            height: 50
            color: "#1d00b6"
            text: qsTr("N")
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: progressBar1.horizontalCenter
            anchors.verticalCenter: progressBar1.verticalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 27
        }

        Text {
            id: text2
            x: 336
            y: 246
            width: 60
            height: 50
            color: "#1d00b8"
            text: qsTr("NE")
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: progressBar2.horizontalCenter
            anchors.verticalCenter: progressBar2.verticalCenter
            font.pixelSize: 27
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Text {
            id: text3
            x: 336
            y: 326
            width: 60
            height: 50
            color: "#1d00b8"
            text: qsTr("E")
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: progressBar3.horizontalCenter
            anchors.verticalCenter: progressBar3.verticalCenter
            font.pixelSize: 27
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Text {
            id: text4
            x: 336
            y: 406
            width: 60
            height: 50
            color: "#1d00b8"
            text: qsTr("SE")
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: progressBar4.horizontalCenter
            anchors.verticalCenter: progressBar4.verticalCenter
            font.pixelSize: 27
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Text {
            id: text5
            x: 336
            y: 486
            width: 60
            height: 50
            color: "#1d00b8"
            text: qsTr("S")
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: progressBar5.horizontalCenter
            anchors.verticalCenter: progressBar5.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 27
            verticalAlignment: Text.AlignVCenter
        }

        Text {
            id: text6
            x: 336
            y: 566
            width: 60
            height: 50
            color: "#1d00b8"
            text: qsTr("SW")
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: progressBar6.horizontalCenter
            anchors.verticalCenter: progressBar6.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 27
            verticalAlignment: Text.AlignVCenter
        }

        Text {
            id: text7
            x: 336
            y: 646
            width: 60
            height: 50
            color: "#1d00b8"
            text: qsTr("W")
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: progressBar7.horizontalCenter
            anchors.verticalCenter: progressBar7.verticalCenter
            font.pixelSize: 27
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Text {
            id: text8
            x: 336
            y: 726
            width: 60
            height: 50
            color: "#1d00b8"
            text: qsTr("NW")
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: progressBar8.horizontalCenter
            anchors.verticalCenter: progressBar8.verticalCenter
            z: 1
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 27
            verticalAlignment: Text.AlignVCenter
        }

        TextField
        {
            id:compensationStatus
            width: 400
            height: 130
            x: 560
            y: 666
            text: m_complable
            font.pointSize: 24
            anchors.top: button3.bottom
            anchors.topMargin: 19
    }


    }
}

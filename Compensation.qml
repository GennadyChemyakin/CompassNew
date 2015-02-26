import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Rectangle {
    id: comprect
    width: settings.width-buttonWidth - button1.anchors.leftMargin * 2
    height: window1.height
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
                    onBinsChanged: progressBar1.value = compass.getBins(0)*16/100
            }
            id: progressBar1
            x: 166
            width: 400
            height: 50
            anchors.top: parent.top
            anchors.topMargin: 166
            value: compass.getBins(0)*16/100
        }

        ProgressBar {
            Connections {
                    target: compass
                    onBinsChanged: progressBar1.value = compass.getBins(1)*16/100
            }
            id: progressBar2
            x: 166
            width: 400
            height: 50
            anchors.top: progressBar1.bottom
            anchors.topMargin: 30
            value: compass.getBins(1)*16/100
        }

        ProgressBar {
            Connections {
                    target: compass
                    onBinsChanged: progressBar1.value = compass.getBins(2)*16/100
            }
            id: progressBar3
            x: 166
            width: 400
            height: 50
            anchors.top: progressBar2.bottom
            anchors.topMargin: 30
            value: compass.getBins(2)*16/100
        }

        ProgressBar {
            Connections {
                    target: compass
                    onBinsChanged: progressBar1.value = compass.getBins(3)*16/100
            }
            id: progressBar4
            x: 166
            width: 400
            height: 50
            anchors.top: progressBar3.bottom
            anchors.topMargin: 30
            value: ompass.getBins(3)*16/100
        }

        ProgressBar {
            Connections {
                    target: compass
                    onBinsChanged: progressBar1.value = compass.getBins(4)*16/100
            }
            id: progressBar5
            x: 166
            width: 400
            height: 50
            anchors.top: progressBar4.bottom
            anchors.topMargin: 30
            value: compass.getBins(4)*16/100
        }

        ProgressBar {
            Connections {
                    target: compass
                    onBinsChanged: progressBar1.value = compass.getBins(5)*16/100
            }
            id: progressBar6
            x: 166
            width: 400
            height: 50
            anchors.top: progressBar5.bottom
            anchors.topMargin: 30
            value: compass.getBins(5)*16/100
        }

        ProgressBar {
            Connections {
                    target: compass
                    onBinsChanged: progressBar1.value = compass.getBins(6)*16/100
            }
            id: progressBar7
            x: 166
            width: 400
            height: 50
            anchors.top: progressBar6.bottom
            anchors.topMargin: 30
            value: compass.getBins(6)*16/100
        }

        Button {
            id: button1
            x: 662
            width: 308
            height: 84
            text: qsTr("Начать компенсацию")
            anchors.top: parent.top
            anchors.topMargin: 166
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
            onClicked: compass.initComp();
        }

        Button {
            id: button2
            x: 662
            width: 308
            height: 84
            text: qsTr("Остановить компенсацию")
            anchors.top: button1.bottom
            anchors.topMargin: 30
            style: ButtonStyle {
                    label: Text {
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.pointSize: 14
                        font.bold: true
                        color: "black"
                        text: control.text
                      }
            }
            onClicked: compass.stopComp();
        }

        Button {
            id: button3
            x: 662
            width: 308
            height: 84
            text: qsTr("Сбросить датчик")
            anchors.top: button2.bottom
            anchors.topMargin: 30
            style: ButtonStyle {
                    label: Text {
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.bold: true
                        font.pointSize: 17
                        color: "black"
                        text: control.text
                      }
            }
        }

        Text {
            id: text1
            x: 336
            y: 166
            width: 60
            height: 50
            color: "#1d00b6"
            text: qsTr("N")
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
            z: 1
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 27
            verticalAlignment: Text.AlignVCenter
        }

        ProgressBar {
            id: progressBar8
            x: 166
            width: 400
            height: 50
            anchors.top: progressBar7.bottom
            anchors.topMargin: 30
            value: bin7Value/100
        }
    }
}

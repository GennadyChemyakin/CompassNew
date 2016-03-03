import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Rectangle {
    id: comprect
    width: settings.width-buttonWidth - button1.anchors.leftMargin * 2
    height: window1.height
    property real progressBarWidth: window1.width / 3.5
    property int progressBarHeight: window1.height / 14
    property int progressBarMargin: progressBarHeight / 2
    property int buttonWidthComrect: window1.width / 4
    property real buttonHeightComrect: window1.height / 7.5
    property var textFontSize:buttonHeightComrect / 3
    property int textWidth: window1.width / 24
    property real textHeight: window1.height / 19.6

    property color compensationStatusBackgroundcolor: "white"
    color: "#00000000"


    function changeColor()
    {
        compensationStatusBackgroundcolor = Qt.binding(function(){console.log("here");
        if(m_complable === "Успех")
            return "#42e73a";
        else if(m_complable === "Время вышло" || m_complable === "Провал" || m_complable === "Flash Write Fail")
            return "red";
        else if(m_complable === "Новые параметры не лучше")
            return "blue";
        else return "white";
        })
    }


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
                    onBinsChanged: progressBar1.value = compass.getBins(7)
            }
            id: progressBar1
            x: (comprect.width - progressBarWidth - button1.width - 2 * progressBarMargin) / 2
            y: (comprect.height - 8 * progressBarHeight - 8 * progressBarMargin)/2
            width: progressBarWidth
            height: progressBarHeight
            value: compass.getBins(0)
            maximumValue: 16.0
        }

        ProgressBar {
            Connections {
                    target: compass
                    onBinsChanged: progressBar2.value = compass.getBins(6)
            }
            id: progressBar2
            width: progressBarWidth
            height: progressBarHeight
            anchors.top: progressBar1.bottom
            anchors.topMargin: progressBarMargin
            anchors.left: progressBar1.left
            anchors.leftMargin: 0
            value: compass.getBins(1)
            maximumValue: 16.0
        }

        ProgressBar {
            Connections {
                    target: compass
                    onBinsChanged: progressBar3.value = compass.getBins(5)
            }
            id: progressBar3
            anchors.left: progressBar1.left
            anchors.leftMargin: 0
            width: progressBarWidth
            height: progressBarHeight
            anchors.top: progressBar2.bottom
            anchors.topMargin: progressBarMargin
            value: compass.getBins(2)
            maximumValue: 16.0
        }

        ProgressBar {
            Connections {
                    target: compass
                    onBinsChanged: progressBar4.value = compass.getBins(4)
            }
            id: progressBar4
            anchors.left: progressBar1.left
            anchors.leftMargin: 0
            width: progressBarWidth
            height: progressBarHeight
            anchors.top: progressBar3.bottom
            anchors.topMargin: progressBarMargin
            value: compass.getBins(3)
            maximumValue: 16.0
        }

        ProgressBar {
            Connections {
                    target: compass
                    onBinsChanged: progressBar5.value = compass.getBins(3)
            }
            id: progressBar5
            anchors.left: progressBar1.left
            anchors.leftMargin: 0
            width: progressBarWidth
            height: progressBarHeight
            anchors.top: progressBar4.bottom
            anchors.topMargin: progressBarMargin
            value: compass.getBins(4)
            maximumValue: 16.0
        }

        ProgressBar {
            Connections {
                    target: compass
                    onBinsChanged: progressBar6.value = compass.getBins(2)
            }
            id: progressBar6
            anchors.left: progressBar1.left
            anchors.leftMargin: 0
            width: progressBarWidth
            height: progressBarHeight
            anchors.top: progressBar5.bottom
            anchors.topMargin: progressBarMargin
            value: compass.getBins(5)
            maximumValue: 16.0
        }

        ProgressBar {
            Connections {
                    target: compass
                    onBinsChanged: progressBar7.value = compass.getBins(1)
            }
            id: progressBar7
            anchors.left: progressBar1.left
            anchors.leftMargin: 0
            width: progressBarWidth
            height: progressBarHeight
            anchors.top: progressBar6.bottom
            anchors.topMargin: progressBarMargin
            value: compass.getBins(6)
            maximumValue: 16.0
        }
        ProgressBar {
            Connections {
                    target: compass
                    onBinsChanged: progressBar8.value = compass.getBins(0)
            }
            id: progressBar8
            anchors.left: progressBar1.left
            anchors.leftMargin: 0
            width: progressBarWidth
            height: progressBarHeight
            anchors.top: progressBar7.bottom
            anchors.topMargin: progressBarMargin
            value: compass.getBins(7)
            maximumValue: 16.0
        }

        Button {
            id: button1
            x: window1.height/1.75
            width: buttonWidthComrect
            height: buttonHeightComrect
            text: qsTr("Начать калибровку")
            anchors.top: progressBar1.top
            anchors.topMargin: 0
            anchors.left: progressBar1.right
            anchors.leftMargin: 2 * progressBarMargin
            style: ButtonStyle {
                    label: Text {
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.pointSize: height / 7
                        font.bold: true
                        color: "black"
                        text: control.text
                      }
            }
            onClicked: compass.initComp();
        }

        Button {
            id: button2
            x: button1.x
            width: buttonWidthComrect
            height: buttonHeightComrect
            text: qsTr("Остановить калибровку")
            anchors.top: button1.bottom
            anchors.topMargin: progressBarMargin
            style: ButtonStyle {
                    label: Text {
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.pointSize: height / 7
                        font.bold: true
                        color: "black"
                        text: control.text
                      }
            }
            onClicked: compass.stopComp();
        }

        Button {
            id: button3
            x: button1.x
            width: buttonWidthComrect
            height: buttonHeightComrect
            text: qsTr("Сбросить датчик")
            anchors.top: button2.bottom
            anchors.topMargin: progressBarMargin
            style: ButtonStyle {
                    label: Text {
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.bold: true
                        font.pointSize: height / 7
                        color: "black"
                        text: control.text
                      }
            }
            onClicked: passDialShow.start()
                //compass.revert()
        }

        Text {
            id: text1
            width: textWidth
            height: textHeight
            color: "#1d00b6"
            text: qsTr("N")
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: progressBar1.horizontalCenter
            anchors.verticalCenter: progressBar1.verticalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: textFontSize
        }

        Text {
            id: text2
            width: textWidth
            height: textHeight
            color: "#1d00b8"
            text: qsTr("NE")
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: progressBar2.horizontalCenter
            anchors.verticalCenter: progressBar2.verticalCenter
            font.pixelSize: textFontSize
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Text {
            id: text3
            width: textWidth
            height: textHeight
            color: "#1d00b8"
            text: qsTr("E")
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: progressBar3.horizontalCenter
            anchors.verticalCenter: progressBar3.verticalCenter
            font.pixelSize: textFontSize
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Text {
            id: text4
            width: textWidth
            height: textHeight
            color: "#1d00b8"
            text: qsTr("SE")
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: progressBar4.horizontalCenter
            anchors.verticalCenter: progressBar4.verticalCenter
            font.pixelSize: textFontSize
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Text {
            id: text5
            width: textWidth
            height: textHeight
            color: "#1d00b8"
            text: qsTr("S")
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: progressBar5.horizontalCenter
            anchors.verticalCenter: progressBar5.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: textFontSize
            verticalAlignment: Text.AlignVCenter
        }

        Text {
            id: text6
            width: textWidth
            height: textHeight
            color: "#1d00b8"
            text: qsTr("SW")
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: progressBar6.horizontalCenter
            anchors.verticalCenter: progressBar6.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: textFontSize
            verticalAlignment: Text.AlignVCenter
        }

        Text {
            id: text7
            width: textWidth
            height: textHeight
            color: "#1d00b8"
            text: qsTr("W")
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: progressBar7.horizontalCenter
            anchors.verticalCenter: progressBar7.verticalCenter
            font.pixelSize: textFontSize
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Text {
            id: text8
            width: textWidth
            height: textHeight
            color: "#1d00b8"
            text: qsTr("NW")
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: progressBar8.horizontalCenter
            anchors.verticalCenter: progressBar8.verticalCenter
            z: 1
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: textFontSize
            verticalAlignment: Text.AlignVCenter
        }

        TextField
        {
            id:compensationStatus
            font.pixelSize: textFontSize / 2
            width: buttonWidthComrect
            Component.onCompleted: changeColor()
            height: buttonHeightComrect
            x: button1.x
            anchors.top: button3.bottom
            anchors.topMargin: progressBarMargin
            text: m_complable
            style:
                TextFieldStyle{
                background: Rectangle{
                    id: compensationStatusBackground
                    color: compensationStatusBackgroundcolor
                }

            }
        }

    }
}

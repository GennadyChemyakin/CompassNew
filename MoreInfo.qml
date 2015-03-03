import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Rectangle {
    id: moreInfoRect
//    width: settings.width-buttonWidth - button1.anchors.leftMargin * 2
//    height: window1.height
    width: 1440
    height: 980
    color: "#00000000"
    visible: true
    FontLoader { id: a_LCDNovaObl; source: "content/a_LCDNovaObl.ttf" }
    //--------roll and pitch
    //-----roll
    Rectangle
    {
        id: lcdRollRect
        y: 72
        z: 3
        width: 360
        height: 170
        border.width: 3
        border.color: "white"
        color: "#000000"
        anchors.left: textRoll.right
        anchors.leftMargin: 0
        anchors.horizontalCenterOffset: 0
        anchors.verticalCenterOffset: 0
        //FontLoader { id: a_LCDNovaOblRoll; source: "content/a_LCDNovaObl.ttf" }
        Text
        {
            id: lcdRoll
            anchors.centerIn: parent
            text: m_roll
            font.pixelSize: 150
            font.family: a_LCDNovaObl.name
            style: Text.Outline
            styleColor: "white"
            color: "white"
        }
    }

    Text {
        id: textRoll
        width: 474
        height: 170
        text: qsTr("Крен")
        anchors.top: parent.top
        anchors.topMargin: 70
        anchors.left: parent.left
        anchors.leftMargin: 40
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 79
        color: "white"
        font.family: a_LCDNovaObl.name
    }

    //-----pitch
    Rectangle
    {
        id: lcdPitchRect
        y: 290
        z: 3
        width: 360
        height: 170
        border.width: 3
        border.color: "white"
        color: "#000000"
        anchors.left: textPitch.right
        anchors.leftMargin: 0

        Text
        {
            id: lcdPitch
            anchors.centerIn: parent
            text: m_pitch
            font.pixelSize: 150
            font.family: a_LCDNovaObl.name
            style: Text.Outline
            styleColor: "white"
            color: "white"
        }
    }

    Text {
        id: textPitch
        width: 474
        height: 170
        text: qsTr("Дифферент")
        anchors.top: textRoll.bottom
        anchors.topMargin: 50
        anchors.left: parent.left
        anchors.leftMargin: 40
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 79
        color: "white"
        font.family: a_LCDNovaObl.name
    }
    //-------------B C Z coef
    //-----B coef
    Rectangle
    {
        id: lcdCoefBRect
        y: 640
        z: 3
        width: 170
        height: 120
        border.width: 3
        border.color: "white"
        color: "#000000"
        anchors.left: textB.right
        anchors.leftMargin: 0
        anchors.horizontalCenterOffset: 0
        anchors.verticalCenterOffset: 0
        //FontLoader { id: a_LCDNovaOblRoll; source: "content/a_LCDNovaObl.ttf" }
        Text
        {
            id: lcdB
            anchors.centerIn: parent
            text: ""//m_coefB
            font.pixelSize: 150
            font.family: a_LCDNovaObl.name
            style: Text.Outline
            styleColor: "white"
            color: "white"
        }
    }

    Text {
        id: textB
        y: 640
        width: 120
        height: 120
        text: qsTr("B")
        anchors.left: parent.left
        anchors.leftMargin: 40
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 79
        color: "white"
        font.family: a_LCDNovaObl.name
    }
    //--------C coef
    //-----B coef

    Rectangle
    {
        id: lcdCoefCRect
        y: 640
        z: 3
        width: 170
        height: 120
        border.width: 3
        border.color: "white"
        color: "#000000"
        anchors.left: textC.right
        anchors.leftMargin: 0
        anchors.horizontalCenterOffset: 0
        anchors.verticalCenterOffset: 0
        //FontLoader { id: a_LCDNovaOblRoll; source: "content/a_LCDNovaObl.ttf" }
        Text
        {
            id: lcdC
            anchors.centerIn: parent
            text: ""//m_coefC
            font.pixelSize: 150
            font.family: a_LCDNovaObl.name
            style: Text.Outline
            styleColor: "white"
            color: "white"
        }
    }

    Text {
        id: textC
        y: 640
        width: 120
        height: 120
        text: qsTr("C")
        anchors.left: lcdCoefBRect.right
        anchors.leftMargin: 0
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 79
        color: "white"
        font.family: a_LCDNovaObl.name
    }
    //----Z coef
    Rectangle
    {
        id: lcdCoefZRect
        y: 640
        z: 3
        width: 170
        height: 120
        border.width: 3
        border.color: "white"
        color: "#000000"
        anchors.left: textZ.right
        anchors.leftMargin: 0
        anchors.horizontalCenterOffset: 0
        anchors.verticalCenterOffset: 0
        //FontLoader { id: a_LCDNovaOblRoll; source: "content/a_LCDNovaObl.ttf" }
        Text
        {
            id: lcdZ
            anchors.centerIn: parent
            text: ""//m_coefZ
            font.pixelSize: 150
            font.family: a_LCDNovaObl.name
            style: Text.Outline
            styleColor: "white"
            color: "white"
        }
    }

    Text {
        id: textZ
        y: 640
        width: 120
        height: 120
        text: qsTr("Z")
        anchors.left: lcdCoefCRect.right
        anchors.leftMargin: 0
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 79
        color: "white"
        font.family: a_LCDNovaObl.name
    }
}

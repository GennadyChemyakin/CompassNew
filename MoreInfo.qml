import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Rectangle {
    id: moreInfoRect
    width: settings.width-buttonWidth - button1.anchors.leftMargin * 2
    height: window1.height
    color: "#00000000"
    FontLoader { id: a_LCDNovaObl; source: "content/a_LCDNovaObl.ttf" }
    //--------roll and pitch
    //-----roll
    Rectangle
    {
        id: lcdRollRect
        z: 3
        width: 360
        height: 170
        border.width: 3
        border.color: "white"
        color: "#000000"
        anchors.top: textRoll.bottom
        anchors.topMargin: -150
        anchors.left: textRoll.right
        anchors.leftMargin: 0
        anchors.horizontalCenter: backgrnCompass.horizontalCenter
        anchors.verticalCenter: backgrnCompass.verticalCenter
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
        x: 122
        y: 56
        width: 474
        height: 130
        text: qsTr("Крен")
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
        z: 3
        width: 360
        height: 170
        border.width: 3
        border.color: "white"
        color: "#000000"
        anchors.left: textPitch.right
        anchors.leftMargin: 0
        anchors.top: lcdRollRect.bottom
        anchors.topMargin: 46

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
        x: 122
        width: 474
        height: 126
        text: qsTr("Дифферент")
        anchors.top: textRoll.bottom
        anchors.topMargin: 88
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
        x: 237
        y: 640
        z: 3
        width: 260
        height: 120
        border.width: 3
        border.color: "white"
        color: "#000000"
        anchors.horizontalCenter: backgrnCompass.horizontalCenter
        anchors.verticalCenter: backgrnCompass.verticalCenter
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
        x: 89
        y: 640
        width: 150
        height: 120
        text: qsTr("B")
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
        x: 646
        y: 640
        z: 3
        width: 260
        height: 120
        border.width: 3
        border.color: "white"
        color: "#000000"
        anchors.horizontalCenter: backgrnCompass.horizontalCenter
        anchors.verticalCenter: backgrnCompass.verticalCenter
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
        x: 496
        y: 640
        width: 150
        height: 120
        text: qsTr("C")
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
        x: 1057
        y: 640
        z: 3
        width: 260
        height: 120
        border.width: 3
        border.color: "white"
        color: "#000000"
        anchors.horizontalCenter: backgrnCompass.horizontalCenter
        anchors.verticalCenter: backgrnCompass.verticalCenter
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
        x: 906
        y: 640
        width: 150
        height: 120
        text: qsTr("Z")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 79
        color: "white"
        font.family: a_LCDNovaObl.name
    }
}

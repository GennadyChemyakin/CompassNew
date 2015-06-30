import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Rectangle {
    id: moreInfoRect
    width: settings.width-buttonWidth - button1.anchors.leftMargin * 2
    height: window1.height
    //width: 1440
    //height: 980
    color: "#00000000"
    visible: true
    FontLoader { id: a_LCDNovaObl; source: "content/a_LCDNovaObl.ttf" }

    property real lcdWidth: window1.width/8
    property real lcdHeight: window1.height/12
    property real textWidth: window1.width/2
    property real textHeight: window1.height/6
    property int lcdFontSize:lcdHeight / 2.0
    property int buttonWidth: lcdWidth * 2
    property int buttonHeight: lcdHeight

    //--------roll and pitch
    //-----roll
    Label{
        id:textRoll
        text: qsTr("Крен")
        x: (moreInfoRect.width - 3 * lcdWidth - 3 * textB.width - 5 * lcdHeight / 2 ) / 2
        y: (moreInfoRect.height - 6 * lcdHeight  - buttonHeight) / 2
        font.pixelSize: textHeight / 2
        color: "white"
        font.family: a_LCDNovaObl.name
    }
    Rectangle
    {
        id: lcdRollRect
        z: 3
        width: lcdWidth
        height: lcdHeight
        border.width: 3
        border.color: "white"
        color: "#000000"
        anchors.left: lcdPitchRect.left
        anchors.leftMargin: 0
        anchors.top: textRoll.top
        anchors.topMargin: 0
        Text
        {
            id: lcdRoll
            anchors.centerIn: parent
            text: m_roll
            font.pixelSize: lcdFontSize
            font.family: a_LCDNovaObl.name
            style: Text.Outline
            styleColor: "white"
            color: "white"
        }
    }


    //-----pitch
    Label{
        id:textPitch
        text: qsTr("Дифферент")
        anchors.top: textRoll.bottom
        anchors.topMargin: lcdHeight
        anchors.left: textRoll.left
        anchors.leftMargin: 0
        font.pixelSize: textHeight / 2
        color: "white"
        font.family: a_LCDNovaObl.name
    }
    Rectangle
    {
        id: lcdPitchRect
        y: window1.height/3.379310345
        z: 3
        width: lcdWidth
        height: lcdHeight
        border.width: 3
        border.color: "white"
        color: "#000000"
        anchors.top: textPitch.top
        anchors.topMargin: 0
        anchors.left: lcdCoefZRect.left
        anchors.leftMargin: 0
        Text
        {
            id: lcdPitch
            anchors.centerIn: parent
            text: m_pitch
            font.pixelSize: lcdFontSize
            font.family: a_LCDNovaObl.name
            style: Text.Outline
            styleColor: "white"
            color: "white"
        }
    }
    //-------------B C Z coef
    //-----B coef

    Label{
        id: textB
        anchors.top: textPitch.bottom
        anchors.topMargin: lcdHeight
        anchors.left: textPitch.left
        anchors.leftMargin: 0
        text: qsTr("X")
        font.pixelSize: textHeight / 2
        color: "white"
        font.family: a_LCDNovaObl.name
    }
    Rectangle
    {
        id: lcdCoefBRect
        y: window1.width/2.25
        z: 3
        width: lcdWidth
        height: lcdHeight
        border.width: 3
        border.color: "white"
        color: "#000000"
        anchors.top: textB.top
        anchors.topMargin: 0
        anchors.left: textB.right
        anchors.leftMargin: lcdHeight / 2
        Text
        {
            id: lcdB
            anchors.centerIn: parent
            text: coef_B
            font.pixelSize: lcdFontSize
            font.family: a_LCDNovaObl.name
            style: Text.Outline
            styleColor: "white"
            color: "white"
        }
    }
    //--------C coef

    Label{
        id: textC
        text: qsTr("Y")
        anchors.left: lcdCoefBRect.right
        anchors.leftMargin: lcdHeight / 2
        anchors.top: lcdCoefBRect.top
        anchors.topMargin: 0
        font.pixelSize: textHeight / 2
        color: "white"
        font.family: a_LCDNovaObl.name
    }
    Rectangle
    {
        id: lcdCoefCRect
        z: 3
        width: lcdWidth
        height: lcdHeight
        border.width: 3
        border.color: "white"
        color: "#000000"
        anchors.left: textC.right
        anchors.leftMargin: lcdHeight / 2
        anchors.top: textC.top
        anchors.topMargin: 0
        Text
        {
            id: lcdC
            anchors.centerIn: parent
            text: coef_C
            font.pixelSize: lcdFontSize
            font.family: a_LCDNovaObl.name
            style: Text.Outline
            styleColor: "white"
            color: "white"
        }
    }

    //----Z coef
    Label{
        id: textZ
        text: qsTr("Z")
        anchors.left: lcdCoefCRect.right
        anchors.leftMargin: lcdHeight / 2
        anchors.top: lcdCoefCRect.top
        anchors.topMargin: 0
        font.pixelSize: textHeight / 2
        color: "white"
        font.family: a_LCDNovaObl.name
    }
    Rectangle
    {

        id: lcdCoefZRect
        y: window1.width/2.25
        z: 3
        width: lcdWidth
        height: lcdHeight
        border.width: 3
        border.color: "white"
        color: "#000000"
        anchors.left: textZ.right
        anchors.leftMargin: lcdHeight / 2
        anchors.top: textZ.top
        anchors.topMargin: 0
        Text
        {
            id: lcdZ
            anchors.centerIn: parent
            text: coef_Z
            font.pixelSize: lcdFontSize
            font.family: a_LCDNovaObl.name
            style: Text.Outline
            styleColor: "white"
            color: "white"
        }
    }

    Button {
        id: button1
        width: buttonWidth
        height: buttonHeight
        text: logMsg
        anchors.top: lcdCoefBRect.bottom
        anchors.topMargin: lcdHeight
        anchors.left: textB.left
        anchors.leftMargin: 0
        style: ButtonStyle {
            label: Text {
                    renderType: Text.NativeRendering
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Helvetica"
                    font.pointSize: height / 2.5
                    color: "black"
                    text: control.text
                }
              }
        onClicked: compass.startWriteLog();
    }
}

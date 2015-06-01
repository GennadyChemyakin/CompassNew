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
    //--------roll and pitch
    //-----roll
    Rectangle
    {
        id: lcdRollRect
        y: window1.height/13.611111111
        z: 3
        width: window1.width/4
        height: window1.height/5.764705882
        border.width: 3
        border.color: "white"
        color: "#000000"
        anchors.left: lcdPitchRect.left
        anchors.leftMargin: 0
        anchors.horizontalCenterOffset: 0
        anchors.verticalCenterOffset: 0
        //FontLoader { id: a_LCDNovaOblRoll; source: "content/a_LCDNovaObl.ttf" }
        Text
        {
            id: lcdRoll
            anchors.centerIn: parent
            text: m_roll
            font.pixelSize: window1.height/6.533333333
            font.family: a_LCDNovaObl.name
            style: Text.Outline
            styleColor: "white"
            color: "white"
        }
    }

    Text {
        id: textRoll
        width: window1.width/3.037974684
        height: window1.height/5.764705882
        text: qsTr("Крен")
        anchors.top: parent.top
        anchors.topMargin: window1.height/14
        anchors.left: parent.left
        anchors.leftMargin: window1.height/24.5
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: window1.height/12.405063291
        color: "white"
        font.family: a_LCDNovaObl.name
    }

    //-----pitch
    Rectangle
    {
        id: lcdPitchRect
        y: window1.height/3.379310345
        z: 3
        width: window1.width/4
        height: window1.height/5.764705882
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
            font.pixelSize: window1.height/6.533333333
            font.family: a_LCDNovaObl.name
            style: Text.Outline
            styleColor: "white"
            color: "white"
        }
    }

    Text {
        id: textPitch
        width: window1.height/2.067510549
        height: window1.height/5.764705882
        text: qsTr("Дифферент")
        anchors.top: textRoll.bottom
        anchors.topMargin: window1.height/19.6
        anchors.left: parent.left
        anchors.leftMargin: window1.height/24.5
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: window1.height/12.405063291
        color: "white"
        font.family: a_LCDNovaObl.name
    }
    //-------------B C Z coef
    //-----B coef
    Rectangle
    {
        id: lcdCoefBRect
        y: window1.width/2.25
        z: 3
        width: window1.width/8.470588235
        height: window1.width/12
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
            text: coef_B
            font.pixelSize: window1.height/19.6
            font.family: a_LCDNovaObl.name
            style: Text.Outline
            styleColor: "white"
            color: "white"
        }
    }

    Text {
        id: textB
        y: window1.width/2.25
        width: window1.width/12
        height: window1.width/12
        text: qsTr("B")
        anchors.left: parent.left
        anchors.leftMargin: window1.width/36
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: window1.width/18
        color: "white"
        font.family: a_LCDNovaObl.name
    }
    //--------C coef

    Rectangle
    {
        id: lcdCoefCRect
        y: window1.width/2.25
        z: 3
        width: window1.width/8.470588235
        height: window1.width/12
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
            text: coef_C
            font.pixelSize: window1.height/19.6
            font.family: a_LCDNovaObl.name
            style: Text.Outline
            styleColor: "white"
            color: "white"
        }
    }

    Text {
        id: textC
        y: window1.width/2.25
        width: window1.width/12
        height: window1.width/12
        text: qsTr("C")
        anchors.left: lcdCoefBRect.left
        anchors.leftMargin: window1.width/36*4
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: window1.width/18
        color: "white"
        font.family: a_LCDNovaObl.name
    }
    //----Z coef
    Rectangle
    {

        id: lcdCoefZRect
        y: window1.width/2.25
        z: 3
        width: window1.width/8.470588235
        height: window1.width/12
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
            text: coef_Z
            font.pixelSize: window1.height/19.6
            font.family: a_LCDNovaObl.name
            style: Text.Outline
            styleColor: "white"
            color: "white"
        }
    }

    Text {
        id: textZ
        y: window1.width/2.25
        width: window1.width/12
        height: window1.width/12
        text: qsTr("Z")
        anchors.left: lcdCoefCRect.left
        anchors.leftMargin: window1.width/36*4
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: window1.width/18
        color: "white"
        font.family: a_LCDNovaObl.name
    }

    Button {
        id: button1
        width: window1.height/2.390243902
        height: window1.height/10.537634409
        text: logMsg
        anchors.top: lcdCoefBRect.bottom
        anchors.topMargin: window1.width/72
        anchors.left: lcdCoefBRect.left
        anchors.leftMargin: 0
        style: ButtonStyle {
            label: Text {
                    renderType: Text.NativeRendering
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Helvetica"
                    font.pointSize: window1.height/36.296296296
                    color: "black"
                    text: control.text
                }
              }
        onClicked: compass.startWriteLog();
    }
}

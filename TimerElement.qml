import QtQuick 2.12
import QtQuick.Controls 2.5
import CustomControls 1.0
import QtQuick.Layouts 1.11
import QtGraphicalEffects 1.0

Item {
    id: rootTimerElement
    height: 1000
    property alias graphicContainer: graphicContainer
    property alias btnHide: btnHide
    property alias rootTimerElement: rootTimerElement
    property alias btnStop: btnStop
    property alias btnAddTime: btnAddTime
    property alias btnRestart: btnRestart
    property alias tmbSecond: tmbSecond
    property alias tmbMinute: tmbMinute
    property alias tmbHour: tmbHour
    property alias radTime: radTime
    property alias btnPause: btnPause
    property alias btnStart: btnStart
    property alias txtTime: txtTime
    property alias txtName: txtName
    property string pauseIconPath: "assets/timer/pause.svg"
    property double graphicContainerHeight: 0
    property int timerMargins: 400

    Layout.fillWidth: true
    Layout.fillHeight: true

    onHeightChanged: {
        graphicContainerHeight = rootTimerElement.height/5
    }

    MouseArea{
        id: backgroundMouse
        anchors.fill: parent
        onClicked: forceActiveFocus()
    }

    //    Rectangle {
    //        anchors.fill: parent
    //        color: "red"
    //    }
    ColumnLayout {
        id: columnLayout
        spacing: 5
        anchors.fill: parent
        anchors.topMargin: timerMargins
        anchors.bottomMargin: timerMargins
        anchors.leftMargin: timerMargins/5
        anchors.rightMargin: timerMargins/5


        RowLayout {
            id: rowLayout1
            width: 100
            height: 100
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillHeight: true
            Layout.fillWidth: true

            RoundButton {
                id: btnHide
//                text: "X"
                icon.source: "assets/timer/cross.svg"
                autoExclusive: true
            }

            TextInput {
                id: txtName
                width: 80
                height: 20
                color: "#ffffff"
                text: qsTr("Alarm Name")
                cursorVisible: false
                activeFocusOnPress: true
                overwriteMode: false
                mouseSelectionMode: TextInput.SelectCharacters
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                font.pixelSize: 40
                Keys.onReturnPressed: backgroundMouse.forceActiveFocus()
                maximumLength: 13
            }

        }


        RowLayout {
            //            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            Rectangle {
                id: graphicContainer
                color: "transparent"
                Layout.preferredHeight:graphicContainerHeight //parent.parent.parent.height / 5 //3
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.fillWidth: true

                RoundButton{
                    id: btnStart
                    anchors.centerIn: parent
                    width: parent.height/2
                    height: parent.height/2
                    visible: true
                    icon.source: "assets/timer/play.svg"
                    icon.height: parent.height/2
                    icon.width: parent.height/2
                }

                ColumnLayout {
                    id: columnLayout4
                    anchors.fill: parent
                    anchors.topMargin: parent.height/5
                    anchors.bottomMargin: parent.height/5
                    visible: true


                    Text {
                        id: txtTime
                        visible: false
                        color: "white"
                        font.pixelSize: 40
                        text: qsTr("00:00:00")
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    }

                    RoundButton {
                        id: btnPause
                        visible: false
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
                        icon.width: parent.parent.height/3
                        icon.height: parent.parent.height/3
                        icon.source: pauseIconPath
                    }

                }

                RadialBar {
                    id: radTime
                    //                    Rectangle {
                    //                        anchors.fill: parent
                    //                        color: "green"
                    //                    }

                    width: Math.min(parent.width, parent.height) / 1
                    height: Math.min(parent.width, parent.height) / 1
                    anchors.centerIn: parent
                    penStyle: Qt.RoundCap
                    dialType: RadialBar.FullDial
                    progressColor: "#00ffc1"
                    foregroundColor: "#191a2f"
                    dialWidth: 30
                    startAngle: 180
                    //                    spanAngle: 1000 //70
                    minValue: 0
                    maxValue: 100
                    value: 100
                    showText: false
                    textFont {
                        family: "Halvetica"
                        italic: false
                        pointSize: 16
                    }
                    //                    suffixText: "%"
                    textColor: "#FFFFFF"
                }


            }
        }


        ToolSeparator {
            id: toolSeparator
            Layout.rightMargin: 50
            Layout.leftMargin: 50
            Layout.fillWidth: true
            orientation: Qt.Horizontal
        }


        RowLayout {
            id: rowLayout
            width: 100
            height: 100
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillWidth: true
            Layout.fillHeight: true

            ColumnLayout {
                id: columnLayout1
                width: 100
                height: 100
                Layout.fillHeight: true

                Label {
                    id: label
                    text: qsTr("H")
                    font.underline: false
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 18
                }

                Tumbler {
                    id: tmbHour
                    font.pointSize: 24
                    Layout.fillHeight: true
                    model: 24
                }
            }

            ColumnLayout {
                id: columnLayout2
                width: 100
                height: 100
                Layout.fillHeight: true

                Label {
                    id: label1
                    text: qsTr("M")
                    font.pointSize: 18
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.underline: false
                }

                Tumbler {
                    id: tmbMinute
                    font.pointSize: 24
                    model: 60
                    Layout.fillHeight: true
                }
            }

            ColumnLayout {
                id: columnLayout3
                width: 100
                height: 100
                Layout.fillHeight: true

                Label {
                    id: label2
                    text: qsTr("S")
                    font.pointSize: 18
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.underline: false
                }

                Tumbler {
                    id: tmbSecond
                    font.pointSize: 24
                    model: 60
                    Layout.fillHeight: true
                }
            }
        }


        RoundButton {
            id: btnRestart
            text: qsTr("       RESTART")
            font.pointSize: 20
            Layout.preferredHeight: 70
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            icon.source: "assets/timer/restart.svg"
            icon.width: 40
            icon.height: 40
        }



        RoundButton {
            id: btnAddTime
            text: qsTr("        60 secs")
            font.pointSize: 20
            Layout.preferredHeight: 70
            Layout.fillWidth: true
            icon.height: 40
            icon.width: 40
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            icon.source: "assets/timer/plus.svg"
        }


        RoundButton {
            id: btnStop
            text: "          STOP  "
            font.pointSize: 20
            Layout.preferredHeight: 70
            Layout.fillWidth: true
            icon.source: "assets/timer/stop.svg"
            icon.width: 40
            icon.height: 40

        }


    }
}







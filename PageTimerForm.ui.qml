import QtQuick 2.12
import QtQuick.Controls 2.5
import CustomControls 1.0
import QtQuick.Layouts 1.11

Page {
    width: 1920
    height: 1080
    property alias timerList: timerList
    property alias timer1: timer1
    property alias timer2: timer2
    property alias timer3: timer3
    property alias timer4: timer4
    property alias timer5: timer5
    property alias timer6: timer6
    property alias btnAdd: btnAdd

    RowLayout {
        id: timerList
        anchors.topMargin: 20
        spacing: 20
        anchors.bottomMargin: 0
        anchors.fill: parent


        TimerLogic {
            id: timer1
            width: 326
            height: 659
            txtName.text: "Alarm 1"
            Layout.preferredWidth: 600
        }

        TimerLogic {
            id: timer2
            width: 326
            height: 659
            visible: true
            txtName.text: "Alarm 2"
            Layout.preferredWidth: 600
        }

        TimerLogic {
            id: timer3
            width: 326
            height: 659
            visible: true
            txtName.text: "Alarm 3"
            Layout.preferredWidth: 600
        }

        TimerLogic {
            id: timer4
            width: 326
            height: 659
            visible: false
            txtName.text: "Alarm 4"
            Layout.preferredWidth: 600
        }

        TimerLogic {
            id: timer5
            width: 326
            height: 659
            visible: false
            txtName.text: "Alarm 5"
            Layout.preferredWidth: 600
        }

        TimerLogic {
            id: timer6
            width: 326
            height: 659
            visible: false
            txtName.text: "Alarm 6"
            Layout.preferredWidth: 600
        }

        RoundButton {
            id: btnAdd
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            icon.source: "assets/timer/plus.png"
            icon.width: 300
            icon.height: 300
        }
    }
}

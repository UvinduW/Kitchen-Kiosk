import QtQuick 2.9
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

ApplicationWindow {
    id: window
    width: 400
    height: 300
    visible: true

    SwipeView {
        anchors.fill: parent

        Rectangle {
            Text {
                text: "Page 1"
                anchors.centerIn: parent
            }
        }

        Flickable {
            id: listView
            contentWidth: width
            contentHeight: pane.implicitHeight

            ScrollBar.vertical: ScrollBar {}

            Pane {
                id: pane

                GridLayout {
                    columnSpacing: 10
                    columns: 2
                    anchors.fill: parent

                    Label { text: "Label" }
                    Button { text: "Button" }

                    Label { text: "Label" }
                    RadioButton { text: "RadioButton" }

                    Label { text: "Label" }
                    ComboBox { model: 100 }

                    Label { text: "Label" }
                    Button { text: "Button" }

                    Label { text: "Label" }
                    RadioButton { text: "RadioButton" }

                    Label { text: "Label" }
                    ComboBox { model: 100 }

                    Label { text: "Label" }
                    Button { text: "Button" }

                    Label { text: "Label" }
                    RadioButton { text: "RadioButton" }

                    Label { text: "Label" }
                    ComboBox { model: 100 }
                }
            }
        }

        Rectangle {
            visible: SwipeView.isCurrentItem

            Text {
                text: "Page 3"
                anchors.centerIn: parent
            }
        }
    }
}

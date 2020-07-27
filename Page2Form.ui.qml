import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Page {
    width: 600
    height: 400

    header: Label {
        text: qsTr("Page 2")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    Rectangle {}

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

                Label {
                    text: "Label"
                }
                Button {
                    text: "Button"
                }

                Label {
                    text: "Label"
                }
                RadioButton {
                    text: "RadioButton"
                }

                Label {
                    text: "Label"
                }
                ComboBox {
                    model: 100
                }

                Label {
                    text: "Label"
                }
                Button {
                    text: "Button"
                }

                Label {
                    text: "Label"
                }
                RadioButton {
                    text: "RadioButton"
                }

                Label {
                    text: "Label"
                }
                ComboBox {
                    model: 100
                }

                Label {
                    text: "Label"
                }
                Button {
                    text: "Button"
                }

                Label {
                    text: "Label"
                }
                RadioButton {
                    text: "RadioButton"
                }

                Label {
                    text: "Label"
                }
                ComboBox {
                    model: 100
                }
                Label {
                    text: "Label"
                }
                Button {
                    text: "Button"
                }

                Label {
                    text: "Label"
                }
                RadioButton {
                    text: "RadioButton"
                }

                Label {
                    text: "Label"
                }
                ComboBox {
                    model: 100
                }

                Label {
                    text: "Label"
                }
                Button {
                    text: "Button"
                }

                Label {
                    text: "Label"
                }
                RadioButton {
                    text: "RadioButton"
                }

                Label {
                    text: "Label"
                }
                ComboBox {
                    model: 100
                }

                Label {
                    text: "Label"
                }
                Button {
                    text: "Button"
                }

                Label {
                    text: "Label"
                }
                RadioButton {
                    text: "RadioButton"
                }

                Label {
                    text: "Label"
                }
                ComboBox {
                    model: 100
                }
                Label {
                    text: "Label"
                }
                Button {
                    text: "Button"
                }

                Label {
                    text: "Label"
                }
                RadioButton {
                    text: "RadioButton"
                }

                Label {
                    text: "Label"
                }
                ComboBox {
                    model: 100
                }

                Label {
                    text: "Label"
                }
                Button {
                    text: "Button"
                }

                Label {
                    text: "Label"
                }
                RadioButton {
                    text: "RadioButton"
                }

                Label {
                    text: "Label"
                }
                ComboBox {
                    model: 100
                }

                Label {
                    text: "Label"
                }
                Button {
                    text: "Button"
                }

                Label {
                    text: "Label"
                }
                RadioButton {
                    text: "RadioButton"
                }

                Label {
                    text: "Label"
                }
                ComboBox {
                    model: 100
                }
            }
        }
    }
}

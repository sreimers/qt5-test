import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.3


ApplicationWindow {
    id: applicationWindow
    visible: true
    width: 800
    height: 480
    minimumWidth: 400
    minimumHeight: 200

    title: qsTr("Studio Link")




    Popup {
        id: popup
        anchors.centerIn: parent
        height: 200
        width: parent.width/100*80
        modal: true
        focus: true
        clip: true
        opacity: 0.8
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
Flow {
    y: -vbar.position * height
    ComboBox {
        id: comboBox
        model: ["First", "Second", "Third"]
        displayText: "Eingang: " + currentText
        width: 200
    }

    Rectangle {
        id: rectangle
        width: 100
        height: 100

    }
}

        ScrollBar {
            id: vbar
            hoverEnabled: true
            active: hovered || pressed
            orientation: Qt.Vertical
            size: parent.height/1000
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.bottom: parent.bottom

        }
    }
    Image {
        id: logo
        x: 20
        y: 8
        width: 400
        height: 34
        fillMode: Image.PreserveAspectFit
        source: "logo_standalone.svg"
        MouseArea {
            anchors.fill: parent
            onClicked: slmenu.setCurrentIndex(0)
        }
    }

    Label {


        id: status
        text: qsTr("Online")
        padding: 10
        color: '#fff'
        background: Rectangle {

            border.color: "#14191D"
            color: Material.color(Material.LightGreen)
            radius: 5
        }
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.top: parent.top
        anchors.topMargin: 10



    }


    TabBar {
        id: slmenu
        width: 364

        height: 42
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 27
        anchors.left: parent.left
        anchors.leftMargin: 20
        currentIndex: 0
        TabButton {
            id: call
            height: slmenu.height
            text: qsTr("Call List")
            icon.name: "rocket"
            icon.source: "rocket-solid.svg"
            icon.color: Material.accent
        }
        TabButton {
            id: contacts
            height: slmenu.height
            text: qsTr("Contacts")
        }
        TabButton {
            id: settings
            height: slmenu.height
            text: qsTr("Settings")
        }
    }




    StackLayout {
        anchors.rightMargin: 20
        anchors.bottomMargin: 10
        anchors.topMargin: 60
        anchors.leftMargin: 20
        anchors.fill: parent
        currentIndex: slmenu.currentIndex
        Item {
            id: callTab



            Call {
                id: caller
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.right: parent.right
                anchors.rightMargin: 0

            }

            ProgressBar {
                id: microLevelLeft
                anchors.top: parent.top
                anchors.topMargin: 5
                value: 0.5


            }


            ProgressBar {
                id: microLevelRight
                value: 0.8
                anchors.top: microLevelLeft.top
                anchors.topMargin: 8

            }

            Label {
                id: label
                color: "#888888"
                text: qsTr("Your signal level")
                anchors.top: microLevelRight.top
                anchors.topMargin: 5

            }
            RoundButton {
                id: roundButton
                text: ""
                anchors.left: parent.left
                anchors.leftMargin: 200
                anchors.top: parent.top
                anchors.topMargin: -10
                icon.name: "rocket"
                icon.source: "rocket-solid.svg"
                onClicked: popup.open()
            }

            Flow {
                spacing: 5
                anchors.topMargin: 100
                anchors.fill: parent
                anchors.margins: 4

                Repeater {
                    model: 10
                    Rectangle{
                        height: 100
                        width: 250
                        border.width: 1
                        color: '#000'
                        opacity: 0.3

                    }
                }

            }

        }

        Item {
            id: contactsTab

            TextField {
                id: textField
                text: qsTr("Text Field")
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }


        Item {
            id: settingsTab





        }

    }




    Label {
        id: version
        color: "#888888"
        text: qsTr("Version: v19.12.12-beta-askdfjkldsfj")
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        font.pixelSize: 14
        MouseArea {
            anchors.fill: parent
            onClicked: Qt.openUrlExternally("https://doku.studio-link.de")
            cursorShape: Qt.PointingHandCursor

        }

    }
}






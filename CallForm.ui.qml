import QtQuick 2.4
import QtQuick.Controls 2.13
import QtQuick.Controls.Material 2.13

Item {
    id: element

    TextField {
        id: textField
        height: 50
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.right: button.left
        anchors.rightMargin: 10
        width: 200
        font.pointSize: 16
        placeholderText: qsTr("Enter Call id")
    }
    Button {
        id: button
        x: 293
        width: 152
        height: 48
        text: qsTr("Call")
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        icon.name: "rocket"
        icon.source: "rocket-solid.svg"
        icon.color: Material.accent
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/


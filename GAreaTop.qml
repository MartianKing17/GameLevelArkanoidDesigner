import QtQuick 2.0

Rectangle {
    Text {
        color: "black"
        width: parent.width * 0.4
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.35
        text: qsTr("Score: ")
    }
}

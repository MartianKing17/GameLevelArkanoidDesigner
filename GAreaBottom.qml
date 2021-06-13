import QtQuick 2.0

Rectangle {
    Block {
        color: "transparent"
        height: parent.height * 0.5
        width: height
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.4
        anchors.topMargin: parent.height * 0.4
        source: "file:/home/maxim/Documents/texture/platform.png"
    }
}

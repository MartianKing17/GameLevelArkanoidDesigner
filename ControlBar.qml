import QtQuick 2.0
import QtQuick.Controls 2.12

Rectangle {
    anchors.top: parent.top
    anchors.left: parent.left
    width: parent.width
    height: window.height * 0.1
    color: "#334444"
    signal save;
    property alias block: _block;

    Block {
        id: _block
        color: "black"
        source: parent.source
        width: parent.width * 0.0925
        height: parent.width * 0.05
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: parent.height * 0.1
        anchors.leftMargin: width * 0.4
    }

    Button {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: parent.height * 0.25
        anchors.leftMargin: parent.width * 0.8
        width: parent.width / 8
        height: parent.height * 0.5
        text: "Save"
        onClicked: { save(); }
    }
}

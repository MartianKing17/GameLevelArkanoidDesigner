import QtQuick 2.12

Rectangle {
    id: _item
    z: 1
    visible: false
    color: "transparent"
    property var _source: ""
    Image {
        anchors.fill: parent
        source: parent._source
    }

    MouseArea {
        id: _area
        anchors.fill: parent
        onMouseXChanged: {
            parent.x = mouse.x
        }

        onMouseYChanged: {
            parent.y = mouse.y
        }

        onReleased: arr.push(this)
    }
}

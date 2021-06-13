import QtQuick 2.0

Rectangle {
    id: block
    property string source;
    Image {
        id: image
        anchors.fill: parent
        source: parent.source
    }
}

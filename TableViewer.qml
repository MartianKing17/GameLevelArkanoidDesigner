import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12

Rectangle {
    color: "#bff"
    property Block _block;
    property var _listModel;
    GAreaTop {
        id: _top
        color: "transparent"
        width: parent.width
        height: parent.height * 0.1
    }

    Rectangle {
        id: _center
        border.width: 3
        border.color: "black"
        anchors.top: _top.bottom
        anchors.left: parent.left
        width: parent.width
        height: parent.height * 0.5

        Component.onCompleted: {
            for (var i = 0; i < 13 * 18; i++) {
                _listModel.append({"source" : ""})
            }
        }

        GridView {
            id: _view
            width: parent.width
            height: parent.height
            anchors.topMargin: _top.height
            cellWidth: width / 13
            cellHeight: height / 18
            clip: false
            interactive: false
            model: _listModel
            delegate: Block {
                id: block
                property bool isClicked: false
                border.color: "black"
                border.width: 1
                width: _view.cellWidth
                height: _view.cellHeight

                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        if (block.isClicked) {
                            model.source = "";
                            block.source = "";
                            block.isClicked = false;
                        } else {
                            model.source = _block.source;
                            block.source = _block.source;
                            block.isClicked = true;
                        }
                    }
                }
            }
        }
    }

    GAreaBottom {
        color: "transparent"
        visible: true
        anchors.left: parent.left
        anchors.top: _center.bottom
        width: parent.width
        height: parent.height * 0.4
    }
}

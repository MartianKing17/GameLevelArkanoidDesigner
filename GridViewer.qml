import QtQuick 2.0

Rectangle {
    id: _grid
    property Block _block;

    ListModel {
        id: _model
        ListElement {source: "texture/block_blue.png"}
        ListElement {source: "texture/block_bronze.png"}
        ListElement {source: "texture/block_deep_sky.png"}
        ListElement {source: "texture/block_green.png"}
        ListElement {source: "texture/block_grey.png"}
        ListElement {source: "texture/block_orange.png"}
        ListElement {source: "texture/block_pink.png"}
        ListElement {source: "texture/block_red.png"}
        ListElement {source: "texture/block_white.png"}
        ListElement {source: "texture/block_yellow.png"}
    }

    GridView {
        id: _view
        property int calc: width / 8
        anchors.fill: parent
        interactive: false
        cellWidth: calc * 3.7
        cellHeight: calc * 2
        model: _model
        anchors.margins: width / 16
        delegate: Block {
            id: block
            width: _view.cellWidth / 1.5
            height: _view.cellHeight / 1.5
            source: "file:" + model.source

            MouseArea {
                id: area
                anchors.fill: parent
                onPressed: {
                    _block.source = block.source;
                }
            }
        }
    }
}

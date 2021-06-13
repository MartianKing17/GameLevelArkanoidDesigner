import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.12
import SaveModel 1.0

Window {
    id: window
    color: "#41533b"
    visible: true
    width: 640
    height: 480
    title: qsTr("Arkanoid Level Designer")

    SaveModel {
        id: _saveModel
    }

    ControlBar {
        id: _bar
        anchors.top: parent.top
        anchors.left: parent.left
        width: parent.width
        height: window.height * 0.1
        color: "#334444"
        onSave: {
            var arr =[]
            var str;

            for(var i = 0; i < _listModel.count; i++) {
                if (_listModel.get(i).source !== "") {
                    str = i + ", " + _listModel.get(i).source;
                    arr.push(str);
                }
            }

            _saveModel.saveToFile(arr);
        }
    }

    ListModel {
        id: _listModel
    }

    GridViewer {
        id: _grid
        z: 0
        color: "transparent"
        _block: _bar.block
        width: parent.width * 0.25
        height: width
        anchors.topMargin: parent.height * 0.1
        anchors.left: parent.left
        anchors.top: parent.top
    }

    TableViewer {
        id: _view
        z: 0
        _block: _bar.block
        width: parent.width * 0.75
        height: parent.height - parent.height * 0.1
        anchors.topMargin: parent.height * 0.1
        anchors.left: _grid.right
        anchors.top: parent.top
        _listModel: _listModel
    }
}

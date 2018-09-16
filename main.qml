import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Controls 1.4
import "img"

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Photo Browser")

    BrowserView {
        id: browserview
        anchors.fill: parent
        color: "black"
    }
}

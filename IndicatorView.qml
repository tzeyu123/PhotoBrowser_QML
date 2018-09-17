import QtQuick 2.0

Rectangle {
    width: 16
    height: 20
    color: "#000000"
    property string currentPhotoNum: "0"
    property string totalPhotoCount: "0"


    Text {
        anchors.fill: parent
        anchors.horizontalCenter: parent.horizontalCenter
        color: "#ffffff"
        text: currentPhotoNum + "/" + totalPhotoCount
    }
}

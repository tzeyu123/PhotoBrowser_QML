import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Controls 1.4
import "img"

// { 位置
Rectangle
{
    anchors.fill: parent

    Button {
        width: 50
        height: 50
        anchors.verticalCenter: browser.verticalCenter
        x: browser.x - width - 5
        iconSource: "img/btn_prev.svg"
        visible: viewmodel.isNotFirstPhoto
        onClicked: {
            viewmodel.getPreviousPhoto();
        }
    }

    Rectangle {
        id: browser
        width: parent.width / 2
        height: parent.height / 2
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2

        Image{
            id: image
            anchors.fill: parent
            source: viewmodel.imageSource
        }
    }

    Button {
        width: 50
        height: 50
        anchors.verticalCenter: browser.verticalCenter
        x: browser.x + browser.width + 5
        iconSource: "img/btn_next.svg"
        visible: viewmodel.isNotLastPhoto
        onClicked: {
            viewmodel.getNextPhoto();
        }
    }

    IndicatorView {
        anchors {
            top: browser.bottom
            horizontalCenter: browser.horizontalCenter
        }


        currentPhotoNum: viewmodel.currentPhotoNum.toString()
        totalPhotoCount: viewmodel.totoalPhotoCount.toString()
    }

    BrowserViewModel {
        id: viewmodel
    }
}

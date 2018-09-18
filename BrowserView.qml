import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Controls 1.4
import "img"

Rectangle {
    x: 0
    y: 0
    width: 640
    height: 480

    Button {
        id: previousbutton
        width: 50
        height: 50
        anchors.verticalCenter: browser.verticalCenter
        x: browser.x - width - 5
        iconSource: "img/btn_prev.svg"
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

        Image {
            id: image
            anchors.fill: parent
            source: viewmodel.imageSource
        }
    }

    Button {
        id: nextbutton
        width: 50
        height: 50
        anchors.verticalCenter: browser.verticalCenter
        x: browser.x + browser.width + 5
        iconSource: "img/btn_next.svg"
        onClicked: {
            viewmodel.getNextPhoto();
        }
    }

    IndicatorView {
        anchors {
            top: browser.bottom
            horizontalCenter: browser.horizontalCenter
        }

        currentPhotoNum: viewmodel.currentPhotoNumber
        totalPhotoCount: viewmodel.totoalPhotoCount
    }

    BrowserViewModel {
        id: viewmodel
    }
}

import QtQuick 2.0

Item {
    property int  currentPhothoIndex: 0
    property int  lastPhotoIndex: imagemodel.imageSource.length - 1
    property var  imageSource: imagemodel.imageSource[currentPhothoIndex]

    // property naming 更貼近使用情況
    property bool isNotFirstPhoto: (currentPhothoIndex === 0) ? false : true
    property bool isNotLastPhoto: (currentPhothoIndex === lastPhotoIndex) ? false : true

    property ImageModel imagemodel: ImageModel{}

    function getNextPhoto() {

       var lastPhotoIndex = imagemodel.imageSource.length - 1;
       var nextPhotoIndex = currentPhothoIndex + 1;

       if (nextPhotoIndex <= lastPhotoIndex) {
            currentPhothoIndex = nextPhotoIndex;
       }
    }

    function getPreviousPhoto() {

       var previousPhotoIndex = currentPhothoIndex - 1;

       if (previousPhotoIndex >= 0) {
           currentPhothoIndex = previousPhotoIndex;
       }
    }
}

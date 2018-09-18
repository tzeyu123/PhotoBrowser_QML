import QtQuick 2.0

Item {
    property int  currentPhothoIndex: 0
    property int  lastPhotoIndex: imagemodel.imageSource.length - 1
    property string  currentPhotoNumber: (currentPhothoIndex + 1).toString()
    property string  totoalPhotoCount: (imagemodel.imageSource.length).toString()
    property var  imageSource: imagemodel.imageSource[currentPhothoIndex]

    property ImageModel imagemodel: ImageModel{}

    function getNextPhoto() {

       var nextPhotoIndex = currentPhothoIndex + 1;

       if (nextPhotoIndex <= lastPhotoIndex) {
            currentPhothoIndex = nextPhotoIndex;
       }
       else {
            currentPhothoIndex = 0;
       }
    }

    function getPreviousPhoto() {

       var previousPhotoIndex = currentPhothoIndex - 1;

       if (previousPhotoIndex >= 0) {
           currentPhothoIndex = previousPhotoIndex;
       }
       else {
            currentPhothoIndex = lastPhotoIndex;
       }
    }
}

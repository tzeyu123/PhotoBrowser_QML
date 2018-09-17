import QtQuick 2.0

Item {
    property int  currentPhothoIndex: 0
    property int  currentPhotoNum: currentPhothoIndex + 1
    property int  totoalPhotoCount: imagemodel.imageSource.length
    property var  imageSource: imagemodel.imageSource[currentPhothoIndex]
    property bool isNotFirstPhoto: logic.isNotFirstPhoto()
    property bool isNotLastPhoto: logic.isNotLastPhoto()
    property ImageModel imagemodel: ImageModel{}

    function getNextPhoto() {

       var lastPhotoIndex = imagemodel.imageSource.length - 1;
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
       var lastPhotoIndex = imagemodel.imageSource.length - 1;

       if (previousPhotoIndex >= 0) {
           currentPhothoIndex = previousPhotoIndex;
       }
       else {
           currentPhothoIndex = lastPhotoIndex;
       }
    }

    // 想想看, 有什麼可以不用這兩個 logic function 來決定 prev/next button visible
    QtObject {
        id: logic
        function isNotFirstPhoto() {

            if (imageSource === imagemodel.imageSource[0])
            {
                return false;
            }
            return true;
        }

        function isNotLastPhoto() {

            var lastPhotoIndex = imagemodel.imageSource.length - 1;
            if (imageSource === imagemodel.imageSource[lastPhotoIndex])
            {
                return false;
            }
            return true;
        }
    }
}

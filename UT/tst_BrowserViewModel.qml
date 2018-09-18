import QtQuick 2.11
import QtTest 1.1
import ".."

Item {
    id: tst_browserviewmodel
    property var testItem: loader.item


    ImageModel {
        id: moc_imagemodel
        imageSource: ["firstImage", "secondImage", "thirdImage", "lastImage"]
    }

    ImageModel {
        id: moc_one_imagemodel
        imageSource: ["oneImage"]
    }

    Loader {
        id: loader
        sourceComponent: BrowserViewModel {
            imagemodel: moc_imagemodel
        }
    }

    TestCase {
        name: "browserviewmodelTest"
        when: windowShown

        function init()
        {
            loader.active = true;
        }

        function cleanup()
        {
            loader.active = false;
        }

        function test_first_image_get_next_photo_return_second_image()
        {
            testItem.currentPhothoIndex = 0;
            testItem.getNextPhoto();
            compare(testItem.imageSource, "secondImage")
        }

        function test_last_Image_get_next_photo_return_last_image()
        {
            testItem.currentPhothoIndex = 3;
            testItem.getNextPhoto();
            compare(testItem.imageSource, "lastImage")
        }

        function test_third_Image_get_previous_photo_return_second_image()
        {
            testItem.currentPhothoIndex = 2;
            testItem.getPreviousPhoto();
            compare(testItem.imageSource, "secondImage")
        }

        function test_first_Image_get_previous_photo_return_first_image()
        {
            testItem.currentPhothoIndex = 0;
            testItem.getPreviousPhoto();
            compare(testItem.imageSource, "firstImage")
        }

        function test_image_source_is_first_photo_previous_button_is_not_visible()
        {
            testItem.currentPhothoIndex = 0;

            compare(testItem.isPreviousButtonVisible , false)
        }

        function test_image_source_is_last_photo_next_button_is_not_vivisble()
        {
            testItem.currentPhothoIndex = 3;

            compare(testItem.isNextButtonVisible , false)
        }

        function test_image_source_is_only_one_photo_next_button_and_previous_button_should_be_not_visible()
        {
            testItem.imagemodel = moc_one_imagemodel

            compare(testItem.isPreviousButtonVisible , false)
            compare(testItem.isNextButtonVisible , false)
        }

     }
}

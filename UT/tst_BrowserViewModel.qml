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

        function test_current_photo_is_last_image_click_next_button_display_first_image()
        {
            testItem.currentPhothoIndex = 3
            testItem.getNextPhoto();
			
            compare(testItem.imageSource, "firstImage")
        }

        // test content is not relevant with test name
        function test_third_Image_get_previous_photo_return_second_image()
        {
            testItem.currentPhothoIndex = 2;
            testItem.getNextPhoto();
            compare(testItem.imageSource, "lastImage")
        }

        function test_current_photo_is_first_image_click_previous_button_display_last_image()
        {
            testItem.currentPhothoIndex = 0
            testItem.getPreviousPhoto();
			
            compare(testItem.imageSource, "lastImage")
        }

        // test name 應該可以更接近 acceptance criteria 的內容
        function test_image_source_is_first_photo_isNotFirstPhoto_return_false()
        {
            testItem.imageSource = moc_imagemodel.imageSource[0]

            compare(testItem.isNotFirstPhoto , false)
        }

        // test name 應該可以更接近 acceptance criteria 的內容
        function test_image_source_is_last_photo_isNotLastPhot_return_false()
        {
            testItem.imageSource = moc_imagemodel.imageSource[3]

            compare(testItem.isNotLastPhoto , false)
        }

        function test_image_source_is_only_one_photo_isNotLastPhot_and_isNotFirstPhoto_return_false()
        {
            testItem.imagemodel = moc_one_imagemodel

            compare(testItem.isNotFirstPhoto , false)
            compare(testItem.isNotLastPhoto , false)
        }

        function test_current_photo_is_second_photo_will_show_1()
        {
            testItem.currentPhothoIndex = 0;
            compare(testItem.currentPhotoNum, 1)
        }
        
        function test_4_image_sources_show_total_photo_count_is_4()
        {
            compare(testItem.totoalPhotoCount, 4)
        }
		
		


     }
}

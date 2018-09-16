# PhotoBrowser_QML
IDE: QT Creator
========================================================================================================================================
story1

Acceptance criteria:
1. Previous button 切到第一張圖後, 會消失
2. Next button 切到最後一張圖後, 會消失
3. 只有一個 animal 時, previous/next button 都消失

Rule:

a. 除了 main.qml 外, create 一個 BrowserView.qml 用來呈現整個 View; 一個 Model.qml 來放動物照片; 一個 ViewModel.qml 來提供瀏覽功能的 logic 部分
b: BrowserView 裡面不允許有商業 logic 的部分, 但可以呼叫 or 使用 ViewModel 提供的 property, function or signal
c: ViewModel 不允許外面 component 的 object 傳進來 control
d: unit test/tdd

Unit Test: 
C:\Qt\Qt5.11.1\5.11.1\msvc2017_64\bin> qmltestrunner.exe -input C:\Users\ryan.yu\Documents\photobrowser\UT\tst_BrowserViewModel.qml

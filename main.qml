import QtQuick 2.6
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Controls.Material 2.2


ApplicationWindow {
    id: window
    width: 440
    height: 620
    visible: true
    title: qsTr("Slider&Dial Template")

    ComboBox {
        id: cmbSliders
        y: 47
        anchors.left: parent.left
        anchors.leftMargin: 0
        editable: false
        model: ListModel {
            id: cmbsliders
            ListElement { text: "SilverThumb" }
            ListElement { text: "Flat" }
            ListElement { text: "HiTech" }
        }
        onActivated:{
            var name = textAt(index);
            sliderloader.source = chkVerticalSlider.checked? "QML/Sliders/" + name + "/" + name + "_Vertical.qml": "QML/Sliders/" + name + "/" + name + ".qml";
        }
    }

    ComboBox {
        id: cmbDials
        y: 47
        anchors.right: parent.right
        anchors.rightMargin: 0
        editable: false
        model: ListModel {
            id: cmbdials
            ListElement { text: "BlueHighTech" }
            ListElement { text: "GreyKnob" }
            ListElement { text: "FlatDial" }
        }
        onActivated:{
            var name = textAt(index);
            dialloader.source = "QML/Dials/" + name + "/" + name + ".qml";
        }
    }

    Text {
        id: sliders
        y: 14
        width: 120
        height: 27
        text: qsTr("Sliders")
        anchors.left: parent.left
        anchors.leftMargin: 0
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 12
    }

    Text {
        id: dials
        y: 14
        width: 120
        height: 27
        text: qsTr("Dials")
        anchors.right: parent.right
        anchors.rightMargin: 0
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 12
    }

    CheckBox {
        id: chkVerticalSlider
        anchors.topMargin: 0
        anchors.horizontalCenter: parent.horizontalCenter
        checked: true
        text: qsTr("Show Vertical Slider")
        onCheckStateChanged: {
            var name = cmbSliders.textAt(cmbSliders.currentIndex);
            sliderloader.source = chkVerticalSlider.checked? "QML/Sliders/" + name + "/" + name + "_Vertical.qml": "QML/Sliders/" + name + "/" + name + ".qml";
        }
    }

    Rectangle {
        id: slider
        y: chkVerticalSlider.checked? 40: 160;
        width: chkVerticalSlider.checked? 60: 300;
        height: chkVerticalSlider.checked? 300: 60;
        anchors.horizontalCenter: parent.horizontalCenter
        Loader {
            id: sliderloader
            anchors.fill: parent
            source: chkVerticalSlider.checked? "QML/Sliders/SilverThumb/SilverThumb_Vertical.qml": "QML/Sliders/SilverThumb/SilverThumb.qml";
            //source: chkVerticalSlider.checked? "QML/Sliders/Flat/Flat_Vertical.qml": "QML/Sliders/Flat/Flat.qml";
            //source: chkVerticalSlider.checked? "QML/Sliders/HiTech/HiTech_Vertical.qml": "QML/Sliders/HiTech/HiTech.qml";
        }
    }

    Rectangle {
        id: dial
        y: 380
        width: 210
        height: 210
        anchors.horizontalCenter: parent.horizontalCenter
        Loader {
            id: dialloader
            anchors.fill: parent
            //source: "QML/Dials/FlatDial/FlatDial.qml";
            //source: "QML/Dials/GreyKnob/GreyKnob.qml";
            source: "QML/Dials/BlueHighTech/BlueHighTech.qml";
        }
    }
}

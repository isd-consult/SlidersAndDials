import QtQuick 2.6
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.2
Rectangle {
    id: flat

    Image {
        id: max
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.horizontalCenter: parent.horizontalCenter
        source: "../../../Assets/Sliders/Flat/Max.png"
    }

    Slider {
        id: control
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        height: parent.height - min.height - max.height
        value: 0.3
        orientation: Qt.Vertical

        handle: Rectangle {
            y: control.topPadding + control.visualPosition * (control.availableHeight - height)
            x: control.leftPadding + control.availableWidth / 2 - width / 2
            implicitWidth: 16
            implicitHeight: 16
            radius: 8
            color: "#6200EE"
            border.color: "#6200EE"
        }
        background: Rectangle {
            y: control.topPadding
            x: control.leftPadding + control.availableWidth / 2 - width / 2
            implicitHeight: 200
            implicitWidth: 4
            height: control.availableHeight
            width: implicitWidth
            radius: 2
            color: "#6200EE"

            Rectangle {
                height: control.visualPosition * parent.height
                width: parent.width
                color: "#C2A8E7"
                radius: 2
            }
        }
    }



    Image {
        id: min
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.horizontalCenter: parent.horizontalCenter
        source: "../../../Assets/Sliders/Flat/Min.png"
    }
}

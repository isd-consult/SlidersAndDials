import QtQuick 2.6
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.2
Rectangle {
    id: flat
    Image {
        id: min
        anchors.verticalCenter: parent.verticalCenter
        source: "../../../Assets/Sliders/Flat/Min.png"
    }

    Slider {
        id: control
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        width: parent.width - min.width - max.width
        value: 0.5
        handle: Rectangle {
            x: control.leftPadding + control.visualPosition * (control.availableWidth - width)
            y: control.topPadding + control.availableHeight / 2 - height / 2
            implicitWidth: 16
            implicitHeight: 16
            radius: 8
            color: "#6200EE"
            border.color: "#6200EE"
        }
        background: Rectangle {
            x: control.leftPadding
            y: control.topPadding + control.availableHeight / 2 - height / 2
            implicitWidth: 200
            implicitHeight: 4
            width: control.availableWidth
            height: implicitHeight
            radius: 2
            color: "#C2A8E7"

            Rectangle {
                width: control.visualPosition * parent.width
                height: parent.height
                color: "#6200EE"
                radius: 2
            }
        }
    }

    Image {
        id: max
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.verticalCenter: parent.verticalCenter
        source: "../../../Assets/Sliders/Flat/Max.png"
    }
}

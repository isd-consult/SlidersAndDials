import QtQuick 2.6
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.2
Rectangle {
    id: hitech
    color: "#343434"
    Image {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: parent.height * .05
        width: parent.width * .65
        height: parent.height * .3
        source: "../../../Assets/Sliders/HiTech/Step.png"
    }
    Rectangle {
        width: parent.width
        height: parent.height * .65
        anchors.bottom: parent.bottom
        color: parent.color
        Rectangle {
            id: min
            height: parent.height * .7
            anchors.left: parent.left
            anchors.leftMargin: parent.width * .02
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width * .11
            color: parent.color
            Image {
                anchors.fill:parent
                source: "../../../Assets/Sliders/HiTech/Min.png"
                opacity: minarea.pressed ? 0.5 : 1.0
            }

            MouseArea {
                id: minarea
                anchors.fill:parent
                onClicked: control.value -= .1;
            }
        }

        Slider {
            id: control
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width * .7
            height: parent.height * .7
            clip: false
            visible: true
            padding: 0
            value: 0.5
            handle: Rectangle {
                x: control.leftPadding + control.visualPosition * (control.availableWidth - width)
                y: control.topPadding + control.availableHeight / 2 - height / 2
                width: 0
                height: 0
            }
            background: Rectangle {
                x: control.leftPadding
                y: control.topPadding + control.availableHeight / 2 - height / 2
                width: parent.width
                height: parent.height
                Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.fill: parent
                    source: "../../../Assets/Sliders/HiTech/Background.png"
                }

                Rectangle {
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width * .03
                    width: parent.width * .94 * control.value
                    height: control.value > .07 ? parent.height * .7: parent.height * control.value * 10
                    anchors.verticalCenter: parent.verticalCenter
                    radius: height / 2
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#00F8DC" }
                        GradientStop { position: 0.5; color: "#0ACBE8" }
                        GradientStop { position: 1.0; color: "#06689E" }
                    }
                }
            }
        }
        Rectangle {
            id: max
            anchors.right: parent.right
            anchors.rightMargin: parent.width * .02
            anchors.verticalCenter: parent.verticalCenter
            height: parent.height * .7
            width: parent.width * .11
            color: parent.color
            Image {
                anchors.fill:parent
                source: "../../../Assets/Sliders/HiTech/Max.png"
                opacity: maxarea.pressed ? 0.5 : 1.0
            }

            MouseArea {
                id: maxarea
                anchors.fill:parent
                onClicked: control.value += .1;
            }
        }
    }
}

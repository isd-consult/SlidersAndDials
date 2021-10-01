import QtQuick 2.6
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.2
Rectangle {
    id: hitech
    color: "#343434"
    Image {
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: parent.width * .1
        width: parent.width * .25
        height: parent.height * .65
        source: "../../../Assets/Sliders/HiTech/Step_vertical.png"
    }
    Rectangle {
        width: parent.width * .65
        height: parent.height
        anchors.top: parent.top
        color: parent.color
        Rectangle {
            id: max
            anchors.top: parent.top
            anchors.topMargin: parent.height * .04
            anchors.horizontalCenter: parent.horizontalCenter
            height: parent.height * .08
            width: parent.width * .7
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
        Slider {
            id: control
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width * .7
            height: parent.height * .7
            padding: 0
            value: 0.5
            orientation: Qt.Vertical
            handle: Rectangle {
                y: control.topPadding + control.visualPosition * (control.availableHeight - height)
                x: control.leftPadding + control.availableWidth / 2 - width / 2
                width: 0
                height: 0
            }
            background: Rectangle {
                y: control.topPadding
                x: control.leftPadding + control.availableWidth / 2 - width / 2
                width: parent.width
                height: parent.height
                color: "#ffffff"
                Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.fill: parent
                    source: "../../../Assets/Sliders/HiTech/Background_vertical.png"
                }

                Rectangle {
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: parent.height * .03
                    height: parent.height * .94 * control.value
                    width: control.value > .07 ? parent.width * .7: parent.width * control.value * 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    radius: width / 2
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#00F8DC" }
                        GradientStop { position: 0.5; color: "#0ACBE8" }
                        GradientStop { position: 1.0; color: "#06689E" }
                    }
                }
            }
        }
        Rectangle {
            id: min
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height * .04
            anchors.horizontalCenter: parent.horizontalCenter
            //anchors.horizontalCenterOffset: parent.width * .05
            height: parent.height * .08
            width: parent.width * .7
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
    }
}

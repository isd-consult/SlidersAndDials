import QtQuick 2.6
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.2
Rectangle {
    id: silverthumb
    Image {
        id: background
        width: parent.width
        height: parent.height
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.horizontalCenter: parent.horizontalCenter
        source: "../../../Assets/Sliders/SilverThumb/Background_vertical.png"
        Text {
            id: percent0
            color: "#ffffff"
            y: parent.height * .8
            x: parent.width * .65
            text: "0"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        Text {
            id: percent20
            color: control.value >= .2? "#ffffff" : "#888888"
            y: parent.height * .65
            x: parent.width * .65
            text: "20"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        Text {
            id: percent40
            color: control.value >= .4? "#ffffff" : "#888888"
            y: parent.height * .5
            x: parent.width * .65
            text: "40"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        Text {
            id: percent60
            color: control.value >= .6? "#ffffff" : "#888888"
            y: parent.height * .35
            x: parent.width * .65
            text: "60"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        Text {
            id: percent80
            color: control.value >= .8? "#ffffff" : "#888888"
            y: parent.height * .19
            x: parent.width * .65
            text: "80"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        Text {
            id: percent100
            color: control.value >= 1.0? "#ffffff" : "#888888"
            y: parent.height * .04
            x: parent.width * .65
            text: "100"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    Slider {
        id: control
        height: parent.height * .76
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -parent.height * .055
        anchors.horizontalCenterOffset: -parent.width * .16
        padding: 0
        orientation: Qt.Vertical
        value: 0.4
        handle: Rectangle {
            y: control.topPadding + control.visualPosition * control.availableHeight - height / 2
            x: control.leftPadding + control.availableWidth / 2 - width / 2
            implicitWidth: 16
            implicitHeight: 16
            radius: 8
            Image {
                anchors.centerIn: parent
                source: "../../../Assets/Sliders/SilverThumb/Handle.png"
            }

        }
        background: Rectangle {
            y: control.topPadding
            x: control.leftPadding + control.availableWidth / 2 - width / 2
            implicitHeight: 200
            implicitWidth: 5
            height: control.availableHeight
            width: implicitWidth
            radius: 3
            color: "#2A92D2"
            border.width : 0
            Rectangle {
                height: control.visualPosition * parent.height
                width: parent.width
                color: "#282A2D"
                radius: 3
            }
        }
    }
}

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
        source: "../../../Assets/Sliders/SilverThumb/Background.png"
        Text {
            id: percent0
            color: "#ffffff"
            x: parent.width * .16
            y: parent.height * .65
            text: "0"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        Text {
            id: percent20
            color: control.value >= .2? "#ffffff" : "#888888"
            x: parent.width * .3
            y: parent.height * .65
            text: "20"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        Text {
            id: percent40
            color: control.value >= .4? "#ffffff" : "#888888"
            x: parent.width * .45
            y: parent.height * .65
            text: "40"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        Text {
            id: percent60
            color: control.value >= .6? "#ffffff" : "#888888"
            x: parent.width * .61
            y: parent.height * .65
            text: "60"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        Text {
            id: percent80
            color: control.value >= .8? "#ffffff" : "#888888"
            x: parent.width * .76
            y: parent.height * .65
            text: "80"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        Text {
            id: percent100
            color: control.value >= 1.0? "#ffffff" : "#888888"
            x: parent.width * .9
            y: parent.height * .65
            text: "100"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    Slider {
        id: control
        width: parent.width * .76
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenterOffset: parent.width * .055
        anchors.verticalCenterOffset: -parent.height * .15
        padding: 0
        value: 0.5
        handle: Rectangle {
            x: control.leftPadding + control.visualPosition * control.availableWidth - width / 2
            y: control.topPadding + control.availableHeight / 2 - height / 2
            implicitWidth: 16
            implicitHeight: 16
            radius: 8
            Image {
                anchors.centerIn: parent
                source: "../../../Assets/Sliders/SilverThumb/Handle.png"
            }

        }
        background: Rectangle {
            x: control.leftPadding
            y: control.topPadding + control.availableHeight / 2 - height / 2
            implicitWidth: 200
            implicitHeight: 6
            width: parent.width
            height: implicitHeight
            radius: 3
            color: "#282A2D"
            border.width : 0
            Rectangle {
                width: control.visualPosition * parent.width
                height: parent.height
                color: "#2A92D2"
                radius: 2.5
            }
        }
    }
}

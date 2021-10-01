import QtQuick 2.6
import QtQuick.Controls 2.1

Dial {
    id: control
    background: Rectangle {
        id: dialbackground
        x: control.width / 2 - width / 2
        y: control.height / 2 - height / 2
        width: Math.max(64, Math.min(control.width, control.height))
        height: width
        color: "transparent"
        border.color: "#7D799A"
        border.width: width * .1
        Rectangle {
            width: parent.width * .7
            height: width
            x: parent.width / 2 - width / 2
            y: parent.height / 2 - height / 2
            border.color: "#7D799A"
            border.width: 1
            color: "transparent"
            radius: width / 2
        }

        radius: width / 2
    }

    handle: Rectangle {
        id: handleItem
        x: control.background.x + control.background.width / 2 - width / 2
        y: control.background.y + control.background.height / 2 - height / 2

        color: "#7D799A"
        Image {
            width: sourceSize.width
            height: sourceSize.height
            x: -width / 2
            y: 0
            source: "../../../Assets/Dials/FlatDial/Handle.png"
        }

        transform: [
            Translate {
                y: -Math.min(dialbackground.width * .7, dialbackground.height *.7) * 0.45 + handleItem.height / 2
            },
            Rotation {
                angle: control.angle
                origin.x: handleItem.width / 2
                origin.y: handleItem.height / 2
            }
        ]
    }
}

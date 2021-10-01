import QtQuick 2.6
import QtQuick.Controls 2.1

Dial {
    id: control
    background: Rectangle {
        x: control.width / 2 - width / 2
        y: control.height / 2 - height / 2
        width: Math.max(64, Math.min(control.width, control.height))
        height: width
        radius: width / 2

        Rectangle {
            id: root
            width: size
            height: size
            x: control.width / 2 - width / 2
            y: control.height / 2 - height / 2
            Image {
                id: backgroundimage
                x: control.width / 2 - width / 2
                y: control.height / 2 - height / 2
                height: parent.height - parent.border.width * 2 - 30
                width: parent.width - parent.border.width * 2 - 30
                source: "../../../Assets/Dials/GreyKnob/Background.png"
            }
            property int size: parent.width            // The size of the circle in pixel
            property real arcBegin: -140            // start arc angle in degree
            property real arcMid: angle            // end arc angle in degree
            property real arcEnd: 140            // end arc angle in degree
            property real arcOffset: 0           // rotation
            property bool isPie: false           // paint a pie instead of an arc
            property bool showBackground: false  // a full circle as a background of the arc
            property real lineWidth: parent.width * .04          // width of the line
            property string colorCircle: "#B2EFAA"
            property string colorRest: "#A8A8A8"
            property string colorBackground: "#779933"

            property alias beginAnimation: animationArcBegin.enabled
            property alias midAnimation: animationArcMid.enabled
            property alias endAnimation: animationArcEnd.enabled

            property int animationDuration: 0

            onArcBeginChanged: canvas.requestPaint()
            onArcMidChanged: canvas.requestPaint()
            onArcEndChanged: canvas.requestPaint()

            Behavior on arcBegin {
               id: animationArcBegin
               enabled: true
               NumberAnimation {
                   duration: root.animationDuration
                   easing.type: Easing.InOutCubic
               }
            }

            Behavior on arcMid {
               id: animationArcMid
               enabled: true
               NumberAnimation {
                   duration: root.animationDuration
                   easing.type: Easing.InOutCubic
               }
            }

            Behavior on arcEnd {
               id: animationArcEnd
               enabled: true
               NumberAnimation {
                   duration: root.animationDuration
                   easing.type: Easing.InOutCubic
               }
            }

            Canvas {
                id: canvas
                anchors.fill: parent
                rotation: -90 + parent.arcOffset

                onPaint: {
                    var radius = width
                    var ctx = getContext("2d")
                    var x = width / 2
                    var y = height / 2
                    var start = Math.PI * (parent.arcBegin / 180)
                    var mid = Math.PI * (parent.arcMid / 180)
                    var end = Math.PI * (parent.arcEnd / 180)
                    ctx.reset()

                    if (root.isPie) {
                        if (root.showBackground) {
                            ctx.beginPath()
                            ctx.fillStyle = root.colorBackground
                            ctx.moveTo(x, y)
                            ctx.arc(x, y, radius / 2, 0, Math.PI * 2, false)
                            ctx.lineTo(x, y)
                            ctx.fill()
                        }
                        ctx.beginPath()
                        ctx.fillStyle = root.colorCircle
                        ctx.moveTo(x, y)
                        ctx.arc(x, y, radius / 2, start, mid, false)
                        ctx.lineTo(x, y)
                        ctx.fill()
                        ctx.beginPath()
                        ctx.fillStyle = root.colorRest
                        ctx.arc(x, y, radius / 2, mid, end, false)
                        ctx.lineTo(x, y)
                        ctx.fill()
                    } else {
                        if (root.showBackground) {
                            ctx.beginPath();
                            ctx.arc(x, y, (radius / 2) - parent.lineWidth / 2, 0, Math.PI * 2, false)
                            ctx.lineWidth = root.lineWidth
                            ctx.strokeStyle = root.colorBackground
                            ctx.stroke()
                        }
                        ctx.beginPath();
                        ctx.arc(x, y, (radius / 2) - parent.lineWidth / 2, start, mid, false)
                        ctx.lineWidth = root.lineWidth
                        ctx.strokeStyle = root.colorCircle
                        ctx.stroke()
                        ctx.beginPath();
                        ctx.arc(x, y, (radius / 2) - parent.lineWidth / 2, mid, end, false)
                        ctx.lineWidth = root.lineWidth
                        ctx.strokeStyle = root.colorRest
                        ctx.stroke()
                    }
                }
            }
        }
    }

    handle: Rectangle {
        id: handleItem
        x: control.background.x + control.background.width / 2 - width / 2
        y: control.background.y + control.background.height / 2 - height / 2
        width: 4
        height: width
        color: "#ACEBA5"
        radius: width / 2
        Image {
            width: 26
            height: width
            x: -width / 2
            y: 10
            source: "../../../Assets/Dials/GreyKnob/Handle.png"
        }

        transform: [
            Translate {
                y: -Math.min(backgroundimage.width, backgroundimage.height) * 0.4 + handleItem.height / 2
            },
            Rotation {
                angle: control.angle
                origin.x: handleItem.width / 2
                origin.y: handleItem.height / 2
            }
        ]
    }
}


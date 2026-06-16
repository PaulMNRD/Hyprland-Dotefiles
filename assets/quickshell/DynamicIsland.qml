import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts

PanelWindow {
    id: root

    anchors {
        top: true
        horizontalCenter: true
    }

    implicitWidth:  islandContainer.implicitWidth  + 32
    implicitHeight: islandContainer.implicitHeight + 16

    WlrLayerShell.layer:     WlrLayer.Overlay
    WlrLayerShell.keyboardFocus: WlrKeyboardFocus.None
    color:                   "transparent"
    exclusiveZone:           0

    // ── Horloge ────────────────────────────────────────
    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }

    // ── Île principale ───────────────────────────────────────────────────
    Rectangle {
        id: islandContainer
        anchors.centerIn: parent

        implicitWidth:  timeRow.implicitWidth  + 40
        implicitHeight: timeRow.implicitHeight + 20

        radius:          999
        color:           "#0d0d0d"

        layer.enabled: true
        layer.effect: MultiEffect {
            shadowEnabled:  true
            shadowColor:    "#80000000"
            shadowBlur:     0.6
            shadowHorizontalOffset: 0
            shadowVerticalOffset:   4
        }

        // ── Contenu ──────────────────────────────────────────────────────
        RowLayout {
            id: timeRow
            anchors.centerIn: parent
            spacing: 6

            Text {
                id: hoursMinutes
                text: Qt.formatTime(clock.now, "HH:mm")
                font {
                    family:      "Inter"
                    pixelSize:   22
                    weight:      Font.Medium
                    letterSpacing: -0.5
                }
                color: "#ffffff"
            }

            Rectangle {
                width:  1
                height: 14
                color:  "#ffffff"
                opacity: 0.2
                Layout.alignment: Qt.AlignVCenter
            }

            Text {
                id: seconds
                text: Qt.formatTime(clock.now, "ss")
                font {
                    family:    "Inter"
                    pixelSize: 14
                    weight:    Font.Light
                }
                color:   "#ffffff"
                opacity: 0.55
                Layout.alignment: Qt.AlignVCenter
            }
        }
    }
}
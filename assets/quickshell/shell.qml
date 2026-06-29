import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Effects

ShellRoot {
    PanelWindow {
        property string fontFamily: "JetBrainsMono Nerd Font"

        id: root

        anchors.top: true
        implicitHeight: islandContainer.implicitHeight + 4
        implicitWidth: islandContainer.implicitWidth + 10

        WlrLayershell.layer: WlrLayer.Overlay
        WlrLayershell.keyboardFocus: WlrKeyboardFocus.None
        WlrLayershell.margins.top: 10
        color: "transparent"
        
        SystemClock {
            id: clock
            precision: SystemClock.Minutes
        }

        Rectangle {
            id: islandContainer
            anchors.centerIn: parent

            implicitWidth: timeText.implicitWidth + 60
            implicitHeight: timeText.implicitHeight + 15

            radius: 999
            color: "#1e1e2e"

            Text {
                anchors.centerIn: parent
                id: timeText
                text: Qt.formatDateTime(clock.date, "hh:mm")
                color: "#cdd6f4"
                font {
                    family: root.fontFamily
                    weight: Font.Medium
                    pixelSize: 15
                }
            }       
        }

        MultiEffect {
            source: islandContainer
            anchors.fill: islandContainer
            shadowEnabled: true
            shadowColor: "#000000"
            shadowOpacity: 0.8
            shadowBlur: 0.2
            shadowHorizontalOffset: 1
            shadowVerticalOffset: 2
        }
    }
}

import Quickshell
import Quickshell.Wayland
import QtQuick

ShellRoot {
    PanelWindow {
        id: root

        anchors.top: true
        implicitHeight: islandContainer.implicitHeight
        implicitWidth: islandContainer.implicitWidth

        WlrLayershell.layer: WlrLayer.Overlay
        WlrLayershell.keyboardFocus: WlrKeyboardFocus.None
        color: "transparent"
        
        SystemClock {
            id: clock
            precision: SystemClock.Minutes
        }

        Rectangle {
            id: islandContainer
            anchors.centerIn: parent

            implicitWidth: timeText.implicitWidth + 40
            implicitHeight: timeText.implicitHeight + 20

            radius: 999
            color: "#1e1e2e"

            Text {
                anchors.centerIn: parent
                id: timeText
                text: Qt.formatDateTime(clock.date, "hh:mm")
                color: "#cdd6f4"
            }       
        }
    }
}

import QtQuick 2.0
import QtQuick.Layouts 1.1
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents

Item {
    id: root

    property int digits: plasmoid.configuration.showSeconds ? 6 : 4

    Column {
        id: child
        anchors.centerIn: parent
        Repeater {
            model: 4
            Row {
                property int outerIndex: index
                Repeater {
                    model: digits
                    Cell {
                        id: cell
                        cellColor: cell.getColor(timeSrc, outerIndex, index)
                        width: root.height / 4
                        height: root.height / 4
                    }
                }
            }
        }
    }

    states: [
        State {
            name: "notVertical"
            when: plasmoid.formFactor !== PlasmaCore.Types.Vertical
            PropertyChanges {
                target: root
                Layout.fillWidth: false
                Layout.fillHeight: true
                Layout.minimumWidth: root.height / 4 * digits
                Layout.maximumWidth: Layout.minimumWidth
            }
        },
        State {
            name: "vertical"
            when: plasmoid.formFactor === PlasmaCore.Types.Vertical
            PropertyChanges {
                target: root
                Layout.fillWidth: true
                Layout.fillHeight: false
                Layout.maximumHeight: root.width / digits * 4
                Layout.minimumHeight: Layout.maximumHeight
            }
        }
    ]

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        // enabled only inside panels
        enabled: plasmoid.formFactor === PlasmaCore.Types.Vertical || plasmoid.formFactor === PlasmaCore.Types.Horizontal
        // opens PlasmaCalendar
        onClicked: plasmoid.expanded = !plasmoid.expanded
    }
}

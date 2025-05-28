import QtQuick 2.15
import QtQuick.Layouts 1.1

import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.components 3.0 as PlasmaComponents
import org.kde.kirigami 2.20 as Kirigami

MouseArea {
    id: representation

    property bool wasExpanded
    property bool forceReload: false
    
    activeFocusOnTab: true
    hoverEnabled: true

    Accessible.name: Plasmoid.title
    Accessible.role: Accessible.Button

    onPressed: wasExpanded = binaryclock.expanded
    onClicked: binaryclock.expanded = !wasExpanded

    Column {
        id: clock
        anchors.centerIn: parent
        Repeater {
            model: 4
            Row {
                property int outerIndex: index
                Repeater {
                    model: plasmoid.configuration.showSeconds ? 6 : 4
                    Cell {
                        id: cell
                        cellColor: cell.getColor(timeSrc, outerIndex, index)
                        width: representation.height / 4
                        height: representation.height / 4
                    }
                }
            }
        }
    }
}

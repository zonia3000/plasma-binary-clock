import QtQuick 2.0
import QtQuick.Layouts 1.1
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.extras 2.0 as PlasmaExtras
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.calendar 2.0 as PlasmaCalendar

Item {
    id: main

    Plasmoid.backgroundHints: "NoBackground";

    PlasmaCore.DataSource {
        id: timeSrc
        engine: "time"
        connectedSources: ["Local"]
        interval: plasmoid.configuration.showSeconds ? 1000 : 60000
    }

    Plasmoid.preferredRepresentation: Plasmoid.compactRepresentation

    Plasmoid.toolTipMainText: Qt.formatDate(timeSrc.data["Local"]["DateTime"], "dddd")
    Plasmoid.toolTipSubText: Qt.formatDate(timeSrc.data["Local"]["DateTime"], Qt.locale().dateFormat(Locale.LongFormat).replace(/(^dddd.?\s)|(,?\sdddd$)/, ""))

    Plasmoid.compactRepresentation: CompactRepresentation {}

    Plasmoid.fullRepresentation: PlasmaCalendar.MonthView {
        Layout.minimumWidth: units.gridUnit * 20
        Layout.minimumHeight: units.gridUnit * 20
        today: timeSrc.data["Local"]["DateTime"]
    }
}

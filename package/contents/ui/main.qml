import QtQuick 2.15
import QtQuick.Layouts 1.1

import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.components 3.0 as PlasmaComponents
import org.kde.plasma.plasma5support 2.0 as Plasma5Support
import org.kde.kirigami 2.20 as Kirigami

import org.kde.plasma.workspace.calendar 2.0 as PlasmaCalendar

PlasmoidItem {
    id: binaryclock

    width: Kirigami.Units.gridUnit * 30
    height: Kirigami.Units.gridUnit * 15

    Plasmoid.backgroundHints: PlasmaCore.Types.ShadowBackground | PlasmaCore.Types.ConfigurableBackground

    preferredRepresentation: compactRepresentation

    Plasma5Support.DataSource {
        id: timeSrc
        engine: "time"
        connectedSources: "Local"
        interval: plasmoid.configuration.showSeconds ? 1000 : 60000
    }

    toolTipMainText: Qt.formatDate(timeSrc.data["Local"]["DateTime"], "dddd")
    toolTipSubText: Qt.formatDate(timeSrc.data["Local"]["DateTime"], Qt.locale().dateFormat(Locale.LongFormat).replace(/(^dddd.?\s)|(,?\sdddd$)/, ""))

    compactRepresentation: CompactRepresentation {}

    fullRepresentation: PlasmaCalendar.MonthView {
        Layout.minimumWidth: Kirigami.Units.gridUnit * 22
        Layout.maximumWidth: Kirigami.Units.gridUnit * 80
        Layout.minimumHeight: Kirigami.Units.gridUnit * 22
        Layout.maximumHeight: Kirigami.Units.gridUnit * 40
        today: timeSrc.data["Local"]["DateTime"]
    }
}

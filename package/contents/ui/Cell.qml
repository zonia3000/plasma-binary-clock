import QtQuick 2.15

Item {
    id: cell
    property alias cellColor: rectangle.color

    Rectangle {
        id: rectangle
        border.color: plasmoid.configuration.borderColor
        anchors.fill: parent
        border.width: plasmoid.configuration.borderSize
        radius: plasmoid.configuration.circles ? width * 0.5 : 0
    }

    function getColor(timeSrc, outerIndex, index) {
        const decimalDigit = parseInt(Qt.formatDateTime(timeSrc.data.Local.DateTime, 'hhmmss').charAt(index))
        const binaryDigit = ('000' + decimalDigit.toString(2)).slice(-4).charAt(outerIndex)
        const activeColor = plasmoid.configuration.activeColor
        const idleColor = plasmoid.configuration.idleColor
        return binaryDigit === '0' ? idleColor : activeColor
    }
}

import QtQuick 2.0

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
      var decimalDigit = parseInt(Qt.formatDateTime(timeSrc.data.Local.DateTime, 'hhmmss').charAt(index))
      var binaryDigit = ('000' + decimalDigit.toString(2)).slice(-4).charAt(outerIndex);
      var activeColor = plasmoid.configuration.activeColor;
      var idleColor = plasmoid.configuration.idleColor;
      return binaryDigit === '0' ? idleColor : activeColor;
    }
}

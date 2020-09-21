import QtQuick 2.0
import QtQuick.Controls 2.0
import org.kde.kquickcontrols 2.0 as KQuickControls
import org.kde.kirigami 2.3 as Kirigami

Kirigami.FormLayout {
    property alias cfg_showSeconds: showSecondsCheckBox.checked
    property alias cfg_circles: circlesCheckBox.checked
    property alias cfg_activeColor: activeColorButton.color
    property alias cfg_idleColor: idleColorButton.color
    property alias cfg_borderColor: borderColorButton.color
    property alias cfg_borderSize: borderSizeTextField.text

    CheckBox {
        id: showSecondsCheckBox
        text: i18n("Show seconds")
        Kirigami.FormData.label: i18n("Accuracy:")
    }

    CheckBox {
        id: circlesCheckBox
        text: i18n("Use circles instead of boxes")
        Kirigami.FormData.label: i18n("Shape:")
    }

    KQuickControls.ColorButton {
        id: activeColorButton
        Kirigami.FormData.label: i18n("Active color:")
        dialogTitle: i18n("Select Active Color")
    }

    KQuickControls.ColorButton {
        id: idleColorButton
        Kirigami.FormData.label: i18n("Idle color:")
        dialogTitle: i18n("Select Idle Color")
    }

    KQuickControls.ColorButton {
        id: borderColorButton
        Kirigami.FormData.label: i18n("Border color:")
        dialogTitle: i18n("Select Border Color")
    }

    TextField {
        id: borderSizeTextField
        validator: IntValidator {bottom: 1; top: 5}
        Kirigami.FormData.label: i18n("Border size:")
    }
}

import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0
import QtQuick.Dialogs 1.0

import org.kde.plasma.core 2.0 as PlasmaCore

Column {
    id: appearancePage
    
    // properties
    property alias cfg_show_day: showDay.checked
    property alias cfg_show_date: showDate.checked
    property alias cfg_show_time: showTime.checked
    property alias cfg_day_font_size: dayFontSize.value
    property alias cfg_date_font_size: dateFontSize.value
    property alias cfg_time_font_size: timeFontSize.value
    property alias cfg_day_letter_spacing: dayLetterSpacing.value
    property alias cfg_day_font_color: dayFontColor.color
    property alias cfg_date_letter_spacing: dateLetterSpacing.value
    property alias cfg_time_letter_spacing: timeLetterSpacing.value
    property alias cfg_time_font_color: timeFontColor.color
    property alias cfg_use_24_hour_format: use24HourFormat.checked
    property alias cfg_time_character: timeCharacter.text
    property alias cfg_date_format: dateFormat.text
    property alias cfg_date_font_color: dateFontColor.color
    //Fonts
    property string cfg_fontFamilyDay
    property string cfg_fontFamilyDate
    property string cfg_fontFamilyTime


    //Font Dropbox handler
    onCfg_fontFamilyDayChanged: {
        // HACK by the time we populate our model and/or the ComboBox is finished the value is still undefined
        if (cfg_fontFamilyDay) {
            for (var i = 0, j = fontsModel.count; i < j; ++i) {
                if (fontsModel.get(i).value == cfg_fontFamilyDay) {
                    fontFamilyComboBox.currentIndex = i
                    break
                }
            }
        }
    }
    onCfg_fontFamilyDateChanged: {
        // HACK by the time we populate our model and/or the ComboBox is finished the value is still undefined
        if (cfg_fontFamilyDate) {
            for (var i = 0, j = fontsModel.count; i < j; ++i) {
                if (fontsModel.get(i).value == cfg_fontFamilyDate) {
                    fontFamilyComboBox.currentIndex = i
                    break
                }
            }
        }
    }
    onCfg_fontFamilyTimeChanged: {
        // HACK by the time we populate our model and/or the ComboBox is finished the value is still undefined
        if (cfg_fontFamilyTime) {
            for (var i = 0, j = fontsModel.count; i < j; ++i) {
                if (fontsModel.get(i).value == cfg_fontFamilyTime) {
                    fontFamilyComboBox.currentIndex = i
                    break
                }
            }
        }
    }

    //Font ListModel
    ListModel {
        id: fontsModel
        Component.onCompleted: {
            var arr = [] // use temp array to avoid constant binding stuff
            arr.push({text: i18nc("Use default font", "Default"), value: ""})

            var fonts = Qt.fontFamilies()
            var foundIndex = 0
            for (var i = 0, j = fonts.length; i < j; ++i) {
                arr.push({text: fonts[i], value: fonts[i]})
            }
            append(arr)
        }
    }


    // size
    spacing: 5 
    
    ColumnLayout {
        anchors.left: parent.left

        //DAY
        Title {
            title: i18n("Day")
        }
        RowLayout {
            Label {
                text: i18n("Show Day")
            }
            CheckBox {
                id: showDay
            }
        }
        NumberField {
            id: dayFontSize
            label: i18n("Font Size")
        }
        NumberField {
            id: dayLetterSpacing
            label: i18n("Letter Spacing")
        }
        RowLayout {
            Label {
                text: i18n("Font style:")
            }
            ComboBox {
                id: fontFamilyDayComboBox
                Layout.fillWidth: true
                Layout.minimumWidth: units.gridUnit * 10
                model: fontsModel
                textRole: "text"

                onCurrentIndexChanged: {
                    var current = model.get(currentIndex)
                    if (current) {
                        cfg_fontFamilyDay = current.value
                        appearancePage.configurationChanged()
                    }
                }
            }
        }
        ColorDial {
            id: dayFontColor 
            color: cfg_day_font_color
        }

        //DATE
        Title {
            title: i18n("Date")
        }
        RowLayout {
            Label {
                text: i18n("Show Date")
            }
            CheckBox {
                id: showDate
            }
        }
        NumberField {
            id: dateFontSize
            label: i18n("Font Size")
        }
        NumberField {
            id: dateLetterSpacing
            label: i18n("Letter Spacing")
        }
        RowLayout {
            Label {
                text: i18n("Date format")
            }
            TextField {
                id: dateFormat
            }
        }
        RowLayout {
            Label {
                text: i18n("Font style:")
            }
            ComboBox {
                id: fontFamilyDateComboBox
                Layout.fillWidth: true
                Layout.minimumWidth: units.gridUnit * 10
                model: fontsModel
                textRole: "text"

                onCurrentIndexChanged: {
                    var current = model.get(currentIndex)
                    if (current) {
                        cfg_fontFamilyDate = current.value
                        appearancePage.configurationChanged()
                    }
                }
            }
        }
        ColorDial {
            id: dateFontColor
            color: cfg_date_font_color
        }

        //TIME
        Title {
            title: i18n("Time")
        }
        RowLayout {
            Label {
                text: i18n("Show Time")
            }
            CheckBox {
                id: showTime
            }
        }
        NumberField {
            id: timeFontSize
            label: i18n("Font Size")
        }
        NumberField {
            id: timeLetterSpacing
            label: i18n("Letter Spacing")
        }
        RowLayout {
            Label {
                text: i18n("Use 24 hour format")
            }
            CheckBox {
                id: use24HourFormat
            }
        }
        RowLayout {
            Label {
                text: i18n("Style Character")
            }
            TextField {
                id: timeCharacter
                maximumLength: 1
            }
        }
        RowLayout {
            Label {
                text: i18n("Font style:")
            }
            ComboBox {
                id: fontFamilyTimeComboBox
                Layout.fillWidth: true
                Layout.minimumWidth: units.gridUnit * 10
                model: fontsModel
                textRole: "text"

                onCurrentIndexChanged: {
                    var current = model.get(currentIndex)
                    if (current) {
                        cfg_fontFamilyTime = current.value
                        appearancePage.configurationChanged()
                    }
                }
            }
        }
        ColorDial {
            id: timeFontColor
            color: cfg_time_font_color
        }
    }

    
    
}

import QtQuick          2.3
import QtQuick.Controls 1.2
import QtQuick.Layouts  1.2
import QtGraphicalEffects 1.0

import QGroundControl.ScreenTools   1.0
import QGroundControl.Palette       1.0

FocusScope {
    id:             _root
    anchors.left:   parent.left
    anchors.right:  parent.right
    height:         column.height

    property alias          text:           label.text
    property bool           checked:        true
    property bool           showSpacer:     true
    property ExclusiveGroup exclusiveGroup: null

    property real   _sectionSpacer: ScreenTools.defaultFontPixelWidth / 2  // spacing between section headings

    onExclusiveGroupChanged: {
        if (exclusiveGroup)
            exclusiveGroup.bindCheckable(_root)
    }

    QGCPalette { id: qgcPal; colorGroupEnabled: true }

    QGCMouseArea {
        anchors.fill: parent

        onClicked: {
            _root.focus = true
            checked = !checked
        }

        ColumnLayout {
            id:             column
            anchors.left:   parent.left
            anchors.right:  parent.right

            Item {
                height:     _sectionSpacer
                width:      1
                visible:    showSpacer
            }

            QGCLabel {
                id:             label
                anchors.left:   parent.left
                anchors.right:  parent.right

                QGCColoredImage {
                    id:                     image
                    width:                  label.height / 2
                    height:                 width
                    anchors.right:          parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    source:                 "/qmlimages/arrow-down.png"
                    color:                  qgcPal.text
                    visible:                !_root.checked
                }
            }

            Rectangle {
                anchors.left:   parent.left
                anchors.right:  parent.right
                height:         1
                color:          qgcPal.text
            }
        }
    }
}

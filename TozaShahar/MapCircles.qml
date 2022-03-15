import QtQuick 2.9
import QtQuick.Window 2.3
import QtLocation 5.9
import QtPositioning 5.8
import QtQml.Models 2.2
import QtQuick.Controls 2.12
Map {
    MapCircle {
        //id: circleTashkent

        property string textCity: toolTipId.text
        //property real lati: centerId.latitude
        //property real longi: centerId.longitude
        center {
            id: centerId
            latitude: 41.2646500;
            longitude: 69.2162700;

        }
        radius: 15000
        color: 'red'
        border.width: 3
        opacity: 0.5

        ToolTip{
            id: toolTipId
            text: "Test"
            visible: toolTipText ? ma.containsMouse : false
        }

        MouseArea {
            id: ma
            anchors.fill: parent
            hoverEnabled: true


        }
    }
}

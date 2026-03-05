import CuteKeyboard 1.0
import QtQuick 2.0

Key {
    objectName: inputPanelRef.objectName + "Key_Shift"
    btnKey: Qt.Key_Shift
    functionKey: true
    showPreview: false

    btnIcon: InputEngine.shiftMode === 2 ? InputPanel.shiftLockIcon :
             InputEngine.shiftMode === 1 ? InputPanel.shiftOnIcon :
                               InputPanel.shiftOffIcon

    onClicked: {
        // console.log("Shift key clicked");

            // First tap → immediately enter one-shot mode
            if (InputEngine.shiftMode === 0){
                InputEngine.uppercase = true;
                InputEngine.shiftMode = 1;
            } else if (InputEngine.shiftMode === 1) {
                InputEngine.uppercase = true;
                InputEngine.shiftMode = 2;
            } else {
                InputEngine.uppercase = false;
                InputEngine.shiftMode = 0;
            }
        }

    // Optional: reset one-shot shift after key input
    Connections {
        target: InputEngine
        function onKeyCommitted() {
            // console.log("Key committed");
            if (InputEngine.shiftMode === 1) {
                InputEngine.shiftMode = 0;
                InputEngine.uppercase = false;
            }
        }
    }
}

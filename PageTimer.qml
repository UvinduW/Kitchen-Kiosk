import QtQuick 2.4

PageTimerForm {
    property int timerNum: 3
    btnAdd.onClicked: {
        if (timerNum < 6){
            // Add more timers until we hit 6
            timerNum++;
            if (timerNum == 6)
            {
                // When we hit 6, remove the add button
                btnAdd.visible = false
            }
        }

        for (var i=0; i<6; i++)
        {
            if (i < timerNum){
                // Set visibility of all the timers numbered under timerNum to true
                timerList.children[i].visible = true
            }
            else{
                // All other timers should be hidden
                timerList.children[i].visible = false
            }
        }
    }
}

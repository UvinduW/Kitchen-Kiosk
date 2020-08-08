import QtQuick 2.4

PageTimerForm {
    property int timerNum: 0
//    property int visibleCount: 0

    Component.onCompleted: {timerScaleUpdate()}

    function getNumberVisible(){
        timerNum = 0
        for (var i=0; i<6; i++)
        {
            if (timerList.children[i].visible){
                timerNum++
            }
        }
    }

    function timerScaleUpdate(){
        btnAdd.visible = true
        getNumberVisible()
        for (var i=0; i<6; i++)
        {
            timerList.children[i].scaleFactor = timerNum
        }
    }

    timer1.onHideTimer: {
        timerScaleUpdate()
    }

    timer2.onHideTimer: {
        timerScaleUpdate()
    }

    timer3.onHideTimer: {
        timerScaleUpdate()
    }

    timer4.onHideTimer: {
        timerScaleUpdate()
    }

    timer5.onHideTimer: {
        timerScaleUpdate()
    }

    timer6.onHideTimer: {
        timerScaleUpdate()
    }


    btnAdd.onClicked: {

        var visibilitySet = 0

        getNumberVisible()
        timerNum++;
        if (timerNum > 5)
        {
            // When we hit 6, remove the add button
            btnAdd.visible = false
        }

        for (var i=0; i<6; i++)
        {
            timerList.children[i].scaleFactor = timerNum
            if (!timerList.children[i].visible){
                if (!visibilitySet)
                {
                    timerList.children[i].visible = true
                    visibilitySet = 1
                }
            }
        }



    }
}

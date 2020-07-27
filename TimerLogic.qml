import QtQuick 2.0

TimerElement {
    property int timeLeft: 10   // Time left in seconds
    property bool paused: false

    // JavaScript Functions

    function updateText()
    {
        // Converts timeLeft variable to hh:mm:ss and displays it on the label
        var date = new Date(null)   // Date object for conversion
        date.setSeconds(timeLeft);
        txtTime.text = date.toISOString().substr(11, 8);
    }

    function startTimer()
    {
        // Gets the time values from the tumblers and starts the timer
        timeLeft = tmbSecond.currentIndex + tmbMinute.currentIndex*60 + tmbHour.currentIndex*60*60;
        updateText();
        countdown.running = true
        paused = false
        pauseIconPath = "assets/timer/pause.svg"
        btnStart.visible = false
        btnPause.visible = true
        txtTime.visible = true
    }

    // QML Objects

    Timer{
        id: countdown
        interval: 1000
        running: false
        repeat: true
        onTriggered:{
            timeLeft--;
            if (timeLeft < 1){
                btnPause.clicked()
                timeLeft = 0
                updateText()
                running = false
            }

            updateText();
        }
    }

    //

    btnStart.onClicked: {
        startTimer()
    }

    btnPause.onClicked: {
        paused = !paused;
        countdown.running = !paused

        if (paused){
            pauseIconPath = "assets/timer/play.svg"
        }
        else{
            pauseIconPath = "assets/timer/pause.svg"
        }
    }

    btnRestart.onClicked: {
        startTimer()
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

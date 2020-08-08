import QtQuick 2.0

TimerElement {
    property double timeLeft: 10   // Time left in seconds
    property bool paused: false
    property bool overtime: false
    property int timeStep: 20   // How frequently to update the timer
    property int scaleFactor: 3
    property bool hideSequence: false

    signal hideTimer

    // ----- JavaScript Functions ----- \\

    Component.onCompleted: {
        changeTimerHeight()
    }
    onVisibleChanged: {
        changeTimerHeight()
    }

    function changeTimerHeight(){
        // Changes timer heights so that when visibility is turned on, they "jump" onto the screen
        if (visible){
            timerMargins = 0
        }
        else{
            timerMargins = 400
        }
    }

    function scaleGraphic(factor){
            switch (factor){
            case 1:
                return 2
            case 2:
                return 2
            case 3:
                return 2
            case 4:
                return 2
            case 5:
                return 3
            case 6:
                return 3
            }

    }

    function updateText()
    {
        // Converts timeLeft variable to hh:mm:ss and displays it on the label
        var date = new Date(null)   // Date object for conversion


        // Set displayed time. Add a negative sign if we're overtime
        if (overtime){
            date.setSeconds(timeLeft);  // Show 1 second more than current time so that the timer appears to stop on zero
            txtTime.text = "-" + date.toISOString().substr(11, 8);
            radTime.minValue = 0
            radTime.maxValue = 100
            radTime.value = 20
            radTime.progressColor = "red"
            finishChaser.running = true
        }
        else{
            date.setSeconds(timeLeft + 1);  // Show 1 second more than current time so that the timer appears to stop on zero
            txtTime.text = date.toISOString().substr(11, 8);
            // Also update the graphicContainerHeight
            radTime.value = timeLeft
        }


    }

    function startTimer()
    {
        // Gets the time values from the tumblers and starts the timer
        timeLeft = tmbSecond.currentIndex + tmbMinute.currentIndex*60 + tmbHour.currentIndex*60*60;
        radTime.maxValue = timeLeft
        overtime = false
        // Show the new countdown time on the label
        updateText();
        paused = false
        // Change the pause button's icon to pause symbol
        pauseIconPath = "assets/timer/pause.svg"

        // Hide start button and show text and pause button
        btnStart.visible = false
        btnPause.visible = true
        txtTime.visible = true

        // Adjust the graphic's height
        graphicContainerHeight = parent.height/scaleGraphic(scaleFactor)
        // Reset colours and animation
        resetAnimations()

        // Start the countdown timer
        countdown.running = true
    }

    function resetAnimations(){
        finishChaser.running = false
        radTime.startAngle = 180
        radTime.progressColor = "#00ffc1"
        radTime.value = radTime.maxValue    // Show bar as full
    }

    function stopTimer()
    {
        // If we were finished then reset everything and display the start button
        timeLeft = 0
        btnStart.visible = true
        btnPause.visible = false
        txtTime.visible = false
        overtime = false
        countdown.running = false
        graphicContainerHeight = parent.height/5
        resetAnimations()

    }

    // ----- QML Objects -----\\

    Timer{
        id: countdown
        interval: timeStep
        running: false
        repeat: true
        onTriggered:{
            if (!overtime){
                // Decerement the time if we haven't gone overtime yet
                timeLeft -= timeStep/1000;
            }
            if (timeLeft < 0){
                // We're now overtime. The original timer is finished
                overtime = true
                // Change icon to display a tick to finish the timer
                pauseIconPath = "assets/timer/tick.svg"
                // Increment the timer to set it back to zero
                timeLeft += timeStep/1000
            }
            if (overtime){
                // If we're overtime, then start incrementing the timer to show how long overtime we are
                timeLeft += timeStep/1000
            }

            // Update the displayed text showing the time left (or overtime)
            updateText();
        }
    }

    // ----- QML Animators -----\\

    // When the circular graphic size changes, animate that change
    Behavior on graphicContainerHeight {
        NumberAnimation{
            duration: 500
            easing {type: Easing.OutBack; overshoot: 5}
        }
    }

    Behavior on timerMargins {
        NumberAnimation{
            duration: 500
            easing {type: Easing.OutBack; overshoot: 5}
        }
    }

//    Behavior on width {
//        NumberAnimation{
//            duration: 500
//            easing {type: Easing.OutBack; overshoot: 5}
//        }
//    }

    PropertyAnimation{
        id: finishChaser
        target: radTime
        property: "startAngle"
        from: 0
        to: 360
        duration: 500
        running: false
        loops: Animation.Infinite
    }

    // ----- QML Signal Handlers -----\\


    onTimerMarginsChanged: {
        if (hideSequence && timerMargins == 1000){
            visible = false
            hideTimer()
        }
    }

    onScaleFactorChanged: {
        if (countdown.running){
            graphicContainerHeight = parent.height/scaleGraphic(scaleFactor)
        }
    }

    btnHide.onClicked: {
        if (countdown.running)
        {
            // If the timer is running, then stop
            stopTimer()
        }
        else
        {
            // Hide this timer when the X button is pressed if the timer isn't running
            hideSequence = true
            timerMargins = 1000

//            visible = false
//            hideTimer()
        }
    }

    btnStart.onClicked: {
        // Get the required time and start timer
        startTimer()
    }

    btnPause.onClicked: {
        // Toggle between paused and unpaused states
        paused = !paused;
        countdown.running = !paused


        if (overtime){
            stopTimer()
        }
        else if (paused){
            // If we're currently paused then show the play/resume symbol on the button
            pauseIconPath = "assets/timer/play.svg"
        }

        else{
            // If we're currently running then show the pause symbol on the button
            pauseIconPath = "assets/timer/pause.svg"
        }
    }

    btnRestart.onClicked: {
        overtime = false
        startTimer()
    }

    btnStop.onClicked: {
        stopTimer()
    }

//    txtName.Keys.onReturnPressed: backgroundMouse.forceActiveFocus()
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

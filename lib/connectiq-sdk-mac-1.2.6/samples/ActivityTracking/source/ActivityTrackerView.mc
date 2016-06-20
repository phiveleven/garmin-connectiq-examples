//!
//! Copyright 2015 by Garmin Ltd. or its subsidiaries.
//! Subject to Garmin SDK License Agreement and Wearables
//! Application Developer Agreement.
//!

using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.ActivityMonitor as Act;
using Toybox.Time as Time;
using Toybox.Timer as Timer;

class ActivityWidget extends Ui.View
{

    var timer;

    //! Constructor
    function initialize()
    {
        // Set up a 1Hz update timer because we aren't registering
        // for any data callbacks that can kick our display update.
        timer = new Timer.Timer();
        timer.start( method(:onTimer), 1000, true );
    }

    //! Handle the update event
    function onUpdate(dc)
    {
        var activityInfo;
        var clockTime = Sys.getClockTime();
        var ToD = ( ( clockTime.hour * 60 ) + clockTime.min ) * 60 + clockTime.sec;
        var daySeconds;
        var stepsFromGoal;
        var goalPace;
        var progress;
        var goalProgress;
        var string;

        // Get wake and sleep time from user profile
        ToD -= ( 6 * 60 * 60 ); // Assume 6am Start of day.
        daySeconds = 57600; //16 * 60 * 60 assume 16 hour day

        dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_BLACK);
        dc.clear();

        activityInfo = Act.getInfo();
        //prevent divide by 0 if stepGoal is 0
        if( activityInfo.stepGoal == 0 )
        {
            activityInfo.stepGoal = 5000;
        }

        //Draw progress bar outline
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
        dc.drawRectangle(14, 3, 176, 12);
        dc.drawRectangle(15, 4, 174, 10);
        dc.drawRectangle(16, 5, 172, 8);

        //Compute goal
        if( ToD < daySeconds )
        {
            goalPace = (activityInfo.stepGoal * ToD / daySeconds);
            goalProgress = goalPace * 170 / activityInfo.stepGoal;
        }
        else
        {
            goalPace = activityInfo.stepGoal;
            goalProgress = 170;
        }
        stepsFromGoal = goalPace - activityInfo.steps;
        if( goalProgress == 0 )
        {
            goalProgress = 1;
        }

        //Compute progress
        if( activityInfo.steps < activityInfo.stepGoal )
        {
            progress = activityInfo.steps * 170 / activityInfo.stepGoal;
        }
        else
        {
            progress = 170;
        }

        //Draw progress
        if( stepsFromGoal > 0 )
        {
            dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_RED);
        }
        else
        {
            dc.setColor(Gfx.COLOR_GREEN, Gfx.COLOR_GREEN);
        }

        dc.fillRectangle(15 + goalProgress, 3, 3, 12);
        dc.fillRectangle(17, 6, progress, 6);

        //Set colors for drawing text
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);

        //Draw Goal Progress
        string = activityInfo.steps.toString() + " / " + activityInfo.stepGoal.toString();
        dc.drawText( dc.getWidth() / 2, 30, Gfx.FONT_SMALL, string , Gfx.TEXT_JUSTIFY_CENTER);

        //Draw step offset
        stepsFromGoal = stepsFromGoal * -1;
        dc.drawText( dc.getWidth() / 2, ( dc.getHeight() + dc.getFontHeight( Gfx.FONT_LARGE ) ) / 2, Gfx.FONT_LARGE, stepsFromGoal.toString() , Gfx.TEXT_JUSTIFY_CENTER);

        //Draw distance...
        var distMiles = activityInfo.distance.toFloat() / 160934; //convert from cm to Miles
        string = distMiles.format( "%.02f" );
        string += "mi";
        dc.drawText( 5, dc.getHeight() - 5, Gfx.FONT_SMALL, string , Gfx.TEXT_JUSTIFY_LEFT);

        //And calories
        string = activityInfo.calories.toString() + "C";
        dc.drawText( dc.getWidth() - 5, dc.getHeight() - 5, Gfx.FONT_SMALL, string , Gfx.TEXT_JUSTIFY_RIGHT);

        //Draw Move text
        if( activityInfo.moveBarLevel != Act.MOVE_BAR_LEVEL_MIN )
        {
            var i;
            string = "MOVE";
            for( i = 0 ; i < activityInfo.moveBarLevel ; i += 1 )
            {
                string += "!";
            }

            dc.drawText( dc.getWidth() / 2, dc.getHeight() - 5, Gfx.FONT_MEDIUM, string , Gfx.TEXT_JUSTIFY_CENTER);
        }
    }

    function onTimer()
    {
        //Kick the display update
        Ui.requestUpdate();
    }
}
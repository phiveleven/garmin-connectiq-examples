//!
//! Copyright 2015 by Garmin Ltd. or its subsidiaries.
//! Subject to Garmin SDK License Agreement and Wearables
//! Application Developer Agreement.
//!

using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.Timer as Timer;

class MyWatchView extends Ui.View
{
    function onUpdate(dc)
    {
        var string;

        dc.setColor( Gfx.COLOR_BLACK, Gfx.COLOR_BLACK );
        dc.clear();
        dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
        string = "Tap to test progress bar";
        dc.drawText( 10, 30, Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_LEFT );
    }

}

class InputDelegate extends Ui.InputDelegate
{
    var progressBar;
    var timer;
    var count;

    function onTap()
    {
        if( timer == null )
        {
            timer = new Timer.Timer();
        }

        progressBar = new Ui.ProgressBar( "Processing", null );
        Ui.pushView( progressBar, null, Ui.SLIDE_DOWN );
        count = 0;
        timer.start( method(:timerCallback), 1000, true );
    }

    function timerCallback()
    {
        count += 1;

        if( count > 17 )
        {
            timer.stop();
            Ui.popView( Ui.SLIDE_UP );
        }
        else if( count > 15 )
        {
            progressBar.setDisplayString( "Complete" );
        }
        else if( count > 5 )
        {
            progressBar.setProgress( (count - 5) * 10 );
        }
    }

}

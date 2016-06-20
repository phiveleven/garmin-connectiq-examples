//!
//! Copyright 2015 by Garmin Ltd. or its subsidiaries.
//! Subject to Garmin SDK License Agreement and Wearables
//! Application Developer Agreement.
//!

using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Application as App;


//! Implements a watch face with a Game Cube font
class GameCubeView extends Ui.WatchFace
{
    var font;

    //! Constructor
    function initialize()
    {
        font = Ui.loadResource(Rez.Fonts.id_gamecube_120);
    }

    //! Prepare the layout
    function onLayout()
    {
    }

    //! Handle the update event
    function onUpdate(dc)
    {
        var width;
        var screenWidth = dc.getWidth();
        var clockTime = Sys.getClockTime();
        var hour;
        var min;

        // Clear the screen
        dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_WHITE);
        dc.fillRectangle(0,0,dc.getWidth(), dc.getHeight());

        // Draw the Hour
        hour = clockTime.hour % 12;
        hour = (hour == 0) ? 12 : hour;
        hour = hour.toString();
        dc.setColor(Gfx.COLOR_BLUE, Gfx.COLOR_TRANSPARENT);
        dc.drawText(screenWidth / 2, 0, font, hour, Gfx.TEXT_JUSTIFY_CENTER);

        // Draw the minute
        min = clockTime.min.format("%02d");
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
        dc.drawText(screenWidth / 2, 45, font, min, Gfx.TEXT_JUSTIFY_CENTER);
    }

    function onShow()
    {
    }

    function onHide()
    {
    }
}

class GameCube extends App.AppBase
{
    function onStart()
    {
    }

    function onStop()
    {
    }

    function getInitialView()
    {
        return [new GameCubeView()];
    }
}

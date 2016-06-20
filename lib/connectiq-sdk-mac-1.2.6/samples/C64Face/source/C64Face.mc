//!
//! Copyright 2015 by Garmin Ltd. or its subsidiaries.
//! Subject to Garmin SDK License Agreement and Wearables
//! Application Developer Agreement.
//!

using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Math;
using Toybox.Lang as Lang;
using Toybox.Application as App;

//! This implements a watchface with a Commodore 64 READY
//! that jumps around the screen
class C64View extends Ui.WatchFace
{
    var bmp;
    var font;

    //! Load the resources required for the watch face
    function onLayout()
    {
        bmp = Ui.loadResource(Rez.Drawables.id_c64);
        font = Ui.loadResource(Rez.Fonts.id_font_c64);
    }

    function onShow()
    {
    }

    //! Update the clock face graphics during update
    function onUpdate(dc)
    {
        var start, end;
        var time = makeClockTime();
        dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_BLACK);
        dc.clear();

        var pos = calcPosition();
        dc.drawBitmap(pos[0], pos[1], bmp);

        dc.setColor(Gfx.COLOR_PURPLE, Gfx.COLOR_TRANSPARENT);
        pos = calcPosition();
        dc.drawText(pos[0],pos[1],font, "READY.", Gfx.TEXT_JUSTIFY_CENTER);

        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);
        dc.drawText(dc.getWidth()/2, (dc.getHeight()/2) , font, time, Gfx.TEXT_JUSTIFY_CENTER);
    }

    //! Get the time from the clock and format it for
    //! the watch face
    hidden function makeClockTime()
    {
        var clockTime = Sys.getClockTime();
        var hour, min, result;

        hour = clockTime.hour % 12;
        hour = (hour == 0) ? 12 : hour;
        min = clockTime.min;

        // You so money and you don't even know it
        return Lang.format("$1$:$2$",[hour, min.format("%02d")]);
    }

    //! Compute a random position for the READY
    //! to appear
    function calcPosition()
    {
        var x = 20 + (Math.rand() % 100);
        var y = 20 + (Math.rand() % 100);

        return [x, y];
    }
}

class C64Face extends App.AppBase
{
    function onStart()
    {
        return false;
    }

    function getInitialView()
    {
        return [new C64View()];
    }

    function onStop()
    {
        return false;
    }
}

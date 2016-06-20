//!
//! Copyright 2015 by Garmin Ltd. or its subsidiaries.
//! Subject to Garmin SDK License Agreement and Wearables
//! Application Developer Agreement.
//!

using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Time.Gregorian as Calendar;

var action_string;
var behavior_string;
var action_hits;
var behavior_hits;

function setActionString(new_string)
{
    action_string = new_string;
    action_hits++;

    if( action_hits > behavior_hits )
    {
        behavior_string = "NO_BEHAVIOR";
        behavior_hits = action_hits;
    }

    Ui.requestUpdate();
}

function setBehaviorString(new_string)
{
    behavior_string = new_string;
    behavior_hits++;
    Ui.requestUpdate();
}

class InputView extends Ui.View
{
    function initialize()
    {
        action_string = "NO_ACTION";
        behavior_string = "NO_BEHAVIOR";
        action_hits = 0;
        behavior_hits = 0;
    }

    function onUpdate(dc)
    {
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);
        dc.clear();

        var x = dc.getWidth() / 2;
        var y = ( dc.getHeight() / 2 ) - dc.getFontHeight(Gfx.FONT_SMALL);

        dc.drawText(x, y, Gfx.FONT_SMALL, action_string, Gfx.TEXT_JUSTIFY_CENTER);
        dc.drawText(x, y + dc.getFontHeight(Gfx.FONT_SMALL), Gfx.FONT_SMALL, behavior_string, Gfx.TEXT_JUSTIFY_CENTER);
    }
}

//!
//! Copyright 2015 by Garmin Ltd. or its subsidiaries.
//! Subject to Garmin SDK License Agreement and Wearables
//! Application Developer Agreement.
//!

using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;

class DetailsDelegate extends Ui.BehaviorDelegate
{
    function onBack()
    {
        Ui.popView(Ui.SLIDE_IMMEDIATE);
        return true;
    }
}
//!
//! Copyright 2015 by Garmin Ltd. or its subsidiaries.
//! Subject to Garmin SDK License Agreement and Wearables
//! Application Developer Agreement.
//!

using Toybox.Application as App;

//! this is the primary start point for a ConnectIQ application
class ActivityTracker extends App.AppBase
{
    function onStart()
    {
        return false;
    }

    function getInitialView()
    {
        return [new ActivityWidget()];
    }

    function onStop()
    {
        return false;
    }
}

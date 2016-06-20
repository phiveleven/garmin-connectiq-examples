//!
//! Copyright 2015 by Garmin Ltd. or its subsidiaries.
//! Subject to Garmin SDK License Agreement and Wearables
//! Application Developer Agreement.
//!

using Toybox.WatchUi as Ui;
using Toybox.Application as App;
using Toybox.System as Sys;
using Toybox.Time as Time;

class DataField extends Ui.SimpleDataField
{
    var counter;

    //! Constructor
    function initialize()
    {
        label = "HR, Dist, Time";
        counter = 0;
    }

    //! Handle the update event
    function compute(info)
    {
        var value_picked = null;

        //Cycle between Heart Rate (int), Distance (float), and elapsedTime (Duration)
        if( counter == 0 )
        {
            if( info.currentHeartRate != null )
            {
                value_picked = info.currentHeartRate;
            }
        }
        if( counter == 1 )
        {
            if( info.elapsedDistance != null )
            {
                value_picked = info.elapsedDistance * 0.000621371; //Meters to Miles
            }
        }
        if( counter == 2 )
        {
            if( info.elapsedTime != null )
            {
                //elapsedTime is in ms.
                var options = { :seconds => (info.elapsedTime / 1000) };
                value_picked = Time.Gregorian.duration( options );
            }
        }

        counter += 1;
        if( counter > 2 )
        {
            counter = 0;
        }

        return value_picked;
    }

}

//! main is the primary start point for a Monkeybrains application
class SimpleDataField extends App.AppBase
{
    function onStart()
    {
        return false;
    }

    function getInitialView()
    {
        return [new DataField()];
    }

    function onStop()
    {
        return false;
    }
}

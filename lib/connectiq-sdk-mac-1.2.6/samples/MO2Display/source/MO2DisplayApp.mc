//!
//! Copyright 2015 by Garmin Ltd. or its subsidiaries.
//! Subject to Garmin SDK License Agreement and Wearables
//! Application Developer Agreement.
//!

using Toybox.Application as App;
using Toybox.WatchUi as Ui;
using Toybox.System as Sys;

class MO2DisplayApp extends App.AppBase
{
    var mSensor;

    // onStart() is called on application start up
    function onStart()
    {
        //Create the sensor object and open it
        mSensor = new MO2Sensor();
        mSensor.open();
    }

    // onStop() is called when your application is exiting
    function onStop()
    {
        // Release the sensor
        mSensor.release();
    }

    // Return the initial view of your application here
    function getInitialView()
    {
        //The initial view is located at index 0
        var index = 0;
        return [new MainView(mSensor, index), new MO2Delegate(mSensor, index)];
    }



}

//!
//! Copyright 2015 by Garmin Ltd. or its subsidiaries.
//! Subject to Garmin SDK License Agreement and Wearables
//! Application Developer Agreement.
//!

using Toybox.Attention as Attention;
using Toybox.WatchUi as Ui;

var currentTone = null;

class InputHandler extends Ui.InputDelegate {
    var backlightOn = false;
    var toneIdx = 0;
    var toneNames = [ "Key",
                      "Start",
                      "Stop",
                      "Message",
                      "Alert Hi",
                      "Alert Lo",
                      "Loud Beep",
                      "Interval Alert",
                      "Alarm",
                      "Reset",
                      "Lap",
                      "Canary",
                      "Time Alert",
                      "Distance Alert",
                      "Failure",
                      "Success",
                      "Power",
                      "Low Battery",
                      "Error" ];


    var vibrateData = [
                        new Attention.VibeProfile(  25, 100 ),
                        new Attention.VibeProfile(  50, 100 ),
                        new Attention.VibeProfile(  75, 100 ),
                        new Attention.VibeProfile( 100, 100 ),
                        new Attention.VibeProfile(  75, 100 ),
                        new Attention.VibeProfile(  50, 100 ),
                        new Attention.VibeProfile(  25, 100 )
                      ];

    function onKey(key) {
        if( key.getKey() == Ui.KEY_MENU ) {
            currentTone = toneNames[toneIdx];
            Attention.playTone( toneIdx );
            ++toneIdx;

            if( toneIdx == toneNames.size() ) {
                toneIdx = 0;
            }
            Ui.requestUpdate();
        }
        return true;
    }

    function onTap(evt) {
        currentTone = null;
        backlightOn = !backlightOn;
        Attention.backlight( backlightOn );
        Ui.requestUpdate();
        return true;
    }

    function onHold(evt) {
        currentTone = null;
        Attention.vibrate( vibrateData );
        Ui.requestUpdate();
        return true;
    }
}

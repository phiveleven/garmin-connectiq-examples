//!
//! Copyright 2015 by Garmin Ltd. or its subsidiaries.
//! Subject to Garmin SDK License Agreement and Wearables
//! Application Developer Agreement.
//!

using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;

class AttentionView extends Ui.View     {

    //! Load your resources here
    function onLayout(dc) {
    }

    //! Restore the state of the app and prepare the view to be shown
    function onShow() {
    }

    //! Update the view
    function onUpdate(dc) {
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);
        dc.clear();
        dc.drawText(5, 20, Gfx.FONT_SMALL, "Tap screen to toggle the\nbacklight. Press Menu to play\na tone. Hold screen to vibrate.", Gfx.TEXT_JUSTIFY_LEFT);

        if(currentTone != null) {
            dc.drawText( 5, 100, Gfx.FONT_SMALL, "Tone: " + currentTone, Gfx.TEXT_JUSTIFY_LEFT );
        }

    }

    //! Called when this View is removed from the screen. Save the
    //! state of your app here.
    function onHide() {
    }

}

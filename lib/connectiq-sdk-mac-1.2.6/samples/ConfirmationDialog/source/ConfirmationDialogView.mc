//!
//! Copyright 2015 by Garmin Ltd. or its subsidiaries.
//! Subject to Garmin SDK License Agreement and Wearables
//! Application Developer Agreement.
//!

using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;

var testString = "Test the confirm";
var returnVal = "No response";


class CD extends Ui.ConfirmationDelegate {
    function onResponse(value) {
        if( value == 0 ) {
            returnVal = "Cancel/No";
        }
        else {
            returnVal = "Confirm/Yes";
        }
    }
}


class BaseInputDelegate extends Ui.BehaviorDelegate {
    var cd;

    function onMenu() {
        cd = new Ui.Confirmation( testString );
        Ui.pushView( cd, new CD(), Ui.SLIDE_IMMEDIATE );
        return true;
    }

    function onNextPage() {
    }
}

class ConfirmationDialogView extends Ui.View {

    //! Load your resources here
    function onLayout(dc) {
        onUpdate(dc);
    }


    //! Restore the state of the app and prepare the view to be shown
    function onShow() {
    }

    function onUpdate(dc) {
        dc.setColor( Gfx.COLOR_TRANSPARENT, Gfx.COLOR_BLACK );
        dc.clear();
        dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
        dc.drawText( (dc.getWidth() / 2), (dc.getHeight() / 2) - 10, Gfx.FONT_SMALL, testString, Gfx.TEXT_JUSTIFY_CENTER );
        dc.drawText( (dc.getWidth() / 2), (dc.getHeight() / 2) + 10, Gfx.FONT_SMALL, returnVal, Gfx.TEXT_JUSTIFY_CENTER);
    }


}
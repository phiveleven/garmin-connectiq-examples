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

var testValf = 1000f;
var testVali = 1;
var count = 0;
var dur = null;

class NPDf extends Ui.NumberPickerDelegate {
    function onNumberPicked(value) {
        testValf = value;
    }
}

class NPDi extends Ui.NumberPickerDelegate {
    function onNumberPicked(value) {
        testVali = value;
    }
}

class NPDd extends Ui.NumberPickerDelegate {
    function onNumberPicked(value) {
        dur = value;
    }
}

class BaseInputDelegate extends Ui.BehaviorDelegate
{
    var np;
    var npi;

    function onMenu() {
        var value;
        if( count == 0 ) {
            np = new Ui.NumberPicker( Ui.NUMBER_PICKER_DISTANCE, testValf );
            Ui.pushView( np, new NPDf(), Ui.SLIDE_IMMEDIATE );
            count = count + 1;
        }
        else if( count == 1 ) {
            // intentionally larger than max
            value = Calendar.duration( {:hours=>9, :minutes=>8, :seconds=>10} );
            np = new Ui.NumberPicker( Ui.NUMBER_PICKER_TIME, value );
            Ui.pushView( np, new NPDd(), Ui.SLIDE_IMMEDIATE );
            count = count + 1;
        }
        else if( count == 2 ) {
            value = Calendar.duration( {:hours=>1, :minutes=>8, :seconds=>10} );
            np = new Ui.NumberPicker( Ui.NUMBER_PICKER_TIME_MIN_SEC, value );
            Ui.pushView( np, new NPDd(), Ui.SLIDE_IMMEDIATE );
            count = count + 1;
        }
        else if( count == 3 ) {
            value = Calendar.duration( {:hours=>23, :minutes=>8, :seconds=>10} );
            np = new Ui.NumberPicker( Ui.NUMBER_PICKER_TIME_OF_DAY, value );
            Ui.pushView( np, new NPDd(), Ui.SLIDE_IMMEDIATE );
            count = count + 1;
        }
        else if( count == 4 ) {
            value = 454;
            np = new Ui.NumberPicker( Ui.NUMBER_PICKER_WEIGHT, value );
            Ui.pushView( np, new NPDf(), Ui.SLIDE_IMMEDIATE );
            count = count + 1;
        }
        else if( count == 5 ) {
            value = 2;
            np = new Ui.NumberPicker( Ui.NUMBER_PICKER_HEIGHT, value );
            Ui.pushView( np, new NPDf(), Ui.SLIDE_IMMEDIATE );
            count = count + 1;
        }
        else if( count == 6 ) {
            value = 200;
            np = new Ui.NumberPicker( Ui.NUMBER_PICKER_CALORIES, value );
            Ui.pushView( np, new NPDi(), Ui.SLIDE_IMMEDIATE );
            count = count + 1;
        }
        else if( count == 7 ) {
            value = 1980;
            np = new Ui.NumberPicker( Ui.NUMBER_PICKER_BIRTH_YEAR, value );
            Ui.pushView( np, new NPDi(), Ui.SLIDE_IMMEDIATE );
            count = 0;
        }
        return true;
    }

    function onNextPage() {
    }
}

class NumberPickerView extends Ui.View {

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

        dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) - 30), Gfx.FONT_SMALL, "Press Menu", Gfx.TEXT_JUSTIFY_CENTER);
        dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) - 10), Gfx.FONT_SMALL, testValf.toString(), Gfx.TEXT_JUSTIFY_CENTER);
        dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) + 10), Gfx.FONT_SMALL, testVali.toString(), Gfx.TEXT_JUSTIFY_CENTER);
        if( dur != null )
        {
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) + 30), Gfx.FONT_SMALL, dur.value().toString(), Gfx.TEXT_JUSTIFY_CENTER);
        }
    }
}

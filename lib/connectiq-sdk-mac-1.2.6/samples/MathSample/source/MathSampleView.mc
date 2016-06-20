//!
//! Copyright 2015 by Garmin Ltd. or its subsidiaries.
//! Subject to Garmin SDK License Agreement and Wearables
//! Application Developer Agreement.
//!

using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Math as Math;

var c = 0;

enum
{
    SIN = 1,
    COS,
    TAN,
    ASIN,
    ACOS,
    ATAN,
    LOG,
    POW,
    SQRT
}

class MathInputDelegate extends Ui.BehaviorDelegate {
    function onMenu() {

        if( c == SQRT )
        {
            c = SIN;
        }
        else
        {
            c = c + 1;
        }
        Ui.requestUpdate();
        return true;
    }

    function onNextPage() {
    }
}

class MathSampleView extends Ui.View {

    //! Load your resources here
    function onLayout(dc) {
    onUpdate( dc );
    }

    //! Restore the state of the app and prepare the view to be shown
    function onShow() {
    }

    //! Update the view
    function onUpdate(dc) {
        var string;
        var valr;

        dc.setColor( Gfx.COLOR_TRANSPARENT, Gfx.COLOR_BLACK );
        dc.clear();
        dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );

        if( c == SIN ) {
            var d8 = 1234567.123d;
            var f8 = 1234567.123;

            string = "sin( " + d8.format("%.7f") + "d ) =";
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) - 30), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);
            valr = Math.sin( d8 );
            string = "    " + valr.format( "%.9f" );
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) - 10), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);

            string = "sin( " + f8.format("%.7f") + "f ) =";
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) + 10), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);
            valr = Math.sin( f8 );
            string = "    " + valr.format( "%.9f" );
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) + 30), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);
        }
        else if( c == COS ) {
            var d8 = 1234567.123d;
            var f8 = 1234567.123;

            string = "cos( " + d8.format("%.7f") + "d ) =";
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) - 30), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);
            valr = Math.cos( d8 );
            string = "    " + valr.format( "%.9f" );
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) - 10), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);

            string = "cos( " + f8.format("%.7f") + "f ) =";
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) + 10), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);
            valr = Math.cos( f8 );
            string = "    " + valr.format( "%.9f" );
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) + 30), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);
        }
        else if( c == TAN ) {
            var d8 = 1234567.123d;
            var f8 = 1234567.123;

            string = "tan( " + d8.format("%.7f") + "d ) =";
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) - 30), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);
            valr = Math.tan( d8 );
            string = "    " + valr.format( "%.9f" );
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) - 10), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);

            string = "tan( " + f8.format("%.7f") + "f ) =";
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) + 10), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);
            valr = Math.tan( f8 );
            string = "    " + valr.format( "%.9f" );
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) + 30), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);
        }
        else if( c == ASIN ) {
            var d8 = 0.523598d;
            var f8 = 0.523598;

            string = "asin( " + d8.format("%.7f") + "d ) =";
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) - 30), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);
            valr = Math.asin( d8 );
            string = "    " + valr.format( "%.9f" );
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) - 10), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);

            string = "asin( " + f8.format("%.7f") + "f ) =";
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) + 10), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);
            valr = Math.asin( f8 );
            string = "    " + valr.format( "%.9f" );
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) + 30), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);
        }
        else if( c == ACOS ) {
            var d8 = 0.523598d;
            var f8 = 0.523598;

            string = "acos( " + d8.format("%.7f") + "d ) =";
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) - 30), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);
            valr = Math.acos( d8 );
            string = "    " + valr.format( "%.9f" );
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) - 10), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);

            string = "acos( " + f8.format("%.7f") + "f ) =";
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) + 10), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);
            valr = Math.acos( f8 );
            string = "    " + valr.format( "%.9f" );
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) + 30), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);
        }
        else if( c == ATAN ) {
            var d8 = 0.523598d;
            var f8 = 0.523598;

            string = "atan( " + d8.format("%.7f") + "d ) =";
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) - 30), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);
            valr = Math.atan( d8 );
            string = "    " + valr.format( "%.9f" );
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) - 10), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);

            string = "atan( " + f8.format("%.7f") + "f ) =";
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) + 10), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);
            valr = Math.atan( f8 );
            string = "    " + valr.format( "%.9f" );
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) + 30), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);
        }
        else if( c == LOG ) {
            var dExp = 1000000000d;
            var dBase = 10;
            var fExp = 1000000000f;
            var fBase = 10;

            string = "log( " + dExp.format( "%.2f" ) + "d,";
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) - 50), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);
            string = "     " + dBase.format( "%.2f" ) + "d ) =";
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) - 30), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);
            valr = Math.log( dExp, dBase );
            string = "    " + valr.format( "%.9f" );
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) - 10), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);

            string = "log( " + fExp.format( "%.2f" ) + "f,";
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) + 10), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);
            string = "     " + fBase.format( "%.2f" ) + "f ) =";
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) + 30), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);
            valr = Math.log( fExp, fBase );
            string = "    " + valr.format( "%.9f" );
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) + 50), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);
        }
        else if( c == POW ) {
            var dExp = 10d;
            var dBase = 2;
            var fExp = 10f;
            var fBase = 2;

            string = "pow( " + dBase.format( "%.2f" ) + "d,";
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) - 50), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);
            string = "     " + dExp.format( "%.2f" ) + "d ) =";
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) - 30), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);
            valr = Math.pow( dBase, dExp );
            string = "    " + valr.format( "%.9f" );
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) - 10), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);

            string = "pow( " + fBase.format( "%.2f" ) + "f,";
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) + 10), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);
            string = "     " + fExp.format( "%.2f" ) + "f ) =";
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) + 30), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);
            valr = Math.pow( fBase, fExp );
            string = "    " + valr.format( "%.9f" );
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) + 50), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);
        }
        else if( c == SQRT ) {
            var dVal = 1234567d;
            var fVal = 1234567f;

            string = "sqrt( " + dVal.format( "%.2f" ) + "d ) =";
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) - 30), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);
            valr = Math.sqrt( dVal );
            string = "    " + valr.format( "%.9f" );
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) - 10), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);

            string = "sqrt( " + fVal.format( "%.2f" ) + "f ) =";
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) + 10), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);
            valr = Math.sqrt( fVal );
            string = "    " + valr.format( "%.9f" );
            dc.drawText((dc.getWidth() / 2), ((dc.getHeight() / 2) + 30), Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_CENTER);
        }
        else {
            dc.drawText((dc.getWidth() / 2), (dc.getHeight() / 2), Gfx.FONT_SMALL, "Press Menu", Gfx.TEXT_JUSTIFY_CENTER);
        }
    }
}
//!
//! Copyright 2015 by Garmin Ltd. or its subsidiaries.
//! Subject to Garmin SDK License Agreement and Wearables
//! Application Developer Agreement.
//!

using Toybox.Communications as Comm;
using Toybox.WatchUi as Ui;
using Toybox.Graphics;
using Toybox.System as Sys;
using Toybox.Position;

class BaseInputDelegate extends Ui.BehaviorDelegate {
    var notify;

    function onMenu() {
        notify.invoke("Executing\nRequest");

        Comm.makeJsonRequest(
            "https://httpbin.org/get",
            {
                "Monkeys" => "Awesome",
                "ConnectIQ" => "1337"
            },
            {
                "Content-Type" => Comm.REQUEST_CONTENT_TYPE_URL_ENCODED
            },
            method(:onReceive)
        );

        return true;
    }

    function initialize(handler) {
        Ui.BehaviorDelegate.initialize();
        notify = handler;
    }

    function onReceive(responseCode, data) {
        if( responseCode == 200 ) {
            notify.invoke( data["args"] );
        }
        else {
            notify.invoke( "Failed to load\nError: " + responseCode.toString() );
        }
    }
}

class JsonRequestView extends Ui.View {
    hidden var mMessage = "Press menu button";
    hidden var mModel;

    function initialize() {
        Ui.View.initialize();
    }

    //! Load your resources here
    function onLayout(dc) {
        mMessage = "Press menu button";
    }

    //! Restore the state of the app and prepare the view to be shown
    function onShow() {
    }

    //! Update the view
    function onUpdate(dc) {
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_WHITE);
        dc.clear();
        dc.drawText(dc.getWidth()/2, dc.getHeight()/2, Graphics.FONT_MEDIUM, mMessage, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }

    //! Called when this View is removed from the screen. Save the
    //! state of your app here.
    function onHide() {
    }

    function onReceive(args) {
        if (args instanceof Lang.String) {
            mMessage = args;
        }
        else if (args instanceof Dictionary) {
            // Print the arguments duplicated and returned by httpbin.org
            var keys = args.keys();
            mMessage = "";
            for( var i = 0; i < keys.size(); i++ ) {
                mMessage += Lang.format("$1$: $2$\n", [keys[i], args[keys[i]]]);
            }
        }
        Ui.requestUpdate();
    }
}

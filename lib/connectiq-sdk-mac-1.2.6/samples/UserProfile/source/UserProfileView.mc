//!
//! Copyright 2015 by Garmin Ltd. or its subsidiaries.
//! Subject to Garmin SDK License Agreement and Wearables
//! Application Developer Agreement.
//!

using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.UserProfile as UserProfile;

var c = 1;
var secondsPerHour = 3600;
var secondsPerMinute = 60;

class BaseInputDelegate extends Ui.BehaviorDelegate {
    function onMenu() {
        if( c == 3 ) {
            c = 1;
        }
        else {
            c = c + 1;
        }
        Ui.requestUpdate();
        return true;
    }

    function onNextPage() {
    }
}

class UserProfileView extends Ui.View {


    //! Load your resources here
    function onLayout(dc) {
        onUpdate( dc );
    }

    //! Restore the state of the app and prepare the view to be shown
    function onShow() {
    }

    //! Update the view
    function onUpdate(dc) {
        var profile = UserProfile.getProfile();
        if( profile != null ) {
            var string;
            dc.setColor( Gfx.COLOR_TRANSPARENT, Gfx.COLOR_BLACK );
            dc.clear();
            dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
            if( c == 1 ) {
                var hours;
                var minutes;
                var seconds;

                string = "Weight: " + profile.weight.toString() + " g";
                dc.drawText(25, (dc.getHeight() / 2) - 30, Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_LEFT);

                if( profile.gender == 0 ) {
                    string = "Gender: FEMALE";
                }
                else {
                    string = "Gender: MALE";
                }
                dc.drawText(25, (dc.getHeight() / 2) - 10, Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_LEFT);

                string = "Height: " + profile.height.toString() + " cm";
                dc.drawText(25, (dc.getHeight() / 2) + 10, Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_LEFT);

                if( ( profile.wakeTime != null ) && ( profile.wakeTime.value() != null ) ) {
                    hours = profile.wakeTime.divide( secondsPerHour ).value();
                    minutes = ( profile.wakeTime.value() - ( hours * secondsPerHour ) ) / secondsPerMinute;
                    seconds = profile.wakeTime.value() - ( hours * secondsPerHour ) - ( minutes * secondsPerMinute );
                    string = "Wake Time: " + hours.format("%02u") + ":" + minutes.format("%02u") + ":" + seconds.format("%02u");
                } else {
                    string = "Wake Time: not set";
                }

                dc.drawText(25, (dc.getHeight() / 2) + 30, Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_LEFT);
            }
            else if( c == 2 ) {
                var hours;
                var minutes;
                var seconds;

                if( ( profile.sleepTime != null ) && ( profile.sleepTime.value() != null ) ) {
                    hours = profile.sleepTime.divide( secondsPerHour ).value();
                    minutes = ( profile.sleepTime.value() - ( hours * secondsPerHour ) ) / secondsPerMinute ;
                    seconds = profile.sleepTime.value() - ( hours * secondsPerHour ) - ( minutes * secondsPerMinute );
                    string = "Sleep Time: " + hours.format("%02u") + ":" + minutes.format("%02u") + ":" + seconds.format("%02u");
                } else {
                    string = "Sleep Time: not set";
                }

                dc.drawText(25, (dc.getHeight() / 2) - 30, Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_LEFT);

                if( profile.runningStepLength != null ) {
                    string = "Running Step Length: " + profile.runningStepLength.toString() + " mm";
                } else {
                    string = "Running Step Length: not set";
                }
                dc.drawText(25, (dc.getHeight() / 2) - 10, Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_LEFT);

                if( profile.walkingStepLength != null ) {
                    string = "Walking Step Length: " + profile.walkingStepLength.toString() + " mm";
                } else {
                    string = "Walking Step Length: not set";
                }
                dc.drawText(25, (dc.getHeight() / 2) + 10, Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_LEFT);

                if( profile.restingHeartRate != null ) {
                    string = "Resting Heart Rate: " + profile.restingHeartRate.toString() + " bpm";
                } else {
                    string = "Resting Heart Rate: not set";
                }
                dc.drawText(25, (dc.getHeight() / 2) + 30, Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_LEFT);
            }
            else {
                if( profile.activityClass <= 20 ) {
                    string = "Activity: LOW (" + profile.activityClass.toString() + ")";
                }
                else if( profile.activityClass <= 50 ) {
                    string = "Activity: MEDIUM (" + profile.activityClass.toString() + ")";
                }
                else {
                    string = "Activity: HIGH (" + profile.activityClass.toString() + ")";
                }

                dc.drawText(25, (dc.getHeight() / 2) - 10, Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_LEFT);
                string = "Birth Year: " + profile.birthYear.toString();
                dc.drawText(25, (dc.getHeight() / 2) + 10, Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_LEFT);
            }
        }
    }

}

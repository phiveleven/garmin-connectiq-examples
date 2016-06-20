//!
//! Copyright 2015 by Garmin Ltd. or its subsidiaries.
//! Subject to Garmin SDK License Agreement and Wearables
//! Application Developer Agreement.
//!

using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;

var last_key = null;

class InputTestDelegate extends Ui.BehaviorDelegate
{
    function onNextPage()
    {
        setBehaviorString("NEXT_PAGE");
        return false;
    }

    function onPreviousPage()
    {
        setBehaviorString("PREVIOUS_PAGE");
        return false;
    }

    function onMenu()
    {
        setBehaviorString("ON_MENU");
        return false;
    }

    function onBack()
    {
        setBehaviorString("ON_BACK");
        return false;
    }

    function onNextMode()
    {
        setBehaviorString("ON_NEXT_MODE");
        return false;
    }

    function onPreviousMode()
    {
        setBehaviorString("ON_PREVIOUS_MODE");
        return false;
    }

    function onSelect()
    {
        setBehaviorString("ON_SELECT");
        return false;
    }

    function onTap(evt)
    {
        setActionString("CLICK_TYPE_TAP");
        return true;
    }

    function onHold(evt)
    {
        setActionString("CLICK_TYPE_HOLD");
        return true;
    }

    function onRelease(evt)
    {
        setActionString("CLICK_TYPE_RELEASE");
        return true;
    }

    function onSwipe(evt)
    {
        var swipe = evt.getDirection();

        if( swipe == SWIPE_UP )
        {
            setActionString("SWIPE_UP");
        }
        else if( swipe == SWIPE_RIGHT )
        {
            setActionString("SWIPE_RIGHT");
        }
        else if( swipe == SWIPE_DOWN )
        {
            setActionString("SWIPE_DOWN");
        }
        else if( swipe == SWIPE_LEFT )
        {
            setActionString("SWIPE_LEFT");
        }

        return true;
    }

    function onKey(evt)
    {
        var key = evt.getKey();

        if( key == KEY_POWER )
        {
            setActionString("KEY_POWER");
        }
        else if( key == KEY_LIGHT )
        {
            setActionString("KEY_LIGHT");
        }
        else if( key == KEY_ZIN )
        {
            setActionString("KEY_ZIN");
        }
        else if( key == KEY_ZOUT )
        {
            setActionString("KEY_ZOUT");
        }
        else if( key == KEY_ENTER )
        {
            setActionString("KEY_ENTER");
        }
        else if( key == KEY_ESC )
        {
            setActionString("KEY_ESC");

            if( last_key == KEY_ESC )
            {
                Sys.exit();
            }
        }
        else if( key == KEY_FIND )
        {
            setActionString("KEY_FIND");
        }
        else if( key == KEY_MENU )
        {
            setActionString("KEY_MENU");
        }
        else if( key == KEY_DOWN )
        {
            setActionString("KEY_DOWN");
        }
        else if( key == KEY_DOWN_LEFT )
        {
            setActionString("KEY_DOWN_LEFT");
        }
        else if( key == KEY_DOWN_RIGHT )
        {
            setActionString("KEY_DOWN_RIGHT");
        }
        else if( key == KEY_LEFT )
        {
            setActionString("KEY_LEFT");
        }
        else if( key == KEY_RIGHT )
        {
            setActionString("KEY_RIGHT");
        }
        else if( key == KEY_UP )
        {
            setActionString("KEY_UP");
        }
        else if( key == KEY_UP_LEFT )
        {
            setActionString("KEY_UP_LEFT");
        }
        else if( key == KEY_UP_RIGHT )
        {
            setActionString("KEY_UP_RIGHT");
        }
        else if( key == EXTENDED_KEYS )
        {
            setActionString("EXTENDED_KEYS");
        }
        else if( key == KEY_PAGE )
        {
            setActionString("KEY_PAGE");
        }
        else if( key == KEY_START )
        {
            setActionString("KEY_START");
        }
        else if( key == KEY_LAP )
        {
            setActionString("KEY_LAP");
        }
        else if( key == KEY_RESET )
        {
            setActionString("KEY_RESET");
        }
        else if( key == KEY_SPORT )
        {
            setActionString("KEY_SPORT");
        }
        else if( key == KEY_CLOCK )
        {
            setActionString("KEY_CLOCK");
        }
        else if( key == KEY_MODE )
        {
            setActionString("KEY_MODE");
        }

        last_key = key;

        return true;
    }
}

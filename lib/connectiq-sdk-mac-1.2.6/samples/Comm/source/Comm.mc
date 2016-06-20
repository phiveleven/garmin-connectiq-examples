//!
//! Copyright 2015 by Garmin Ltd. or its subsidiaries.
//! Subject to Garmin SDK License Agreement and Wearables
//! Application Developer Agreement.
//!

using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.Application as App;
using Toybox.System as Sys;
using Toybox.Communications as Comm;

var page = 0;
var strings = ["","","","",""];
var stringsSize = 5;

class BaseView extends Ui.View
{
    function initialize()
    {
        Comm.setMailboxListener( method(:onMail) );
    }

    function onUpdate(dc)
    {
        dc.setColor( Gfx.COLOR_TRANSPARENT, Gfx.COLOR_BLACK );
        dc.clear();
        dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );

        if( page == 0 )
        {
            dc.drawText(10, 20,  Gfx.FONT_MEDIUM, "Communications test", Gfx.TEXT_JUSTIFY_LEFT);
            dc.drawText(10, 50,  Gfx.FONT_SMALL,  "Connect a phone via ADB", Gfx.TEXT_JUSTIFY_LEFT);
            dc.drawText(10, 70,  Gfx.FONT_SMALL,  "Then use the menu to send", Gfx.TEXT_JUSTIFY_LEFT);
            dc.drawText(10, 90,  Gfx.FONT_SMALL,  "strings to your phone", Gfx.TEXT_JUSTIFY_LEFT);
            //dc.drawText(10, 110, Gfx.FONT_SMALL, "", Gfx.TEXT_JUSTIFY_LEFT);
        }
        else
        {
            var i;
            var y = 50;

            dc.drawText(10, 20,  Gfx.FONT_MEDIUM, "Strings Received:", Gfx.TEXT_JUSTIFY_LEFT);
            for( i = 0 ; i < stringsSize ; i += 1 )
            {
                dc.drawText(10, y,  Gfx.FONT_SMALL, strings[i], Gfx.TEXT_JUSTIFY_LEFT);
                y += 20;
            }
        }
    }

    function onMail(mailIter)
    {
        var mail;

        mail = mailIter.next();

        while( mail != null )
        {
            var i;
            for( i = (stringsSize - 1) ; i > 0 ; i -= 1 )
            {
                strings[i] = strings[i-1];
            }
            strings[0] = mail;
            page = 1;
            mail = mailIter.next();
        }

        Comm.emptyMailbox();
        Ui.requestUpdate();
    }

}

class BaseInputDelegate extends Ui.BehaviorDelegate
{
    var cnt = 0;
    function onMenu()
    {
        var menu = new Ui.Menu();
        menu.addItem( "Hello World.", :hello );
        menu.addItem( "Ackbar", :trap );
        menu.addItem( "Garmin", :garmin );
        Ui.pushView( menu, new MenuInput(), SLIDE_IMMEDIATE );
        return true;
    }

    function onTap()
    {
        if( page == 0 )
        {
            page = 1;
        }
        else
        {
            page = 0;
        }
        Ui.requestUpdate();
    }
}

class MenuInput extends Ui.MenuInputDelegate
{
    var cnt = 0;
    function onMenuItem(item)
    {
        var listener = new CommListener();

        if( item == :hello ) {
            Comm.transmit( "Hello World.", null, listener );
        }
        else if( item == :trap ) {
            Comm.transmit( "IT'S A TRAP!", null, listener );
        }
        else if( item == :garmin ) {
            Comm.transmit( "ConnectIQ", null, listener );
        }
    }
}

class CommListener extends Comm.ConnectionListener
{
    function onComplete()
    {
        Sys.println( "Transmit Complete" );
    }

    function onError()
    {
        Sys.println( "Transmit Failed" );
    }
}

class CommExample extends App.AppBase
{
    //! Constructor
    function initialize()
    {
    }

    function onStart()
    {
    }

    function onStop()
    {
    }

    function getInitialView()
    {
        return [ new BaseView(), new BaseInputDelegate() ];
    }
}

using Toybox.WatchUi as Ui;

var lastText = "";

class KeyboardDelegate extends Ui.InputDelegate {
    function onKey(key) {
        if(key.getKey() == Ui.KEY_UP) {
            Ui.pushView(new Ui.TextPicker(lastText), new KeyboardListener(), Ui.SLIDE_DOWN );
        }
    }

    function onTap(evt) {
       Ui.pushView(new Ui.TextPicker(lastText), new KeyboardListener(), Ui.SLIDE_DOWN );
    }

}

class KeyboardListener extends Ui.TextPickerDelegate {
    function onTextEntered(text, changed) {
        globalText = text + "\n" + "Changed: " + changed;
        lastText = text;
    }

    function onCancel() {
        globalText = "Cancelled";
    }
}
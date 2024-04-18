import Cocoa

class MainWindowToolbarPasteButton: MainWindowToolbarButton {
    convenience init() {
        self.init(titleKey: "BUTTON_PASTE_TITLE", comment: "Paste")
    }
}

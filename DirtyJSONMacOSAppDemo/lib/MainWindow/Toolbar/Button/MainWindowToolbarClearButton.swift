import Cocoa

class MainWindowToolbarClearButton: MainWindowToolbarButton {
    convenience init() {
        self.init(titleKey: "BUTTON_CLEAR_TITLE", comment: "Clear")
    }
}

import Cocoa

class MainWindowToolbarSaveButton: MainWindowToolbarButton {
    convenience init() {
        self.init(titleKey: "BUTTON_SAVE_TITLE", comment: "Save")
    }
}

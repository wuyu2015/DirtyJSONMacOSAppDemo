import Cocoa

class MainWindowToolbarCopyButton: MainWindowToolbarButton {
    convenience init() {
        self.init(titleKey: "BUTTON_COPY_TITLE", comment: "Copy")
    }
}

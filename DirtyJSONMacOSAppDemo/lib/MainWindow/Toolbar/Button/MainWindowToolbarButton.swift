import Cocoa

class MainWindowToolbarButton: NSButton {
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(titleKey: String, comment: String) {
        super.init(frame: NSRect())
        bezelStyle = .regularSquare
        title = NSLocalizedString(titleKey, comment: comment)
    }
}

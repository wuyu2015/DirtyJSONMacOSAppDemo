import Cocoa

class MainContentPlaceholderView: NSView {    
    let placeholderLabel = NSTextField(labelWithString: NSLocalizedString("MAIN_CONTENT_VIEW_PLACEHOLDER_TEXT", comment: ""))
    
    convenience init() {
        self.init(frame: NSRect())
        placeholderLabel.font = NSFont.systemFont(ofSize: 15)
        placeholderLabel.textColor = NSColor.lightGray
        addSubview(placeholderLabel)
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        addConstraints([
            NSLayoutConstraint(item: placeholderLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: placeholderLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0),
        ])
    }
}

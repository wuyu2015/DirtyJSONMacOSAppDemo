import Cocoa

class MainWindowToolbar: NSToolbar, NSToolbarDelegate {
    let segmentedControl = MainWindowToolbarSegmentedControl()
    let clearButton = MainWindowToolbarClearButton()
    let pasteButton = MainWindowToolbarPasteButton()
    let copyButton = MainWindowToolbarCopyButton()
    let saveButton = MainWindowToolbarSaveButton()
    
    public var view: NSView? = nil {
        didSet {
            if let view = view {
                view.addSubview(segmentedControl)
                view.addSubview(clearButton)
                view.addSubview(pasteButton)
                view.addSubview(copyButton)
                view.addSubview(saveButton)
                
                segmentedControl.translatesAutoresizingMaskIntoConstraints = false
                copyButton.translatesAutoresizingMaskIntoConstraints = false
                pasteButton.translatesAutoresizingMaskIntoConstraints = false
                clearButton.translatesAutoresizingMaskIntoConstraints = false
                saveButton.translatesAutoresizingMaskIntoConstraints = false
                view.addConstraints([
                    // segmentedControl
                    NSLayoutConstraint(item: segmentedControl, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 5),
                    NSLayoutConstraint(item: segmentedControl, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: -5),
                    NSLayoutConstraint(item: segmentedControl, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: -8),
//                    NSLayoutConstraint(item: segmentedControl, attribute: .width, relatedBy: .lessThanOrEqual, toItem: view, attribute: .width, multiplier: 1.0, constant: -160),
                    
                    // clearButton
                    NSLayoutConstraint(item: clearButton, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 7),
                    NSLayoutConstraint(item: clearButton, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: -7),
                    NSLayoutConstraint(item: clearButton, attribute: .trailing, relatedBy: .equal, toItem: pasteButton, attribute: .leading, multiplier: 1.0, constant: -2),
                    
                    // pasteButton
                    NSLayoutConstraint(item: pasteButton, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 7),
                    NSLayoutConstraint(item: pasteButton, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: -7),
                    NSLayoutConstraint(item: pasteButton, attribute: .trailing, relatedBy: .equal, toItem: copyButton, attribute: .leading, multiplier: 1.0, constant: -2),
                    
                    // copyButton
                    NSLayoutConstraint(item: copyButton, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 7),
                    NSLayoutConstraint(item: copyButton, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: -7),
                    NSLayoutConstraint(item: copyButton, attribute: .trailing, relatedBy: .equal, toItem: saveButton, attribute: .leading, multiplier: 1.0, constant: -2),
                    
                    // saveButton
                    NSLayoutConstraint(item: saveButton, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 7),
                    NSLayoutConstraint(item: saveButton, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: -7),
                    NSLayoutConstraint(item: saveButton, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: -8),
                ])
            }
        }
    }
    
    convenience init() {
        self.init(identifier: "MainWindowToolbar")
        delegate = self
    }
    
    func toolbarAllowedItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        return []
    }
    
    func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        return []
    }
    
    func toolbar(_ toolbar: NSToolbar, itemForItemIdentifier itemIdentifier: NSToolbarItem.Identifier, willBeInsertedIntoToolbar flag: Bool) -> NSToolbarItem? {
        NSToolbarItem(itemIdentifier: itemIdentifier)
    }
}

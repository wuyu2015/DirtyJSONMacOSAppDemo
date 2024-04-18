import Cocoa

extension MainWindow {
    override func makeKeyAndOrderFront(_ sender: Any?) {
        super.makeKeyAndOrderFront(sender)
        
        if !isFirstAccess {
            return
        }
        
        guard let screenRect = NSScreen.main?.frame else {
            center()
            return
        }
        // Set window position: Top margin and bottom margin are 1:3
        if let windowSizeString = UserDefaults.standard.string(forKey: Lib.Constants.UserDefaultsKeys.lastWindowFrame) {
            let windowSize = NSRectFromString(windowSizeString).size
            setFrame(NSRect(
                x: (screenRect.width - windowSize.width) / 2,
                y: (screenRect.height - windowSize.height) * 0.75,
                width: windowSize.width, height: windowSize.height // Keep window size as last closed on exit
            ), display: true)
        } else {
            setFrameOrigin(NSPoint(
                x: (screenRect.width - frame.size.width) / 2,
                y: (screenRect.height - frame.size.height) * 0.75)
            )
        }
    }
    
    override func newWindowForTab(_ sender: Any?) {
        let window = MainWindow()
        window.title = NSLocalizedString("MAIN_WINDOW_TITLE_NEW_TAB", comment: "New JSON")
        // Without NSWindowController, will crash. fix: EXC_BAD_ACCESS (code=1, address=0x20)
        _ = NSWindowController(window: window)
        addTabbedWindow(window, ordered: .above)
        window.makeKeyAndOrderFront(sender)
    }
}

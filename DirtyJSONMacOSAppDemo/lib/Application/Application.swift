import Cocoa

class Application: NSApplication, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        mainMenu = MainMenu()
        showMainWindow(self)
    }
    
    func showMainWindow(_ sender: Any) {
        let window = MainWindow()
        _ = NSWindowController(window: window)
        window.makeKeyAndOrderFront(sender)
    }
}

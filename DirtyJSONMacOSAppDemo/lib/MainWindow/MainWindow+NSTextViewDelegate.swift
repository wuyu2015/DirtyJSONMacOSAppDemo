import Cocoa

extension MainWindow {
    func textDidChange(_ notification: Notification) {
        rawJsonStringDidChange()
    }
}

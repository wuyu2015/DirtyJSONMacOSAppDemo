import Cocoa

class MainContentScrollView: NSScrollView {
    convenience init() {
        self.init(frame: NSRect())
        hasVerticalScroller = true
        hasHorizontalScroller = false
        autohidesScrollers = true
        autoresizingMask = [.width, .height]
    }
}

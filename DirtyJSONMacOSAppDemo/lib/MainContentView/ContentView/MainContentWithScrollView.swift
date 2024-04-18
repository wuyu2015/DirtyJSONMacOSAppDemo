import Cocoa

class MainContentWithScrollView: NSView {
    let scrollView = MainContentScrollView()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: NSRect())
        addSubview(scrollView)
    }
}

import Cocoa

class MainContentJsonRawView: MainContentWithScrollView {
    let textPlaceholderView = MainContentTextPlaceholderView()
    let textView = MainContentTextView()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init() {
        super.init()
        scrollView.documentView = textView
        for subView in scrollView.subviews {
            if subView is NSClipView {
                subView.addSubview(textPlaceholderView, positioned: .below, relativeTo: nil)
                break
            }
        }
    }
}

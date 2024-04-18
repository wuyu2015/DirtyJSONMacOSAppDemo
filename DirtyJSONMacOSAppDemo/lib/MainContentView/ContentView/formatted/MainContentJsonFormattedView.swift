import Cocoa

class MainContentJsonFormattedView: MainContentJsonRawView, NSTextViewDelegate {
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init() {
        super.init()
        textView.delegate = self
    }
    
    func textView(_ textView: NSTextView, shouldChangeTextIn affectedCharRange: NSRange, replacementString: String?) -> Bool {
        return false
    }
}

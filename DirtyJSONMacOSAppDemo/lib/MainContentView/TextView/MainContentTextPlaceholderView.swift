import Cocoa

class MainContentTextPlaceholderView: NSTextView {
    convenience init() {
        self.init(frame: NSRect())
        isHorizontallyResizable = false
        isVerticallyResizable = true
        isEditable = false
        isSelectable = false
        usesRuler = false
        usesFontPanel = false
        isRichText = false
        isAutomaticDashSubstitutionEnabled = false
        isAutomaticDataDetectionEnabled = false
        isAutomaticTextReplacementEnabled = false
        isAutomaticSpellingCorrectionEnabled = false
        textColor = NSColor.lightGray
        font = NSFont.userFixedPitchFont(ofSize: NSFont.systemFontSize)
        backgroundColor = .clear
        textContainerInset = NSSize(width: 9, height: 9)
        usesFontPanel = false
        usesRuler = false
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 3
        defaultParagraphStyle = paragraphStyle
        autoresizingMask = [.width]
        string = NSLocalizedString("MAIN_CONTENT_VIEW_PLACEHOLDER_TEXT", comment: "")
    }
}

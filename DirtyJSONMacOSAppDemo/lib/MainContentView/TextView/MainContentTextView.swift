import Cocoa

class MainContentTextView: NSTextView {
    convenience init() {
        self.init(frame: NSRect())
        isHorizontallyResizable = false
        isVerticallyResizable = true
        isEditable = true
        isSelectable = true
        usesRuler = false
        usesFontPanel = false
        isRichText = false
        isAutomaticDashSubstitutionEnabled = false
        isAutomaticDataDetectionEnabled = false
        isAutomaticTextReplacementEnabled = false
        isAutomaticSpellingCorrectionEnabled = false
        textColor = NSColor.textColor
        font = NSFont.userFixedPitchFont(ofSize: NSFont.systemFontSize)
        backgroundColor = .clear
        textContainerInset = NSSize(width: 8, height: 10)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 3
        defaultParagraphStyle = paragraphStyle
        autoresizingMask = [.width]
        registerForDraggedTypes([.fileURL])
    }
    
    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        return .copy
    }
    
    override func performDragOperation(_ sender: NSDraggingInfo) -> Bool {
        guard let window = sender.draggingDestinationWindow as? MainWindow,
            let filePath = sender.draggingPasteboard.propertyList(forType: NSPasteboard.PasteboardType.fileURL) as? String,
              let fileURL = URL(string: filePath) else {
            return false
        }
        
        do {
            let fileContent = try String(contentsOf: fileURL)
            window.mainContentJsonRawView.textView.string = fileContent
            window.rawJsonStringDidChange()
            return true
        } catch {
            print("Error reading file: \(error.localizedDescription)")
            return false
        }
    }
}

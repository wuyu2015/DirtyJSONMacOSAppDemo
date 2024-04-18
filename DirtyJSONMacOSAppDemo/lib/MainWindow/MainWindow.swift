import Cocoa
import StupidNSWindow
import DirtyJSON

class MainWindow: StupidNSWindow, NSTextViewDelegate {
    let windowData = MainWindowData()
    let mainToolbar = MainWindowToolbar()
    let mainContentPlaceholderView = MainContentPlaceholderView()
    let mainContentJsonRawView = MainContentJsonRawView()
    let mainContentJsonFormattedView = MainContentJsonFormattedView()
    let mainContentJsonCompactView = MainContentJsonCompactView()
    
    private lazy var _isFirstAccess: Bool = true
    public var isFirstAccess: Bool {
        defer {
            _isFirstAccess = false
        }
        return _isFirstAccess
    }
    
    convenience init() {
        self.init(contentRect: NSRect(x: 0, y: 0, width: 600, height: 400), styleMask: [.titled, .resizable, .closable, .miniaturizable], backing: .buffered, defer: false)
        minSize.width = 600
        title = "DirtyJSON"
        titleVisibility = .hidden
        initToolbar()
        initContentView()
        formatTypeDidChange()
        rawJsonStringDidChange()
    }
    
    func initToolbar() {
        toolbar = mainToolbar
        mainToolbar.view = toolbarView
        
        let segmentedControl = mainToolbar.segmentedControl
        segmentedControl.selectedSegment = windowData.formatType.rawValue
        segmentedControl.target = self
        segmentedControl.action = #selector(toolbarSegmentedControlDidChange(_:))
        
        let clearButton = mainToolbar.clearButton
        clearButton.target = self
        clearButton.action = #selector(toolbarClearButtonClicked(_:))
        
        let pasteButton = mainToolbar.pasteButton
        pasteButton.target = self
        pasteButton.action = #selector(toolbarPasteButtonClicked(_:))
        
        let copyButton = mainToolbar.copyButton
        copyButton.target = self
        copyButton.action = #selector(toolbarCopyButtonClicked(_:))
        
        let saveButton = mainToolbar.saveButton
        saveButton.target = self
        saveButton.action = #selector(toolbarSaveButtonClicked(_:))
    }
    
    @objc func toolbarSegmentedControlDidChange(_ sender: NSSegmentedControl) {
//        windowData.formatType = MainWindowData.FormatType(rawValue: sender.selectedSegment)!
        formatTypeDidChange()
    }
    
    @objc func toolbarClearButtonClicked(_ sender: NSButton) {
        mainContentJsonRawView.textView.string = ""
        rawJsonStringDidChange()
    }
    
    @objc func toolbarPasteButtonClicked(_ sender: NSButton) {
        let pasteboard = NSPasteboard.general
        if let clipboardString = pasteboard.string(forType: .string) {
            mainContentJsonRawView.textView.string = clipboardString
            rawJsonStringDidChange()
        }
    }
    
    @objc func toolbarCopyButtonClicked(_ sender: NSButton) {
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        let selectedSegment = mainToolbar.segmentedControl.selectedSegment
        var string: String
        switch selectedSegment {
        case 0:
            string = mainContentJsonRawView.textView.string
        case 1:
            string = mainContentJsonCompactView.textView.string
        case 2:
            string = mainContentJsonFormattedView.textView.string
        default:
            string = ""
            break
        }
        pasteboard.setString(string, forType: .string)
    }
    
    @objc func toolbarSaveButtonClicked(_ sender: NSButton) {
        let string = mainContentJsonRawView.textView.string
        if let data = string.data(using: .utf8) {
            let savePanel = NSSavePanel()
            savePanel.allowedFileTypes = ["json"]
            savePanel.beginSheetModal(for: self) { response in
                if response == .OK {
                    if let url = savePanel.url {
                        do {
                            try data.write(to: url)
                        } catch {
                            print("Error saving file:", error.localizedDescription)
                        }
                    }
                }
            }
        }
    }
    
    func rawJsonStringDidChange() {
        let string = mainContentJsonRawView.textView.string
        if string.isEmpty {
            mainToolbar.clearButton.isEnabled = false
            mainToolbar.copyButton.isEnabled = false
            mainToolbar.saveButton.isEnabled = false
            
            mainContentJsonRawView.textPlaceholderView.isHidden = false
            mainContentJsonCompactView.textPlaceholderView.isHidden = false
            mainContentJsonFormattedView.textPlaceholderView.isHidden = false
            
            mainContentJsonCompactView.textView.string = ""
            mainContentJsonFormattedView.textView.string = ""
        } else {
            mainToolbar.clearButton.isEnabled = true
            mainToolbar.copyButton.isEnabled = true
            mainToolbar.saveButton.isEnabled = true
            
            mainContentJsonRawView.textPlaceholderView.isHidden = true
            mainContentJsonCompactView.textPlaceholderView.isHidden = true
            mainContentJsonFormattedView.textPlaceholderView.isHidden = true
            
            let compactString = DirtyJSON.fix(string)
            mainContentJsonCompactView.textView.string = compactString
            
            do {
                guard let jsonData = compactString.data(using: .utf8),
                      let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] else {
                    throw NSError(domain: "Invalid JSON", code: 0, userInfo: nil)
                }
                let prettyJsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted])
                if let prettyJsonString = String(data: prettyJsonData, encoding: .utf8) {
                    mainContentJsonFormattedView.textView.string = prettyJsonString
                }
            } catch {
                mainContentJsonFormattedView.textView.string = error.localizedDescription
            }
        }
    }
    
    func formatTypeDidChange() {
        let selectedSegment = mainToolbar.segmentedControl.selectedSegment
        switch selectedSegment {
        case 0:
            contentView = mainContentJsonRawView
        case 1:
            contentView = mainContentJsonCompactView
        case 2:
            contentView = mainContentJsonFormattedView
        default:
            break
        }
    }
    
    func initContentView() {
        initMainContentJsonRawView()
    }
    
    func initMainContentJsonRawView() {
        mainContentJsonRawView.textView.delegate = self
    }
    
    func isWindowInTabOverviewState() -> Bool {
        return styleMask.contains(.unifiedTitleAndToolbar)
    }
}

import Cocoa

class MainMenu: NSMenu, NSMenuDelegate, NSMenuItemValidation {
    // MARK: enum
    enum MenuItemTag: Int {
        // App
        case about
        case preferences
        case services
        case hide
        case hideOthers
        case showAll
        case quit
        
        // File
        case newWindow
        case newTab
        case search
        case close
        
        // Edit
        case undo
        case redo
        case cut
        case copy
        case paste
        case delete
        case selectAll
        
        // View
        case formatTypeRaw
        case formatTypeCompact
        case formatTypeFormatted
        
        // Window
        case minimize
        case zoom
        case fullScreen
        case nextTab
        case previousTab
        case toggleTabBar
        case toggleTabsOverview
        case bringAllToFront
        case openedWindowSeparator
        
        // Help
        case releaseNote
    }
    
    // MARK: Properties
    let separatorFont: NSFont = NSFont.systemFont(ofSize: 12.0)
    
    // MARK: init
    convenience init() {
        self.init(title: "Main Menu")
        items = [
            getAppMenuItem(),
            getFileMenuItem(),
            getEditMenuItem(),
            getViewMenuItem(),
            getWindowMenuItem(),
            getHelpMenuItem(),
        ]
        delegate = self
    }
}

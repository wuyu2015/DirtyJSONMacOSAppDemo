import Cocoa

extension MainMenu {
    func validateMenuItem(_ menuItem: NSMenuItem) -> Bool {
        guard let tag = MenuItemTag(rawValue: menuItem.tag) else {
            print("No tag found. Automatically enabled: \(menuItem.title)")
            return true
        }
        switch tag {
        case .newWindow, .about, .preferences, .releaseNote:
            // New Window, About, Preferences, Show Full History, All Favorites, Release Note
            return true // enabled by default
        case .newTab:
            // New Tab
            return App.mainWindow != nil  // enabled when window exists
        case .close:
            // Close
            guard let window = App.mainWindow else {
                return false
            }
            if window.tabbedWindows != nil {
                menuItem.title = NSLocalizedString("MENU_FILE_CLOSE_TAB", comment: "Close Tab")
            } else {
                menuItem.title = NSLocalizedString("MENU_FILE_CLOSE", comment: "Close")
            }
            return true
        case .undo:
            // Undo
            if let manager = App.mainWindow?.firstResponder?.undoManager {
                return manager.canUndo
            }
            return false
        case .redo:
            // Redo
            if let manager = App.mainWindow?.firstResponder?.undoManager {
                return manager.canRedo
            }
            return false
        case .formatTypeRaw, .formatTypeCompact, .formatTypeFormatted:
            return true
        case .fullScreen:
            // Fullscreen
            guard let window = App.mainWindow else {
                return false
            }
            if window.styleMask.contains(.fullScreen) {
                menuItem.title = NSLocalizedString("MENU_WINDOW_EXIT_FULLSCREEN", comment: "Exit Fullscreen")
            } else {
                menuItem.title = NSLocalizedString("MENU_WINDOW_ENTER_FULLSCREEN", comment: "Fullscreen")
            }
            return true
        case .toggleTabBar:
            // Toggle Tab Bar
            guard let window = App.mainWindow else {
                return false
            }
            if let tabs = window.tabbedWindows {
                menuItem.title = NSLocalizedString("MENU_WINDOW_HIDE_TAB_BAR", comment: "Hide Tab Bar")
                if tabs.count > 1 {
                    return false
                }
                return true
            }
            menuItem.title = NSLocalizedString("MENU_WINDOW_SHOW_TAB_BAR", comment: "Show Tab Bar")
            return true
        case .toggleTabsOverview:
            // Toggle Tabs Overview
            guard let window = App.mainWindow as? MainWindow else {
                return false
            }
            if window.isWindowInTabOverviewState() {
                menuItem.title = NSLocalizedString("MENU_WINDOW_HIDE_TABS_OVERVIEW", comment: "Hide Tabs Overview")
            } else {
                menuItem.title = NSLocalizedString("MENU_WINDOW_SHOW_TABS_OVERVIEW", comment: "Show Tabs Overview")
            }
            return true
        default:
            print("Untagged item, defaulted to disabled: \(menuItem.title) \(menuItem.tag)")
            if App.mainWindow == nil {
                
                return false
            }
            return true
        }
    }
}

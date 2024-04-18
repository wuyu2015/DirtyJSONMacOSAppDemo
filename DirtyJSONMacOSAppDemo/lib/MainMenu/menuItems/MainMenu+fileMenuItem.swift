import Cocoa

extension MainMenu {
    func getFileMenuItem() -> NSMenuItem {
        let menuItem = NSMenuItem()
        menuItem.submenu = NSMenu(title: NSLocalizedString("MENU_FILE", comment: "File"))
        
        // New Window
        let newWindowMenuItem = NSMenuItem(title: NSLocalizedString("MENU_FILE_NEW_WINDOW", comment: "New Window"), action: #selector(newWindowAction(_:)), keyEquivalent: "n")
        newWindowMenuItem.target = self
        newWindowMenuItem.tag = MenuItemTag.newWindow.rawValue
        
        // New Tab
        let newTabMenuItem = NSMenuItem(title: NSLocalizedString("MENU_FILE_NEW_TAB", comment: "New Tab"), action: #selector(newTabAction(_:)), keyEquivalent: "t")
        newTabMenuItem.target = self
        newTabMenuItem.tag = MenuItemTag.newTab.rawValue
        
        // Close
        let closeMenuItem = NSMenuItem(title: NSLocalizedString("MENU_FILE_CLOSE", comment: "Close"), action: #selector(closeAction(_:)), keyEquivalent: "w")
        closeMenuItem.target = self
        closeMenuItem.tag = MenuItemTag.close.rawValue
        
        // add submenu items
        menuItem.submenu?.items = [
            // New Window
            newWindowMenuItem,
            // New Tab
            newTabMenuItem,
            NSMenuItem.separator(),
            closeMenuItem,
        ]
        return menuItem
    }
}

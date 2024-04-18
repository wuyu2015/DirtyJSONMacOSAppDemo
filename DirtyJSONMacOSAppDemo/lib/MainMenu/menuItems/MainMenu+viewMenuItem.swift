import Cocoa

extension MainMenu {
    func getViewMenuItem() -> NSMenuItem {
        let menuItem = NSMenuItem()
        menuItem.submenu = NSMenu(title: NSLocalizedString("MENU_VIEW", comment: "View"))
        
        // raw
        let rawMenuItem = NSMenuItem(title: NSLocalizedString("MENU_VIEW_FORMAT_TYPE_RAW", comment: "Raw JSON"), action: #selector(selectFormatTypeRaw(_:)), keyEquivalent: "1")
        rawMenuItem.target = self
        rawMenuItem.tag = MenuItemTag.formatTypeRaw.rawValue
        
        // compact
        let compactMenuItem = NSMenuItem(title: NSLocalizedString("MENU_VIEW_FORMAT_TYPE_COMPACT", comment: "Compact JSON"), action: #selector(selectFormatTypeCompact(_:)), keyEquivalent: "2")
        compactMenuItem.target = self
        compactMenuItem.tag = MenuItemTag.formatTypeCompact.rawValue
        
        // formatted
        let formattedMenuItem = NSMenuItem(title: NSLocalizedString("MENU_VIEW_FORMAT_TYPE_FORMATTED", comment: "Formatted JSON"), action: #selector(selectFormatTypeFormatted(_:)), keyEquivalent: "3")
        formattedMenuItem.target = self
        formattedMenuItem.tag = MenuItemTag.formatTypeFormatted.rawValue
        
        menuItem.submenu?.items = [
            rawMenuItem,
            compactMenuItem,
            formattedMenuItem,
        ]
        
        return menuItem
    }
}

import Cocoa

extension MainMenu {
    func getEditMenuItem() -> NSMenuItem {
        let menuItem = NSMenuItem()
        let appName = NSLocalizedString("MENU_APP_NAME", comment: "JSON Formatter")
        menuItem.submenu = NSMenu(title: NSLocalizedString("MENU_EDIT", comment: "Edit"))
        
        // Undo
        let undoMenuItem = NSMenuItem(title: NSLocalizedString("MENU_EDIT_UNDO", comment: "Undo"), action: #selector(undoAction(_:)), keyEquivalent: "z")
        undoMenuItem.target = self
        undoMenuItem.tag = MenuItemTag.undo.rawValue
        
        // Redo
        let redoMenuItem = NSMenuItem(title: NSLocalizedString("MENU_EDIT_REDO", comment: "Redo"), action: #selector(redoAction(_:)), keyEquivalent: "z")
        redoMenuItem.keyEquivalentModifierMask = [.shift, .command]
        redoMenuItem.target = self
        redoMenuItem.tag = MenuItemTag.redo.rawValue
        
        // Cut
        let cutMenuItem = NSMenuItem(title: String(format: NSLocalizedString("MENU_EDIT_CUT", comment: "Cut"), appName), action: #selector(NSText.cut(_:)), keyEquivalent: "x")
        cutMenuItem.tag = MenuItemTag.cut.rawValue
        
        // Copy
        let copyMenuItem = NSMenuItem(title: String(format: NSLocalizedString("MENU_EDIT_COPY", comment: "Copy"), appName), action: #selector(NSText.copy(_:)), keyEquivalent: "c")
        copyMenuItem.tag = MenuItemTag.copy.rawValue
        
        // Paste
        let pasteMenuItem = NSMenuItem(title: String(format: NSLocalizedString("MENU_EDIT_PASTE", comment: "Paste"), appName), action: #selector(NSText.paste(_:)), keyEquivalent: "v")
        pasteMenuItem.tag = MenuItemTag.paste.rawValue
        
        // Delete
        let deleteMenuItem = NSMenuItem(title: String(format: NSLocalizedString("MENU_EDIT_DELETE", comment: "Delete"), appName), action: #selector(NSText.delete(_:)), keyEquivalent: "")
        deleteMenuItem.tag = MenuItemTag.delete.rawValue
        
        // Select All
        let selectAllMenuItem = NSMenuItem(title: String(format: NSLocalizedString("MENU_EDIT_SELECT_ALL", comment: "Select All"), appName), action: #selector(NSText.selectAll(_:)), keyEquivalent: "a")
        selectAllMenuItem.tag = MenuItemTag.selectAll.rawValue
        
        // add submenu items
        menuItem.submenu?.items = [
            // Undo
            undoMenuItem,
            // Redo
            redoMenuItem,
            NSMenuItem.separator(),
            // Cut
            cutMenuItem,
            // Copy
            copyMenuItem,
            // Paste
            pasteMenuItem,
            // Delete
            deleteMenuItem,
            // Select All
            selectAllMenuItem,
            // Start Dictation, Emoji & Symbols menuItems exists by default
        ]
        return menuItem
    }
}

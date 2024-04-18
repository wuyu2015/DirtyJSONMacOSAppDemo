import Cocoa

extension MainMenu {
    func getHelpMenuItem() -> NSMenuItem {
        let menuItem = NSMenuItem()
        menuItem.submenu = NSMenu(title: NSLocalizedString("MENU_HELP", comment: "Help"))
        
        let releaseNotesMenuItem = NSMenuItem(title: NSLocalizedString("MENU_HELP_RELEASE_NOTES", comment: "Release Notes"), action: #selector(releaseNotesAction(_:)), keyEquivalent: "")
        releaseNotesMenuItem.target = self
        releaseNotesMenuItem.tag = MenuItemTag.releaseNote.rawValue
        
        menuItem.submenu?.items = [
            releaseNotesMenuItem,
        ]
        NSApp.helpMenu = menuItem.submenu
        return menuItem
    }
}

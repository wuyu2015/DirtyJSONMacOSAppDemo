import Cocoa

extension MainMenu {
    func getAppMenuItem() -> NSMenuItem {
        let menuItem = NSMenuItem()
        let appName = NSLocalizedString("MENU_APP_NAME", comment: "JSON Formatter")
        menuItem.submenu = NSMenu(title: appName)
        
        // About
        let aboutMenuItem = NSMenuItem(title: String(format: NSLocalizedString("MENU_APP_ABOUT", comment: "About"), appName), action: #selector(aboutAction(_:)), keyEquivalent: "")
        aboutMenuItem.target = self
        aboutMenuItem.tag = MenuItemTag.about.rawValue
        
        // Preferences
        let preferencesMenuItem = NSMenuItem(title: NSLocalizedString("MENU_APP_PREFERENCES", comment: "Preferences"), action: #selector(preferencesAction(_:)), keyEquivalent: ",")
        preferencesMenuItem.target = self
        preferencesMenuItem.tag = MenuItemTag.preferences.rawValue
        
        // Services
        let servicesMenuItemTitle = NSLocalizedString("MENU_APP_SERVICES", comment: "Services")
        let servicesMenuItem = NSMenuItem(title: servicesMenuItemTitle, action: nil, keyEquivalent: "")
        let servicesMenu = NSMenu(title: servicesMenuItemTitle)
        // Reassigning App.servicesMenu
        App.servicesMenu = servicesMenu
        servicesMenuItem.submenu = servicesMenu
        servicesMenuItem.tag = MenuItemTag.services.rawValue
        
        // Hide
        let hideMenuItem = NSMenuItem(title: String(format: NSLocalizedString("MENU_APP_HIDE", comment: "Hide AppName"), appName), action: #selector(App.hide(_:)), keyEquivalent: "h")
        hideMenuItem.tag = MenuItemTag.hide.rawValue
        
        // Hide Others
        let hideOthersMenuItem = NSMenuItem(title: NSLocalizedString("MENU_APP_HIDE_OTHERS", comment: "Hide Others"), action: #selector(NSApplication.shared.hideOtherApplications(_:)), keyEquivalent: "h")
        hideOthersMenuItem.keyEquivalentModifierMask = [.option, .command]
        hideOthersMenuItem.tag = MenuItemTag.hideOthers.rawValue
        
        // Show All
        let showAllMenuItem = NSMenuItem(title: NSLocalizedString("MENU_APP_SHOW_ALL", comment: "Show All"), action: #selector(App.unhideAllApplications(_:)), keyEquivalent: "")
        showAllMenuItem.tag = MenuItemTag.showAll.rawValue
        
        // Quit
        let quitMenuItem = NSMenuItem(title: String(format: NSLocalizedString("MENU_APP_QUIT", comment: "Quit AppName"), appName), action: #selector(App.terminate(_:)), keyEquivalent: "q")
        quitMenuItem.tag = MenuItemTag.quit.rawValue
        
        // add submenu items
        menuItem.submenu?.items = [
            // About
            aboutMenuItem,
            NSMenuItem.separator(),
            // Preferences
            preferencesMenuItem,
            NSMenuItem.separator(),
            // Services
            servicesMenuItem,
            NSMenuItem.separator(),
            // Hide
            hideMenuItem,
            // Hide Others
            hideOthersMenuItem,
            // Show All
            showAllMenuItem,
            NSMenuItem.separator(),
            // Quit
            quitMenuItem,
        ]
        return menuItem
    }
}

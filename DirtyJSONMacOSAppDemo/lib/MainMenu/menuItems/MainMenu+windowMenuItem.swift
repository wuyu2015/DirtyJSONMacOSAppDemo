import Cocoa

extension MainMenu {
    func getWindowMenuItem() -> NSMenuItem {
        let menuItem = NSMenuItem()
        menuItem.submenu = NSMenu(title: NSLocalizedString("MENU_WINDOW", comment: "Window"))
        
        // minimizeMenuItem
        let minimizeMenuItem = NSMenuItem(title: NSLocalizedString("MENU_WINDOW_MINIMIZE", comment: "Minimize"), action: #selector(App.mainWindow?.miniaturize(_:)), keyEquivalent: "m")
        minimizeMenuItem.tag = MenuItemTag.minimize.rawValue
        
        // zoomMenuItem
        let zoomMenuItem = NSMenuItem(title: NSLocalizedString("MENU_WINDOW_ZOOM", comment: "Zoom"), action: #selector(App.mainWindow?.performZoom(_:)), keyEquivalent: "")
        zoomMenuItem.tag = MenuItemTag.zoom.rawValue
        
        // Fullscreen
        let fullScreenMenuItem = NSMenuItem(title: NSLocalizedString("MENU_WINDOW_ENTER_FULLSCREEN", comment: "Fullscreen"), action: #selector(toggleFullScreenAction(_:)), keyEquivalent: "f")
        fullScreenMenuItem.keyEquivalentModifierMask = [.control, .command]
        fullScreenMenuItem.target = self
        fullScreenMenuItem.tag = MenuItemTag.fullScreen.rawValue
        
        // selectNextTabMenuItem
        let selectNextTabMenuItem = NSMenuItem(title: NSLocalizedString("MENU_WINDOW_SHOW_NEXT_TAB", comment: "Show Next Tab"), action: #selector(App.mainWindow?.selectNextTab(_:)), keyEquivalent: "\t")
        selectNextTabMenuItem.keyEquivalentModifierMask = [.control]
        selectNextTabMenuItem.tag = MenuItemTag.nextTab.rawValue
        
        // selectPreviousTabMenuItem
        let selectPreviousTabMenuItem = NSMenuItem(title: NSLocalizedString("MENU_WINDOW_SHOW_PREVIOUS_TAB", comment: "Show Previous Tab"), action: #selector(App.mainWindow?.selectPreviousTab(_:)), keyEquivalent: "\t")
        selectPreviousTabMenuItem.keyEquivalentModifierMask = [.control, .shift]
        selectPreviousTabMenuItem.tag = MenuItemTag.previousTab.rawValue
        
        // toggleTabBarMenuItem
        let toggleTabBarMenuItem = NSMenuItem(title: NSLocalizedString("MENU_WINDOW_SHOW_TAB_BAR", comment: "Show Tab Bar"), action: #selector(toggleTabBarAction(_:)), keyEquivalent: "")
        toggleTabBarMenuItem.target = self
        toggleTabBarMenuItem.tag = MenuItemTag.toggleTabBar.rawValue
        
        // Show Tabs Overview
        let toggleTabOverviewMenuItem = NSMenuItem(title: NSLocalizedString("MENU_WINDOW_SHOW_TABS_OVERVIEW", comment: "Show Tabs Overview"), action: #selector( toggleTabOverviewAction(_:)), keyEquivalent: "\\")
        toggleTabOverviewMenuItem.keyEquivalentModifierMask = [.shift, .command]
        toggleTabOverviewMenuItem.target = self
        toggleTabOverviewMenuItem.tag = MenuItemTag.toggleTabsOverview.rawValue
        
        // Bring All to Front
        let bringAllToFrontMenuItem = NSMenuItem(title: NSLocalizedString("MENU_WINDOW_BRING_ALL_TO_FRONT", comment: "Bring All to Front"), action: #selector( App.arrangeInFront(_:)), keyEquivalent: "")
        bringAllToFrontMenuItem.tag = MenuItemTag.bringAllToFront.rawValue
        
        // openedWindowsSeparator
        let openedWindowSeparator = NSMenuItem()
        openedWindowSeparator.attributedTitle = NSAttributedString(string: NSLocalizedString("MENU_WINDOW_SEPARATOR_OPENED_WINDOW", comment: "Opened Window"), attributes: [.font: separatorFont])
        openedWindowSeparator.isEnabled = false
        openedWindowSeparator.tag = MenuItemTag.openedWindowSeparator.rawValue
        
        menuItem.submenu?.items = [
            minimizeMenuItem,
            // Zoom
            zoomMenuItem,
            // Fullscreen
            fullScreenMenuItem,
            NSMenuItem.separator(),
            // Show Next Tab
            selectNextTabMenuItem,
            // Show Previous Tab
            selectPreviousTabMenuItem,
            // Show/Hide Tab
            toggleTabBarMenuItem,
            // Show/Hide All Tabs
            toggleTabOverviewMenuItem,
            NSMenuItem.separator(),
            // Bring All to Front
            bringAllToFrontMenuItem,
            NSMenuItem.separator(),
            openedWindowSeparator,
        ]
        return menuItem
    }
}

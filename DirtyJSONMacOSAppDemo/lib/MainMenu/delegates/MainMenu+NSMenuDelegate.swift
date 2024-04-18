import Cocoa

extension MainMenu {
    func menu(_ menu: NSMenu, willHighlight item: NSMenuItem?) {
        print("willHighlight: \(menu.title)")
    }

    func menuWillOpen(_ menu: NSMenu) {
        print("menuWillOpen: \(menu.title)")
    }

    func menuDidClose(_ menu: NSMenu) {
        print("menuDidClose: \(menu.title)")
    }
        
    func menuNeedsUpdate(_ menu: NSMenu) {
        print("menuNeedsUpdate: \(menu.title)")
    }
}

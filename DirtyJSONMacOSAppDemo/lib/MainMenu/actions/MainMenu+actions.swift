import Cocoa

extension MainMenu {
    @objc func aboutAction(_ sender: Any) {
        App.orderFrontStandardAboutPanel(sender)
    }
    
    @objc func preferencesAction(_ sender: Any) {
//        App.showPreferencesWindow(sender)
    }
    
    @objc func newWindowAction(_ sender: Any) {
        App.showMainWindow(sender)
    }
    
    @objc func newTabAction(_ sender: Any) {
        App.mainWindow?.newWindowForTab(sender)
    }
    
    @objc func closeAction(_ sender: Any) {
        App.mainWindow?.performClose(sender)
    }
    
    @objc func undoAction(_ sender: Any) {
        App.mainWindow?.firstResponder?.undoManager?.undo()
    }
    
    @objc func redoAction(_ sender: Any) {
        App.mainWindow?.firstResponder?.undoManager?.redo()
    }
    
    @objc func toggleWordListAction(_ sender: Any) {
        print("toggleWordListAction")
    }
    
    @objc func moveTabToNewWindowAction(_ sender: Any?) {
         App.mainWindow?.moveTabToNewWindow(sender)
    }
    
    @objc func mergeAllWindowsAction(_ sender: Any?) {
        
    }
    
    @objc func toggleFullScreenAction(_ sender: Any?) {
        App.mainWindow?.toggleFullScreen(sender)
    }
    
    @objc func toggleTabBarAction(_ sender: Any?) {
        App.mainWindow?.toggleTabBar(sender)
    }
    
    @objc func toggleTabOverviewAction(_ sender: Any?) {
        App.mainWindow?.toggleTabOverview(sender)
    }
    
    @objc func releaseNotesAction(_ sender: Any) {
        print("releaseNotesAction")
    }
    
    @objc func selectFormatTypeRaw(_ sender: Any) {
        if let window = App.mainWindow as? MainWindow {
            window.mainToolbar.segmentedControl.selectedSegment = 0
            window.formatTypeDidChange()
        }
    }
    
    @objc func selectFormatTypeCompact(_ sender: Any) {
        if let window = App.mainWindow as? MainWindow {
            window.mainToolbar.segmentedControl.selectedSegment = 1
            window.formatTypeDidChange()
        }
    }
    
    @objc func selectFormatTypeFormatted(_ sender: Any) {
        if let window = App.mainWindow as? MainWindow {
            window.mainToolbar.segmentedControl.selectedSegment = 2
            window.formatTypeDidChange()
        }
    }
}

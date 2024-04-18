import Cocoa

let App = Application.shared as! Application
App.delegate = App
_ = NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv)

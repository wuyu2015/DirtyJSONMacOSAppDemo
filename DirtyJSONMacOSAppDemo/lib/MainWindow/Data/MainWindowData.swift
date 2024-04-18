class MainWindowData {
    enum FormatType: Int {
        case raw
        case compact
        case formatted
    }
    
    public var formatType: FormatType = .raw
    public var rawJsonString: String = ""
}

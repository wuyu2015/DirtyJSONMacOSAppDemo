import Cocoa

class MainWindowToolbarSegmentedControl: NSSegmentedControl {
    convenience init() {
        self.init(frame: NSRect())
        trackingMode = .selectOne
        segmentCount = 3
        setLabel(NSLocalizedString("SEGMENTED_CONTROL_TITLE_RAW", comment: "Raw"), forSegment: 0)
        setLabel(NSLocalizedString("SEGMENTED_CONTROL_TITLE_COMPACT", comment: "Raw"), forSegment: 1)
        setLabel(NSLocalizedString("SEGMENTED_CONTROL_TITLE_FORMATTED", comment: "Raw"), forSegment: 2)
    }
}

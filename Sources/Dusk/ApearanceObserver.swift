import Cocoa

extension NSNotification.Name {
    public static let appearanceDidChangeNotification = NSNotification.Name("appearanceChanged")
}

@MainActor
public class AppearanceObserver {
    private let appearanceObserver: NSKeyValueObservation?

    public init() {
        if #available(OSX 10.14, *) {
            self.appearanceObserver = NSApp.observe(\NSApplication.effectiveAppearance) { (app, change) in
                NotificationCenter.default.post(name: .appearanceDidChangeNotification, object: app)
            }
        } else {
            self.appearanceObserver = nil
        }
    }
}

import Cocoa

extension NSAppearance {
    /// Indicates if the receiver is a dark theme
    public var isDark: Bool {
        if #available(OSX 10.14, *) {
            switch name {
            case .darkAqua, .accessibilityHighContrastDarkAqua:
                return true
            case .vibrantDark, .accessibilityHighContrastVibrantDark:
                return true
            default:
                return false
            }
        } else {
            switch name {
            case .vibrantDark:
                return true
            default:
                return false
            }
        }
    }

    /// Attempts to determine the most resonable opposite-themed appearance
    ///
    /// If running on a version of macOS < 10.14, vibrantLight and vibrantDark
    /// are the only opposites possible. This does have the effect of adjusting
    /// an NSWindow's chrome.
    public var oppositeAppearance: NSAppearance? {
        if #available(OSX 10.14, *) {
            switch name {
            case .darkAqua, .accessibilityHighContrastDarkAqua:
                return NSAppearance(named: .aqua)
            case .vibrantDark, .accessibilityHighContrastVibrantDark:
                return NSAppearance(named: .vibrantLight)
            case .aqua, .accessibilityHighContrastAqua:
                return NSAppearance(named: .darkAqua)
            case .vibrantLight, .accessibilityHighContrastVibrantLight:
                return NSAppearance(named: .vibrantDark)
            default:
                return self
            }
        } else {
            switch name {
            case .aqua, .vibrantLight:
                return NSAppearance(named: .vibrantDark)
            case .vibrantDark:
                return NSAppearance(named: .vibrantLight)
            default:
                return self
            }
        }
    }
}

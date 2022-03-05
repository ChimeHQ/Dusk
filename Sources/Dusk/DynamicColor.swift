import Cocoa

/// NSColor subclass that supports dynamic colors when you aren't able to store colors in asset catalogs.
public class DynamicColor: WrappedColor {
    private static let colorNameKey = "dynamicColorName"
    private static let lightFallbackColorKey = "lightFallbackColor"
    private static let darkFallbackColorKey = "darkFallbackColor"

    private static let providerCollection = DynamicColorProviderCollection()

    private var colorName: NSColor.Name
    private let lightFallbackColor: NSColor?
    private let darkFallbackColor: NSColor?

    public override class var supportsSecureCoding: Bool {
        return true
    }

    public override init() {
        fatalError()
    }

    /// Create a new dynamic color
    ///
    /// This method has very similar semantics to NSColor(name:dynamicProvider:), but
    /// works for older OSes.
    ///
    /// - Parameters:
    ///   - name: The unique name used to identify the color and reattach the dynamicProvider block after deserialization.
    ///   - dynamicProvider: this block provides the effective color
    public init(name: NSColor.Name?, dynamicProvider: @escaping (NSAppearance) -> NSColor) {
        let usableName = name ?? UUID().uuidString

        self.colorName = usableName
        self.lightFallbackColor = nil
        self.darkFallbackColor = nil

        DynamicColor.providerCollection.setProvider(for: usableName, overwrite: true, dynamicProvider: dynamicProvider)

        super.init()
    }

    /// Create a dynmaic color with fixed light and dark variants
    /// - Parameters:
    ///   - name: The unique name used to identify the color
    ///   - lightColor: the color variant used for light appearances
    ///   - darkColor: the color variant used for dark appearances
    public init(name: NSColor.Name?, lightColor: NSColor, darkColor: NSColor) {
        let usableName = name ?? UUID().uuidString

        self.colorName = usableName
        self.lightFallbackColor = lightColor
        self.darkFallbackColor = darkColor

        super.init()
    }

    required init?(coder: NSCoder) {
        guard let name = coder.decodeObject(of: NSString.self, forKey: DynamicColor.colorNameKey) as String? else {
            return nil
        }

        self.colorName = name
        self.lightFallbackColor = coder.decodeObject(of: NSColor.self, forKey: DynamicColor.lightFallbackColorKey)
        self.darkFallbackColor = coder.decodeObject(of: NSColor.self, forKey: DynamicColor.darkFallbackColorKey)

        super.init(coder: coder)
    }

    required init?(pasteboardPropertyList propertyList: Any, ofType type: NSPasteboard.PasteboardType) {
        fatalError("init(pasteboardPropertyList:ofType:) has not been implemented")
    }

    override public func encode(with coder: NSCoder) {
        super.encode(with: coder)

        coder.encode(colorName as NSString, forKey: DynamicColor.colorNameKey)

        if let appearance = NSAppearance(named: .aqua) {
            let lightColor = computeEffectiveColor(for: appearance)
            coder.encode(lightColor, forKey: DynamicColor.lightFallbackColorKey)
        }

        let darkAppearance: NSAppearance?

        if #available(OSX 10.14, *) {
            darkAppearance = NSAppearance(named: .darkAqua)

        } else {
            darkAppearance = NSAppearance(named: .vibrantDark)
        }

        if let appearance = darkAppearance {
            let darkColor = computeEffectiveColor(for: appearance)
            coder.encode(darkColor, forKey: DynamicColor.darkFallbackColorKey)
        }
    }

    private func computeEffectiveColor(for appearance: NSAppearance) -> NSColor {
        if let color = DynamicColor.providerCollection.computeColor(for: colorName, appearance: appearance) {
            return color
        }

        switch (lightFallbackColor, darkFallbackColor, appearance.isDark) {
        case (_, let darkColor?, true):
            return darkColor
        case (let lightColor?, _, false):
            return lightColor
        case (let lightColor?, nil, _):
            return lightColor
        case (nil, let darkColor?, _):
            return darkColor
        case (nil, nil, _):
            fatalError("Unable to compute color for '\(colorName)'")
        }
    }

    override open var effectiveColor: NSColor {
        return computeEffectiveColor(for: NSAppearance.current)
    }

    override open var colorNameComponent: NSColor.Name {
        return colorName
    }

    public override func isEqual(_ object: Any?) -> Bool {
        guard let dynamicColor = object as? DynamicColor else {
            return false
        }

        // from the definition of NSColor(name:dynamicProvider:), two
        // colors with the same name must be equal
        return colorNameComponent == dynamicColor.colorNameComponent
    }

    public override var hash: Int {
        // since the colorNameComponent defines the equality of colors, we can
        // just use it for computing the hash as well
        
        return colorNameComponent.hashValue
    }
}

//
//  WrappedColor.swift
//  Dusk
//
//  Created by Matt Massicotte on 2019-11-01.
//  Copyright © 2019 Chime Systems. All rights reserved.
//

import Foundation

/// NSColor subclass that defers all properties and behaivors to a wrapped color.
open class WrappedColor: NSColor {
    open var effectiveColor: NSColor {
        fatalError("effectiveColor must be returned by a subclass")
    }

    public override func isEqual(_ object: Any?) -> Bool {
        guard let wrappedColor = object as? WrappedColor else {
            return false
        }

        return wrappedColor.effectiveColor == effectiveColor
    }

    public override var hash: Int {
        return effectiveColor.hash
    }

    override open var colorNameComponent: NSColor.Name {
        return effectiveColor.colorNameComponent
    }

    override open var catalogNameComponent: NSColorList.Name {
        return effectiveColor.catalogNameComponent
    }

    override public func highlight(withLevel val: CGFloat) -> NSColor? {
        return effectiveColor.highlight(withLevel: val)
    }

    override public func shadow(withLevel val: CGFloat) -> NSColor? {
        return effectiveColor.shadow(withLevel: val)
    }

    override public func set() {
        effectiveColor.set()
    }

    override public func setFill() {
        effectiveColor.setFill()
    }

    override public func setStroke() {
        effectiveColor.setStroke()
    }

    override open func usingColorSpace(_ space: NSColorSpace) -> NSColor? {
        return effectiveColor.usingColorSpace(space)
    }

    override open func usingColorSpaceName(_ name: NSColorSpaceName?, device deviceDescription: [NSDeviceDescriptionKey : Any]?) -> NSColor? {
        return effectiveColor.usingColorSpaceName(name, device: deviceDescription)
    }

    override open var colorSpaceName: NSColorSpaceName {
        return effectiveColor.colorSpaceName
    }

    override open var colorSpace: NSColorSpace {
        return effectiveColor.colorSpace
    }

    override open var numberOfComponents: Int {
        return effectiveColor.numberOfComponents
    }

    override open func getComponents(_ components: UnsafeMutablePointer<CGFloat>) {
        return effectiveColor.getComponents(components)
    }

    override open var alphaComponent: CGFloat {
        return effectiveColor.alphaComponent
    }

    override open var redComponent: CGFloat {
        return effectiveColor.redComponent
    }

    override open var greenComponent: CGFloat {
        return effectiveColor.greenComponent
    }

    override open var blueComponent: CGFloat {
        return effectiveColor.blueComponent
    }

    override open func getRed(_ red: UnsafeMutablePointer<CGFloat>?, green: UnsafeMutablePointer<CGFloat>?, blue: UnsafeMutablePointer<CGFloat>?, alpha: UnsafeMutablePointer<CGFloat>?) {
        effectiveColor.getRed(red, green: green, blue: blue, alpha: alpha)
    }

    override open var hueComponent: CGFloat {
        return effectiveColor.hueComponent
    }

    override open var saturationComponent: CGFloat {
        return effectiveColor.saturationComponent
    }

    override open var brightnessComponent: CGFloat {
        return effectiveColor.brightnessComponent
    }

    override open func getHue(_ hue: UnsafeMutablePointer<CGFloat>?, saturation: UnsafeMutablePointer<CGFloat>?, brightness: UnsafeMutablePointer<CGFloat>?, alpha: UnsafeMutablePointer<CGFloat>?) {
        effectiveColor.getHue(hue, saturation: saturation, brightness: brightness, alpha: alpha)
    }

    override open var whiteComponent: CGFloat {
        return effectiveColor.whiteComponent
    }

    override open func getWhite(_ white: UnsafeMutablePointer<CGFloat>?, alpha: UnsafeMutablePointer<CGFloat>?) {
        effectiveColor.getWhite(white, alpha: alpha)
    }

    override open var cyanComponent: CGFloat {
        return effectiveColor.cyanComponent
    }

    override open var magentaComponent: CGFloat {
        return effectiveColor.magentaComponent
    }

    override open var yellowComponent: CGFloat {
        return effectiveColor.yellowComponent
    }

    override open var blackComponent: CGFloat {
        return effectiveColor.blackComponent
    }

    override open func getCyan(_ cyan: UnsafeMutablePointer<CGFloat>?, magenta: UnsafeMutablePointer<CGFloat>?, yellow: UnsafeMutablePointer<CGFloat>?, black: UnsafeMutablePointer<CGFloat>?, alpha: UnsafeMutablePointer<CGFloat>?) {
        effectiveColor.getCyan(cyan, magenta: magenta, yellow: yellow, black: black, alpha: alpha)
    }
}

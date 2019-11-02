//
//  NSAppearance+Modification.swift
//  Dusk
//
//  Created by Matt Massicotte on 2019-11-01.
//  Copyright © 2019 Chime Systems. All rights reserved.
//

import Foundation

extension NSAppearance {

    /// Modifies NSAppearance.current within the block, and restores it afterwards
    ///
    /// - Parameters:
    ///   - newValue: the appearance to use
    ///   - block: context is which the appearance will be current
    public static func withCurrent(_ newValue: NSAppearance?, block: () -> Void) {
        let old = NSAppearance.current

        NSAppearance.current = newValue

        block()

        NSAppearance.current = old
    }

    /// Modifies NSAppearance.current within the block, and restores it afterwards
    ///
    /// This is a convenience version of the withCurrent that accepts an NSAppearance.
    public static func withCurrent(named name: NSAppearance.Name, block: () -> Void) {
        withCurrent(NSAppearance(named: name), block: block)
    }
}

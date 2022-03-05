//
//  NSAppearanceTests.swift
//  DuskTests
//
//  Created by Matt Massicotte on 2019-11-01.
//  Copyright © 2019 Chime Systems. All rights reserved.
//

import XCTest

class NSAppearanceTests: XCTestCase {
    func testWithCurrent() {
        NSAppearance.withCurrent(named: .aqua) {
            XCTAssertEqual(NSAppearance.current, NSAppearance(named: .aqua))
        }

        NSAppearance.withCurrent(named: .darkAqua) {
            XCTAssertEqual(NSAppearance.current, NSAppearance(named: .darkAqua))
        }
    }

    func testAppearanceIsDark() {
        XCTAssertEqual(NSAppearance(named: .darkAqua)?.isDark, true)
        XCTAssertEqual(NSAppearance(named: .vibrantDark)?.isDark, true)

        XCTAssertEqual(NSAppearance(named: .vibrantLight)?.isDark, false)
        XCTAssertEqual(NSAppearance(named: .aqua)?.isDark, false)
    }

    func testOppositeAppearance() {
        let aquaOpposite = NSAppearance(named: .aqua)?.oppositeAppearance
        XCTAssertEqual(aquaOpposite, NSAppearance(named: .darkAqua))

        let darkAquaOpposite = NSAppearance(named: .darkAqua)?.oppositeAppearance
        XCTAssertEqual(darkAquaOpposite, NSAppearance(named: .aqua))

        let vibrantLightOpposite = NSAppearance(named: .vibrantLight)?.oppositeAppearance
        XCTAssertEqual(vibrantLightOpposite, NSAppearance(named: .vibrantDark))

        let vibrantDarkOpposite = NSAppearance(named: .vibrantDark)?.oppositeAppearance
        XCTAssertEqual(vibrantDarkOpposite, NSAppearance(named: .vibrantLight))
    }
}

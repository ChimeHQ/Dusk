//
//  DuskTests.swift
//  DuskTests
//
//  Created by Matt Massicotte on 2019-06-02.
//  Copyright © 2019 Chime Systems. All rights reserved.
//

import XCTest
@testable import Dusk

class DuskTests: XCTestCase {
    func testAppearanceIsDark() {
        XCTAssertEqual(NSAppearance(named: .vibrantDark)?.isDark, true)
        XCTAssertEqual(NSAppearance(named: .darkAqua)?.isDark, true)

        XCTAssertEqual(NSAppearance(named: .vibrantLight)?.isDark, false)
        XCTAssertEqual(NSAppearance(named: .aqua)?.isDark, false)
    }

    func testOppositeAppearance() {
        let aquaOpposite = NSAppearance(named: .aqua)?.oppositeAppearance
        XCTAssertEqual(aquaOpposite?.bestMatch(from: [.darkAqua]), .darkAqua)

        let darkAquaOpposite = NSAppearance(named: .darkAqua)?.oppositeAppearance
        XCTAssertEqual(darkAquaOpposite?.bestMatch(from: [.aqua]), .aqua)

        let vibrantLightOpposite = NSAppearance(named: .vibrantLight)?.oppositeAppearance
        XCTAssertEqual(vibrantLightOpposite?.bestMatch(from: [.vibrantDark]), .vibrantDark)

        let vibrantDarkOpposite = NSAppearance(named: .vibrantDark)?.oppositeAppearance
        XCTAssertEqual(vibrantDarkOpposite?.bestMatch(from: [.vibrantLight]), .vibrantLight)

    }
}

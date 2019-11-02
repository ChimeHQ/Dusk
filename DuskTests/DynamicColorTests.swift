//
//  DynamicColorTests.swift
//  DuskTests
//
//  Created by Matt Massicotte on 2019-11-01.
//  Copyright © 2019 Chime Systems. All rights reserved.
//

import XCTest
@testable import Dusk

class DynamicColorTests: XCTestCase {
    func testProviderInitialization() {
        let colorName = "myColor"
        let color = DynamicColor(name: colorName, dynamicProvider: { (appearance) -> NSColor in
            switch appearance.bestMatch(from: [.aqua, .darkAqua]) {
            case .darkAqua?:
                return NSColor.black
            default:
                return NSColor.white
            }
        })

        XCTAssertEqual(color.colorNameComponent, colorName)

        NSAppearance.withCurrent(named: .aqua) {
            XCTAssertEqual(color.effectiveColor, NSColor.white)
        }

        NSAppearance.withCurrent(named: .darkAqua) {
            XCTAssertEqual(color.effectiveColor, NSColor.black)
        }
    }

    func testProviderEncoding() throws {
        let colorName = "myEncodedColor"
        let color = DynamicColor(name: colorName, dynamicProvider: { (appearance) -> NSColor in
            switch appearance.bestMatch(from: [.aqua, .darkAqua]) {
            case .darkAqua?:
                return NSColor.black
            default:
                return NSColor.white
            }
        })

        let data = try NSKeyedArchiver.archivedData(withRootObject: color,
                                                    requiringSecureCoding: true)

        let decodedColor = try XCTUnwrap(NSKeyedUnarchiver.unarchivedObject(ofClass: DynamicColor.self, from: data))

        XCTAssertEqual(decodedColor.colorNameComponent, colorName)

        NSAppearance.withCurrent(named: .aqua) {
            XCTAssertEqual(decodedColor.effectiveColor, NSColor.white)
        }

        NSAppearance.withCurrent(named: .darkAqua) {
            XCTAssertEqual(decodedColor.effectiveColor, NSColor.black)
        }
    }

    func testLightDarkInitializer() {
        let colorName = "lightDarkColor"
        let color = DynamicColor(name: colorName, lightColor: NSColor.white, darkColor: NSColor.black)

        XCTAssertEqual(color.colorNameComponent, colorName)

        NSAppearance.withCurrent(named: .aqua) {
            XCTAssertEqual(color.effectiveColor, NSColor.white)
        }

        NSAppearance.withCurrent(named: .darkAqua) {
            XCTAssertEqual(color.effectiveColor, NSColor.black)
        }
    }

    func testLightDarkEncoding() throws {
        let colorName = "lightDarkEncodedColor"
        let color = DynamicColor(name: colorName, lightColor: NSColor.white, darkColor: NSColor.black)

        let data = try NSKeyedArchiver.archivedData(withRootObject: color,
                                                    requiringSecureCoding: true)

        let decodedColor = try XCTUnwrap(NSKeyedUnarchiver.unarchivedObject(ofClass: DynamicColor.self, from: data))

        XCTAssertEqual(decodedColor.colorNameComponent, colorName)

        NSAppearance.withCurrent(named: .aqua) {
            XCTAssertEqual(decodedColor.effectiveColor, NSColor.white)
        }

        NSAppearance.withCurrent(named: .darkAqua) {
            XCTAssertEqual(decodedColor.effectiveColor, NSColor.black)
        }
    }
}

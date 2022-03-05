//
//  WrappedColorTests.swift
//  DuskTests
//
//  Created by Matt Massicotte on 2020-02-06.
//  Copyright © 2020 Chime Systems. All rights reserved.
//

import XCTest
@testable import Dusk

class TestableWrappedColor: WrappedColor {
    var testColor: NSColor?

    override open var effectiveColor: NSColor {
        return testColor!
    }
}

class WrappedColorTests: XCTestCase {
    func testIsEqual() {
        let wrappedColorA = TestableWrappedColor()
        wrappedColorA.testColor = NSColor.white

        let wrappedColorB = TestableWrappedColor()
        wrappedColorB.testColor = NSColor.white

        XCTAssert(wrappedColorA == wrappedColorB)
        XCTAssert(wrappedColorA.hash == wrappedColorB.hash)
        XCTAssert(wrappedColorA.hashValue == wrappedColorB.hashValue)
    }
}

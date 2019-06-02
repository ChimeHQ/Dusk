//
//  ApearanceObserver.swift
//  Dusk
//
//  Created by Matt Massicotte on 2019-06-02.
//  Copyright © 2019 Chime Systems. All rights reserved.
//

import Cocoa

extension NSNotification.Name {
    public static let appearanceDidChangeNotification = NSNotification.Name("appearanceChanged")
}

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

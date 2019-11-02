//
//  DynamicColorProviderCollection.swift
//  Dusk
//
//  Created by Matt Massicotte on 2019-11-02.
//  Copyright © 2019 Chime Systems. All rights reserved.
//

import Foundation

class DynamicColorProviderCollection {
    typealias Provider = (NSAppearance) -> NSColor

    private let queue: DispatchQueue
    private var providers: [NSColor.Name: Provider]

    init() {
        self.queue = DispatchQueue(label: "com.chimehq.Dusk.DynamicProviders")
        self.providers = [:]
    }

    func setProvider(for name: NSColor.Name, overwrite: Bool, dynamicProvider: @escaping Provider) {
        queue.async {
            if self.providers[name] != nil && !overwrite {
                return
            }

            self.providers[name] = dynamicProvider
        }
    }

    func computeColor(for name: NSColor.Name, appearance: NSAppearance) -> NSColor? {
        var color: NSColor? = nil

        queue.sync {
            color = self.providers[name]?(appearance)
        }

        return color
    }
}

[![Build Status][build status badge]][build status]
[![License][license badge]][license]
[![Platforms][platforms badge]][platforms]

# Dusk

Dusk is a small framework to aid in supporting Dark Mode on macOS. It is particularly useful for applications that use full-window theming, or need to support earlier OSes.

This project was made much easier thanks to the hard work of two people.

[Paulo Andrade](https://twitter.com/pfandrade_)'s post about [Adopting Dark Mode and Older Macs](https://pfandrade.me/blog/adopting-dark-mode-and-older-macs/) was great for understanding how to subclass `NSColor`.

[Daniel Jalkut](https://twitter.com/danielpunkass) published a fantastic series about [adopting Dark Mode](https://indiestack.com/2018/10/dark-mode-series-introduction/) on macOS. Many of the ideas, and even some of the code he presented, have found their way into this project.

## Integration

Swift Package Manager:

```swift
dependencies: [
    .package(url: "https://github.com/ChimeHQ/Dusk")
]
```

## Classes

**DynamicColor**

A handy `NSColor` subclass that makes it easier to use dynamic colors when you aren't able to store colors in asset catalogs. It provides two APIs, one that mimics `NSColor(name:dynamicProvider:)`, and another that let's you more easily define a light and dark variant of an `NSColor` instance.

```swift
DynamicColor(name: "uniqueColorName") { (appearance) in 
    ...
}

DynamicColor(name: "uniqueColorName", lightColor: NSColor.white, darkColor: NSColor.black)
```

**AppearanceObserver**

A very simple class that will observe effective appearance changes and post a notification when triggered. Useful when created within an `NSApplication` delegate for application-wide notifications.

## NSAppearance Extensions

Querying:

```swift
appearance.isDark

appearance.oppositeAppearance

NSAppearance.withCurrent(.aqua) {
    ...
}
```

### Suggestions or Feedback

We'd love to hear from you! Get in touch via [twitter](https://twitter.com/chimehq), an issue, or a pull request.

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.

[build status]: https://github.com/ChimeHQ/Dusk/actions
[build status badge]: https://github.com/ChimeHQ/Dusk/workflows/CI/badge.svg
[license]: https://opensource.org/licenses/BSD-3-Clause
[license badge]: https://img.shields.io/github/license/ChimeHQ/Dusk
[platforms]: https://swiftpackageindex.com/ChimeHQ/Dusk
[platforms badge]: https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FChimeHQ%2FDusk%2Fbadge%3Ftype%3Dplatforms

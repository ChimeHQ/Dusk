[![Github CI](https://github.com/ChimeHQ/Dusk/workflows/CI/badge.svg)](https://github.com/ChimeHQ/Dusk/actions)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg)](https://github.com/Carthage/Carthage)
![](https://img.shields.io/badge/Swift-5.0-orange.svg)

# Dusk

Dusk is a small framework to aid in supporting Dark Mode on macOS. It is particularly useful for applications that use full-window theming, or need to support earlier OSes.

This project was made much easier thanks to the hard work of two people.

[Paulo Andrade](https://twitter.com/pfandrade_)'s post about [Adopting Dark Mode and Older Macs](https://pfandrade.me/blog/adopting-dark-mode-and-older-macs/) was great for understanding how to subclass `NSColor`.

[Daniel Jalkut](https://twitter.com/danielpunkass) published a fantastic series about [adopting Dark Mode](https://indiestack.com/2018/10/dark-mode-series-introduction/) on macOS. Many of the ideas, and even some of the code he presented, have found their way into this project.

## Integration

Carthage:

```
github "ChimeHQ/Dusk"
```

Swift Package Manager:

```swift
dependencies: [
    .package(url: "https://github.com/ChimeHQ/Dusk.git")
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

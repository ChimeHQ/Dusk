<div align="center">

[![Build Status][build status badge]][build status]
[![Platforms][platforms badge]][platforms]
[![Matrix][matrix badge]][matrix]

</div>

# Dusk

Dusk is a small framework to aid in supporting Dark Mode on macOS. It is particularly useful for applications that use full-window theming, or need to support earlier OSes.

This project was made much easier thanks to the hard work of two people.

Paulo Andrade's post about [Adopting Dark Mode and Older Macs](https://pfandrade.me/blog/adopting-dark-mode-and-older-macs/) was great for understanding how to subclass `NSColor`.

Daniel Jalkut published a fantastic series about [adopting Dark Mode](https://indiestack.com/2018/10/dark-mode-series-introduction/) on macOS. Many of the ideas, and even some of the code he presented, have found their way into this project.

## Integration

Swift Package Manager:

```swift
dependencies: [
    .package(url: "https://github.com/ChimeHQ/Dusk", from: "1.1.4")
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

## Contributing and Collaboration

I'd love to hear from you! Get in touch via an issue or pull request.

I prefer collaboration, and would love to find ways to work together if you have a similar project.

I prefer indentation with tabs for improved accessibility. But, I'd rather you use the system you want and make a PR than hesitate because of whitespace.

By participating in this project you agree to abide by the [Contributor Code of Conduct](CODE_OF_CONDUCT.md).

[build status]: https://github.com/ChimeHQ/Dusk/actions
[build status badge]: https://github.com/ChimeHQ/Dusk/workflows/CI/badge.svg
[platforms]: https://swiftpackageindex.com/ChimeHQ/Dusk
[platforms badge]: https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FChimeHQ%2FDusk%2Fbadge%3Ftype%3Dplatforms
[matrix]: https://matrix.to/#/%23chimehq%3Amatrix.org
[matrix badge]: https://img.shields.io/matrix/chimehq%3Amatrix.org?label=Matrix

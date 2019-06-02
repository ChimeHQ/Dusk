[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg)](https://github.com/Carthage/Carthage)
![](https://img.shields.io/badge/Swift-5.0-orange.svg)

# Dusk

Dusk is a micro-framework to aid in supporting Dark Mode on macOS. It is particularly useful for applications that use full-window themeing, or need to support OSes earlier than 10.14.

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

**AppearanceObserver**

A very simple class that will observe effective appearance changes and post a notification when triggered. Useful when created within an `NSApplication` delegate for application-wide notifciations.

## NSAppearance Extensions

Querying:

```swift
appearance.isDark

appearance.oppositeAppearance
```

### Suggestions or Feedback

We'd love to hear from you! Get in touch via [twitter](https://twitter.com/chimehq), an issue, or a pull request.

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.

# ZXCodeTextField Package

<p align="center">
    <a href="#">
        <img src="https://img.shields.io/badge/swift-5.8-orange.svg" alt="Swift: 5.8">
    </a>
    <a href="https://github.com/andreysavie/ZXCodeTextfield/releases">
        <img src="https://img.shields.io/badge/version-0.1.1-blue.svg"
        alt="Version: 0.1.1">
    </a>
    <a href="#">
    <img src="https://img.shields.io/badge/Platforms-iOS%20|%20tvOS%20|%20watchOS|%20macOS-green.svg"
        alt="Platforms: iOS – tvOS – watchOS - macOS">
    </a>
    <a href="https://github.com/apple/swift-package-manager">
        <img src="https://img.shields.io/badge/SwiftPM-compatible-brightgreen.svg" alt="SwiftPM: Compatible">
    </a>
        <a href="https://github.com/apple/swiftiu">
        <img src="https://img.shields.io/badge/SwiftUI-compatible-brightgreen.svg" alt="SwiftUI: Compatible">
    </a>
</p>
<p align="center">
<img src="https://raw.githubusercontent.com/andreysavie/ZXCodeTextfield/main/Misc/video.gif" alt="Icon"/>
</p>
 
 
An high customizable and fast verification code view, written in UIKit.

**ZXCodeTextField** is an fully customizable input view built to makes easier and faster the input of a verification / OTP code you provided to your users via mail/phone.

## System Requirements
iOS 15.0 or never

## Features
✅ Animation error

✅ Animation success

✅ Animation tactile feedback

✅ Flexible style adjustment

✅ Adaptive layout

## Next Step

coming soon!

## Installation

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into `Xcode`.

Once you have your Swift package set up, adding ZXCodeTextField as a dependency is very easy. You've just to add it to the `dependencies` value of your `Package.swift`.

```swift
import ZXCodeTextField
```

## Example of usage
Using `ZXCodeTextField` is very easy and straightforward. Just create it inside your `body`passing as argument the code to be inserted by the user.

You can customize the appearance of the code verifier during initialization using the `ZXCodeLabelStyle` struct.
 
### Basic Implementation (SwiftUI)

```swift
import SwiftUI

struct SwiftUIWrapper: View {
    
    let style = ZXCodeLabelStyle(
        underLineNormalColor: .black,
        underLineCurrentColor: .green,
        errorColor: .red,
        lineHeight: 2,
        font: .systemFont(ofSize: 24, weight: .bold),
        textColor: .black,
        spacing: 16,
        padding: 32
    )
    
    @State var insCode: String = ""
    
    /// create viewModel for can to call error warning
    @State var textFieldViewModel = ZXCodeTextFieldViewModel()

    var body: some View {
        VStack {
            Text("Enter your OTP")

            ZXCodeTextFieldWrapper(
            numberOfSymbols: 6, 
            style: style, 
            otpCode: $insCode, 
            viewModel: $textFieldViewModel
            )
                .frame(height: 50)
            
            Button("WARNING!") {
            
                /// call wrongPassAlarm() when code is wrong
                textFieldViewModel.wrongPassAlarm()
            }
            .buttonStyle(.borderedProminent)
            .padding()
            Spacer()
        }
    }
}
```

## Contributing

- If you **need help** or you'd like to **ask a general question**, open an issue.
- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

## Acknowledgements

Made with ❤️ in Zuzex by [Andrey Rybalkin](https://t.me/andreysavie).

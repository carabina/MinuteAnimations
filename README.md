# MinuteAnimations

[![CI Status](http://img.shields.io/travis/Luca Gobbo/MinuteAnimations.svg?style=flat)](https://travis-ci.org/Luca Gobbo/MinuteAnimations)
[![Version](https://img.shields.io/cocoapods/v/MinuteAnimations.svg?style=flat)](http://cocoapods.org/pods/MinuteAnimations)
[![License](https://img.shields.io/cocoapods/l/MinuteAnimations.svg?style=flat)](http://cocoapods.org/pods/MinuteAnimations)
[![Platform](https://img.shields.io/cocoapods/p/MinuteAnimations.svg?style=flat)](http://cocoapods.org/pods/MinuteAnimations)

Simplfy animations with some sugar. This is a small library i personally use for my projets at my work. 

inspired by [this medium post](https://medium.com/swift-programming/swift-uiview-animation-syntax-sugar-d40448fe1fed)


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Animator Examples

```swift
  constraint.constant = 100
  UIView.Animator(duration: animation.duration)
    .animations { self.view.layoutIfNeeded() }
    .animate()
```

```swift
  constraint.constant = 100
  UIView.Animator(duration: animation.duration)
    .animations { self.view.layoutIfNeeded() }
    .completion { self.animationCompleted() }
    .animate()
```


## KeyFrameAnimator example

```swift
  UIView.KeyFrameAnimator(duration: 0.6)      
    .addAnimation(relativeStartTime: 0, relativeDuration: 0.5) {        
      label.alpha = 0
      button.transform = CGAffineTransform.identity.scaledBy(x: 0.1, y: 0.1)
    }
    .addAnimation(relativeStartTime: 0.5, relativeDuration: 0.3) {
      imageView.transform = CGAffineTransform.identity.scaledBy(x: 1.2, y: 1.2)
      imageView.alpha = 1
    }
    .addAnimation(relativeStartTime: 0.8, relativeDuration: 0.2) {
      imageView.transform = CGAffineTransform.identity
    }
    .animate()
```



## Requirements

## Installation

MinuteAnimations is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "MinuteAnimations"
```

## Author

Luca Gobbo, l.gobbo@me.com

## License

MinuteAnimations is available under the MIT license. See the LICENSE file for more info.

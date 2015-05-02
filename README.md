# SingleLineShakeAnimation
TLDR; Shake a view with a single line of code with a non-intrusive extension for UIView, written in Swift.

With this non-intrusive UIView extension, your UIView subclasses can get shaking with very little code.
Shaking can be useful to indicate an important action your user needs to perform, for example filling out a form before submitting. Show the user it by gently shaking the needed view to get their attention.

[![Version](https://img.shields.io/cocoapods/v/SingleLineShakeAnimation.svg?style=flat)](http://cocoadocs.org/docsets/SingleLineShakeAnimation)
[![License](https://img.shields.io/cocoapods/l/SingleLineShakeAnimation.svg?style=flat)](http://cocoadocs.org/docsets/SingleLineShakeAnimation)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/haaakon/SingleLineShakeAnimation)

## Installation
```ruby
pod "SingleLineShakeAnimation"
```

Usage
=====
#### import library 
```swift
import SingleLineShakeAnimation
```

##### Basic horizontal shake.
```swift
button.shake(.Horizontal)
```
Using these default values
```swift
private struct DefaultValues {
    static let numberOfTimes = 5
    static let totalDuration : Float = 0.5
}
```

### Example
![Resize Example](https://raw.githubusercontent.com/haaakon/SingleLineShakeAnimation/master/example.gif)


Customized usage
=====
Vertical shake with completion block.
```swift
button.shake(.Vertical, completion: { () -> Void in
            // do something after animation finishes
        })
```

Stating number of times to go back and forth and total duration for the whole animation to take.
```swift
button.shake(.Horizontal, numberOfTimes: 10, totalDuration: 0.6, completion: { () -> Void in
            // do something after animation finishes
        })
```

## Author

Håkon Bogen, hakon.bogen@gmail.com

## License

SingleLineShakeAnimation is available under the MIT license. See the LICENSE file for more info.

# SingleLineShakeAnimation
Shake a view with a single line of code with a non-intrusive extension for UIView, written in Swift.

## Installation
```ruby
pod "SingleLineShakeAnimation"
```

Usage
=====
Using the default values for duration and number of times shaking
```swift
button.shake(.Horizontal)
```

### Example
![Resize Example](https://raw.githubusercontent.com/haaakon/SingleLineShakeAnimation/master/example.gif)


Customized usage
=====

With completion block 
```swift
button.shake(.Horizontal, completion: { () -> Void in
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




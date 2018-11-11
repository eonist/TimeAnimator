# Chaplin
Animation framework

![mit](https://img.shields.io/badge/License-MIT-brightgreen.svg) ![platform](https://img.shields.io/badge/Platform-iOS-blue.svg) ![Lang](https://img.shields.io/badge/Language-Swift%204.2-orange.svg)

### What is it
Animation framework

### How does it work
- Chaplin uses the swift Timer class for animation
- The animations wont be as smooth as using CAAnimation
- But Chaplin will give you more freedom than apple animation
- Chaplin will use CAAnimation soon. Stay tuned

### How do I get it
- Carthage `github "eonist/Chaplin"`
- Manual Open `Chaplin.xcodeproj`
- CocoaPod (Coming soon)

### Example:

```swift
let animator = TimeAnimator(duration:0.3,onChange:{/*animate stuff*/},onComplete:{/*anim completed*/})
animator.start()
```

```swift
let to = self.curX + 1
let animator = TimeAnimator(duration:0.3)
animator.tick = {
	Swift.print("animator.curCount:  \(animator.curCount)")
	Swift.print("animator.progress:  \(animator.progress)")
	self.curX = TimeAnimator.Interpolate(from: from, to: to, fraction: animator.progress)
	self.frame.origin.x self.curX
}
animator.start()
```

### Todo:
- Add CAAnimation
- Make project logo

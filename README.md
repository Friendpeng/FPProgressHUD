# FPProgressHUD
A simple loading animation


* 用Swift实现的多个小圆点逐个变大缩小动画，支持自定以圆点的大小，圆点之间的间距，动画时间，是否自动消失等 By Swift implementation of multiple small dots of one larger narrow animation, support customised to the size of the dot, dot, the spacing between the animation time, whether disappear automatically, etc

### Features

- 圆点的大小(The size of the dot )
- 圆点之间的间距(Spacing between the dots)
- 动画时间(Animation time)
- 是否自动消失(If disappear automatically)
- 自定义颜色(Custom colors)

### Requirements

- iOS 8.0+ 
- Xcode 8.0+
- Swift 3.0+

### Installation

#### 1. CocoaPods

```
pod 'FPProgressHUD', '~> 0.0.2'
```

#### 2. SourceCode



### Usage
引入Module
```swift
import FPProgressHUD
```

使用很简单一句代码OK
```swift
let hud = FPProgressHUD.init(numberOfCircles: 3,
                             internalSpacing: 3,
                                      radius: 15,
                                       delay: 0.2,
                                    duration: 0.8,
                                       Color: UIColor.orange,
                                    autoHide:false)
// 显示
hud.show()
// 隐藏
hud.hide()

}
```

具体使用和自定义可以下载demo查看

### Demo


1. Example

![Example](https://github.com/Friendpeng/FPProgressHUD/tree/master/Docs/Example.gif)




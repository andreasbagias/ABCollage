# ABCollage

[![CI Status](https://img.shields.io/travis/andreasbagias@gmail.com/ABCollage.svg?style=flat)](https://travis-ci.org/andreasbagias@gmail.com/ABCollage)
[![Version](https://img.shields.io/cocoapods/v/ABCollage.svg?style=flat)](https://cocoapods.org/pods/ABCollage)
[![License](https://img.shields.io/cocoapods/l/ABCollage.svg?style=flat)](https://cocoapods.org/pods/ABCollage)
[![Platform](https://img.shields.io/cocoapods/p/ABCollage.svg?style=flat)](https://cocoapods.org/pods/ABCollage)

## Example

<a href="https://imgflip.com/gif/2a6ijg"><img src="https://i.imgflip.com/2a6ijg.gif" title="made at imgflip.com"/></a>
<img src="https://github.com/andreasbagias/ABCollage/blob/master/Example/picture1.png" width="260" height="463">
<img src="https://github.com/andreasbagias/ABCollage/blob/master/Example/picture2.png" width="260" height="463">

## Installation

ABCollage is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ABCollage'
```

## How to Use

```swift
collageView.horizontalfactors = [[2,1],[1,2],[1,1]] //optional
collageView.verticalFactors = [1,1,1] //optional
collageView.padding = 10 //optional
collageView.cornerRadius = 10 //optional
collageView.borderWidth = 3 //optional

let image1 = ABImage(image: UIImage(named: "test1")!)
let image2 = ABImage(image: UIImage(named: "test2")!)
let image3 = ABImage(image: UIImage(named: "test3")!)
let image4 = ABImage(image: UIImage(named: "test4")!)
let image5 = ABImage(image: UIImage(named: "test5")!)
let image6 = ABImage(image: UIImage(named: "test6")!)

collageView.media = [[image1,image2],
[image4,image3],
[image5,image6]]

collageView.setUserInteraction(enabled: true, vc: self) //optional
```

## Author

andreas bagias, andreasbagias@gmail.com

## License

ABCollage is available under the MIT license. See the LICENSE file for more info.

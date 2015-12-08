# Getting LTMorphingLabel to Work

This mini-guide aims to give some helpful hints to fellow Thinkful students and others trying to get LTMorphingLabel to work in Swift.  My example uses CocoaPods to add LTMorphingLabel to my project, so make adjustments if you are using Carthage or adding the package manually.

Please note that to make LTMorphingLabel work with CocoaPods it must be imported as a framework, at least that is what I found worked for me.  Also, you must find the Pods/Resources folder (for LTMorphingLabel) in the Pods Project and drag this into your main project for the morphing effects to find their resources.

Here is what my working PodFile looks like:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!
pod 'AFNetworking', '~> 2.5'
pod 'LTMorphingLabel', '~> 0.0.9'
target 'Web Service Example' do
    pod 'SwiftyJSON', :git => 'https://github.com/SwiftyJSON/SwiftyJSON.git'
end
```
In order to use this for one of your labels, you must select the label and set its class to LTMorphingLabel.

Make sure to import LTMorphingLabel in your ViewController.swift file as well.

```objective-c
import UIKit
import SwiftyJSON
import AFNetworking
import LTMorphingLabel

class ViewController: UIViewController {
        @IBOutlet weak var forecastLabel: UILabel!
        @IBOutlet weak var cityLabel: UILabel!
        @IBOutlet private var temperatureLabel: LTMorphingLabel!
...
```

Here is an example of how to set the morphingEffect property of your Label (that has the LTmorphing class):

```objective-c
let temperature = json["list"][0]["temp"]["day"].doubleValue //{
    self.temperatureLabel.text = String(temperature)
    self.temperatureLabel.morphingEffect = .Anvil
```

This 'mini-guide' is not perfect but hopefully will give you some guidance on adding and implementing LTMorphingLabel effects to your Swift project.

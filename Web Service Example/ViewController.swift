//
//  ViewController.swift
//  Web Service Example
//
//  Created by Anna Hull on 11/23/15.
//  Copyright © 2015 Anna Hull. All rights reserved.
//

import UIKit
import SwiftyJSON
import AFNetworking
import LTMorphingLabel

class ViewController: UIViewController {
    
    @IBOutlet weak var forecastLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet private var temperatureLabel: LTMorphingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let manager = AFHTTPRequestOperationManager()
        manager.GET("http://api.openweathermap.org/data/2.5/forecast/daily?id=5359777&mode=json&units=imperial&cnt=1&appid=29b46f039fd2f9053f7d2c27f985f9d2",
            parameters: nil,
            success: { (operation:AFHTTPRequestOperation, responseObject:AnyObject) -> Void in
                print("Response: " + responseObject.description)
                let json = JSON(responseObject)
                
                if let forecast = json["list"][0]["weather"][0]["description"].string {
                    self.forecastLabel.text = forecast }
                if let city = json["city"]["name"].string {
                    self.cityLabel.text = city }
                let temperature = json["list"][0]["temp"]["day"] //{
                   self.temperatureLabel.text = String(temperature)
//                    self.temperatureLabel.morphingCharacterDelay = 0.026
//                    self.temperatureLabel.morphingDuration = 0.60
//                    self.temperatureLabel.morphingEnabled = true
//                    self.temperatureLabel.morphingProgress = 0.00
                    self.temperatureLabel.morphingEffect = .Burn
                if temperature > 90.0 {
                    self.view.backgroundColor = UIColor.redColor()
                } else {
                    self.view.backgroundColor = UIColor.blueColor()
                }
                //}
                })
            {(operation:AFHTTPRequestOperation?, error:NSError) -> Void in
                print("Error: " + error.localizedDescription)}
        //self.temperatureLabel.morphingEffect = .Pixelate
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
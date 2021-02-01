//
//  ViewController.swift
//  findSunrise
//
//  Created by mona zheng on 1/31/21.
//

import UIKit

class ViewController: UIViewController {
    private var apiKey: String {
          get {
            // 1
            guard let filePath = Bundle.main.path(forResource: "OpenWeatherMapInfo", ofType: "plist") else {
              fatalError("Couldn't find file 'OpenWeatherMapInfo.plist'.")
            }
            // 2
            let plist = NSDictionary(contentsOfFile: filePath)
            guard let value = plist?.object(forKey: "OWM_API_KEY") as? String else {
              fatalError("Couldn't find key 'OWM_API_KEY' in 'OpenWeatherMapInfo.plist'.")
            }
            return value
          }
        }
    
    @IBOutlet weak var txtLocation: UITextField!
    @IBOutlet weak var tvShowTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buLookUpTime(_ sender: Any) {
        let url = "http://api.openweathermap.org/data/2.5/weather?zip=11356,us&appid=\(apiKey)"
        
        do {
            // get data from url
            let appURL = URL(string: url)
            let data = try Data(contentsOf: appURL! as URL)
            let json = try JSONSerialization.jsonObject(with: data) as! [String: Any]
            
            // get the sunrise time from the json
            let locationInfo = json["sys"] as! [String: Any]
            let sunriseInSeconds = locationInfo["sunrise"] as! Int
            
            // convert the unix time to the date
            let date = Date(timeIntervalSince1970: Double(sunriseInSeconds))
            
            // get the hour and minutes from the date
            let hour = Calendar.current.component(.hour, from: date)
            let minute = Calendar.current.component(.minute, from: date)
            
            // make minutes look nice in display - single digit or double digit
            if (minute < 10){
                tvShowTime.text = "\(hour):0\(minute)AM"
            } else {
                tvShowTime.text = "\(hour):\(minute)AM"
            }

        } catch {
            tvShowTime.text = "Cannot reach server"
        }
    }
    
}


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
        
        // get data from url
        do {
            let appURL = URL(string: url)
            let data = try Data(contentsOf: appURL! as URL)
            let json = try JSONSerialization.jsonObject(with: data) as! [String: Any]
            print(json)
        } catch {

            tvShowTime.text = "Cannot reach server"
        }
    }
    
}


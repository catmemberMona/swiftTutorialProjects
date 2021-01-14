//
//  ViewController.swift
//  pockemonGuidedProj
//
//  Created by mona zheng on 12/23/20.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {
    var mapView: GMSMapView!
    let locationManager = CLLocationManager()
    var listPockemon = [Pockemon]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // load pockemon
        LoadPockemons()
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate
        let camera = GMSCameraPosition.camera(withLatitude: 40.7, longitude: -74.0, zoom: 14.0)
        // view shown at camera position
        mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        self.view.addSubview(mapView)
        self.mapView.delegate = self
        
        // get user location permission
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        // permission is approved, then use user location
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    // add new pockemon to the map/screen by tapping on location
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        //        coordinate is where i tap on the screen/map
        self.listPockemon.append(Pockemon(latitude: coordinate.latitude, longitude: coordinate.longitude, image: "charmander", name: "Charmander", des: "Charmander lives here", power: 200.0))
        
        var index = 0
        for pockemon in listPockemon {
           
            if pockemon.isCatch == false {
                let markerPockemon = GMSMarker()
                markerPockemon.position = CLLocationCoordinate2D(latitude: pockemon.latitiude!, longitude: pockemon.longitude!)
                markerPockemon.title = pockemon.name!
                markerPockemon.snippet = "\(pockemon.des!) has power level \(pockemon.power!)"
                markerPockemon.icon = UIImage(named: pockemon.image!)
                markerPockemon.map = self.mapView
                
                // check location to catch pockemon
                if (Double(myLocation.latitude).roundTo(places: 4) ==
                        Double(pockemon.latitiude!).roundTo(places: 4)
                        && Double(myLocation.longitude).roundTo(places: 4) == Double(pockemon.longitude!).roundTo(places: 4)){
                    listPockemon[index].isCatch = true
                    AlertDialog(pockemonPower: pockemon.power!)
                    
                }
                index += 1
            }
        
        }
    }
    
    var myLocation = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    func locationManager(_ manager: CLLocationManager, didUpdateLocations location: [CLLocation]){
        myLocation = manager.location!.coordinate
        self.mapView.clear()
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: myLocation.latitude, longitude: myLocation.longitude)
        marker.title = "Me"
        marker.snippet = "I am here! \(myLocation.latitude) and \(myLocation.longitude)"
        marker.icon = UIImage(named: "mario")
        marker.map = self.mapView
        
        
        // show pockemons
        var index = 0
        for pockemon in listPockemon {
           
            if pockemon.isCatch == false {
                let markerPockemon = GMSMarker()
                markerPockemon.position = CLLocationCoordinate2D(latitude: pockemon.latitiude!, longitude: pockemon.longitude!)
                markerPockemon.title = pockemon.name!
                markerPockemon.snippet = "\(pockemon.des!) has power level \(pockemon.power!)"
                markerPockemon.icon = UIImage(named: pockemon.image!)
                markerPockemon.map = self.mapView
                
                // check location to catch pockemon
                if (Double(myLocation.latitude).roundTo(places: 4) ==
                        Double(pockemon.latitiude!).roundTo(places: 4)
                        && Double(myLocation.longitude).roundTo(places: 4) == Double(pockemon.longitude!).roundTo(places: 4)){
                    listPockemon[index].isCatch = true
                    AlertDialog(pockemonPower: pockemon.power!)
                    
                }
                index += 1
            }
        }
        
        
        let camera = GMSCameraPosition.camera(withLatitude: myLocation.latitude, longitude: myLocation.longitude, zoom: 14.0)
        self.mapView.camera = camera
        
    }
    
    var playerPower = 0.0
    func LoadPockemons(){
        self.listPockemon.append(Pockemon(latitude: 40.765834, longitude: -73.996417, image: "charmander", name: "Charmander", des: "Charmander lives here", power: 10.0))
        self.listPockemon.append(Pockemon(latitude: 40.769934, longitude: -73.980417, image: "squirtle", name: "Squirtle", des: "Squirtle lives here", power: 11.0))
        self.listPockemon.append(Pockemon(latitude: 40.745834, longitude: -73.989917, image: "bulbasaur", name: "Bulbasaur", des: "Bulbasaur lives here", power: 100.0))
    }

    func AlertDialog(pockemonPower: Double){
        playerPower += pockemonPower
        let alert = UIAlertController(title: "You caught a new pockemon", message: "Your new power level is \(playerPower)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {action in print("+ one")}))
        self.present(alert, animated: true, completion: nil)
        
    
        
    }
    

}

extension Double {
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}


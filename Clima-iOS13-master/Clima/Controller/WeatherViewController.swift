//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var searchTextField: UITextField!
    var WM = WeatherManager()
    let LM = CLLocationManager()
    //a23dfa29490cbcd466d557c04257ea0f
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LM.requestWhenInUseAuthorization()
        LM.delegate = self
        LM.requestLocation()
        
        searchTextField.delegate = self
        WM.delegate = self
    }
    
    @IBAction func locationButtonPressed(_ sender: UIButton) {
        print("location button pressed")
        LM.requestLocation()
    }
    
}

//MARK: - UITextFieldDelegate
extension WeatherViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          print(searchTextField.text!)
          searchTextField.endEditing(true)
          return true
      }
      
      func textFieldDidEndEditing(_ textField: UITextField) {

          if let city = searchTextField.text {
              WM.fetchWeather(cityName: city)
          }
          searchTextField.text = ""
      }
      

      @IBAction func searchPressed(_ sender: UIButton) {
          print(searchTextField.text!)
          searchTextField.endEditing(true)
      }
      
      
      func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
          if textField.text != "" {
              return true
          } else {
              textField.placeholder = "Type Something"
              return false
          }
      }
}

//MARK: - WeatherManagerDelegate
extension WeatherViewController: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        print(weather.temperature)
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.city
        }
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
}

//MARK: - CLLocationManagerDelegate

extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            LM.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let long = location.coordinate.longitude
            WM.fetchWeather(latitude: lat, longitude: long)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

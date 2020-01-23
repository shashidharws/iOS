//
//  WeatherManager.swift
//  Clima
//
//  Created by smuser on 23/12/19.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager ,weather: WeatherModel)
    func didFailWithError(_ error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=a23dfa29490cbcd466d557c04257ea0f&units=metric"
    
    var delegate : WeatherManagerDelegate?
    
    func fetchWeather(cityName : String) {
        let urlStr = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlStr)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude:CLLocationDegrees) {
        let urlstr = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlstr)
    }
    
    func performRequest(with urlString : String) {
        print(urlString)
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if(error != nil) {
                    print(error!)
                    self.delegate?.didFailWithError(error!)
                    return
                }
                if let safeData = data {
                    print("got response")
                    if let weather = self.parseJson(safeData) {
                            self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            task.resume()
        } else {
            print("url error")
        }
    }
    
    func parseJson(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionID: id, city: name, temperature: temp)
            print(weather.conditionName)
            print(weather.temperatureString)
            return weather
            
        } catch {
            print(error)
            delegate?.didFailWithError(error)
            return nil
        }
    }
}

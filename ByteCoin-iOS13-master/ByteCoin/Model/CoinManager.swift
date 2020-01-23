//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdatePrice(_ coinModel: CoinModel)
    func didFailWithError(_ error: Error)
}


struct CoinManager {
    
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate : CoinManagerDelegate?

    func getCoinPrice(for currency: String) {
        let url = "\(baseURL)\(currency)"
        print(url)
        performRequest(urlString: url)
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default)
            let task = urlSession.dataTask(with: url) { (data, response, error) in
                if (error != nil) {
                    print(error!)
                    self.delegate?.didFailWithError(error!)
                }
                if let data = data {
                    if let coinModel = self.parseJson(data: data) {
                        print(coinModel)
                        self.delegate?.didUpdatePrice(coinModel)
                    } else {
                        print("decode failed")
                    }
                }
            }
            task.resume()
        } else {
            print("url error")
        }
    }
    
    func parseJson(data: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let askPrice = decodedData.ask
            let disp_currency = decodedData.display_symbol
            let coinModel = CoinModel(price: askPrice, displayCurrency: disp_currency)
            print(askPrice)
            print(disp_currency)
            return coinModel
        } catch {
            self.delegate?.didFailWithError(error)
            return nil
        }
    }
}


/*
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
 */

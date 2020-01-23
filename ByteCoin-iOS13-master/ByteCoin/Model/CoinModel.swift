//
//  CoinModel.swift
//  ByteCoin
//
//  Created by smuser on 23/01/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel {
    let price : Double
    var priceString : String {
        return "\(price)"
    }
    var displayCurrency : String
    var currency : String {
        let cur = displayCurrency.suffix(3)
        return "\(cur)"
    }
}

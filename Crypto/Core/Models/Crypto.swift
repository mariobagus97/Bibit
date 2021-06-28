//
//  Crypto.swift
//  Crypto
//
//  Created by Muhammad Ario Bagus on 28/04/21.
//

import Foundation

class Crypto {
    
    let cryptoFullName, cryptoName, cryptoPrice, cryptoGainPercentage, cryptoGainValue : String
    var tickerColor : TickerColor = .none
    
    init(cryptoFullName : String, cryptoName : String, cryptoPrice : String, cryptoGainPercentage : String, cryptoGainValue : String) {
        self.cryptoFullName = cryptoFullName
        self.cryptoName = cryptoName
        self.cryptoPrice = cryptoPrice
        self.cryptoGainPercentage = cryptoGainPercentage
        self.cryptoGainValue = cryptoGainValue
        guard let gain = Double(cryptoGainPercentage) else {
            return
        }
        if gain > 0 {
            self.tickerColor = .green
        }
        else if gain < 0 {
            self.tickerColor = .red
        }
    }
}

enum TickerColor {
    case green
    case red
    case none
}

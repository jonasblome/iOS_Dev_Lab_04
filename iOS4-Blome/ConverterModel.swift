//
//  ConverterModel.swift
//  iOS4-Blome
//
//  Created by Jonas Blome on 07.12.22.
//

import Foundation

struct ConverterModel {
    var euro = 0.0
    var euroToDollar = 0.0
    var euroToPound = 0.0
    var dollar: Double {
        get {
            euro * euroToDollar
        }
        set {
            euro = newValue / euroToDollar
        }
    }
    var pound: Double {
        get {
            euro * euroToPound
        }
        set {
            euro = newValue / euroToPound
        }
    }
    
    mutating func getOnlineRates () {
        var urlText : String
        var dollarRate = 0.0
        var poundRate = 0.0
        
        // Retrieving URL content
        if let url = URL(string: "https://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml") {
            if let value = try? String(contentsOf: url, encoding: .utf8) {
                urlText = value
                
                // Searching for dollar rate
                if let value = urlText.range(of: "\"USD\" rate=\"") {
                    // Cut beginning of text
                    var dollarRateString = urlText[value.upperBound...]
                    
                    // Cut end of text
                    if let value = dollarRateString.range(of: "\"") {
                        dollarRateString = dollarRateString[..<value.lowerBound]
                    }
                    
                    // Turn to double
                    if let value = Double(dollarRateString) {
                        dollarRate = value
                    }
                }
                
                // Searching for pound rate
                if let value = urlText.range(of: "\"GBP\" rate=\"") {
                    // Cut beginning of text
                    var poundRateString = urlText[value.upperBound...]
                    
                    // Cut end of text
                    if let value = poundRateString.range(of: "\"") {
                        poundRateString = poundRateString[..<value.lowerBound]
                    }
                    
                    // Turn to double
                    if let value = Double(poundRateString) {
                        poundRate = value
                    }
                }
            }
        }
        
        euroToDollar = dollarRate
        euroToPound = poundRate
    }
}

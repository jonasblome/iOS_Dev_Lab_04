//
//  ConverterViewModel.swift
//  iOS4-Blome
//
//  Created by Jonas Blome on 07.12.22.
//

import Foundation

class ConverterViewModel: ObservableObject {
    @Published private var converter = ConverterModel()
    
    var euroToDollar: String {
        get{
            String(converter.euroToDollar)
        }
        set{
            if let value = Double(newValue) {
                converter.euroToDollar = value
            }
        }
    }
    var euroToPound: String {
        get{
            String(converter.euroToPound)
        }
        set{
            if let value = Double(newValue) {
                converter.euroToPound = value
            }
        }
    }
    var euro: String {
        get{
            String(format: "%.2lf", converter.euro)
        }
        set{
            if let value = Double(newValue) {
                converter.euro = value
            }
        }
    }
    var dollar: String {
        get{
            String(format: "%.2lf", converter.dollar)
        }
        set{
            if let value = Double(newValue) {
                converter.dollar = value
            }
        }
    }
    var pound: String {
        get{
            String(format: "%.2lf", converter.pound)
        }
        set{
            if let value = Double(newValue) {
                converter.pound = value
            }
        }
    }
    
    func getOnlineRates() {
        converter.getOnlineRates()
    }
}

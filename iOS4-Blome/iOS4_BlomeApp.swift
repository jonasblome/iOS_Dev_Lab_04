//
//  iOS4_BlomeApp.swift
//  iOS4-Blome
//
//  Created by Jonas Blome on 07.12.22.
//

import SwiftUI

@main
struct iOS4_BlomeApp: App {
    var body: some Scene {
        WindowGroup {
            ConverterView(converterViewModel: ConverterViewModel())
        }
    }
}

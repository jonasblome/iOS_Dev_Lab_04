//
//  ContentView.swift
//  iOS4-Blome
//
//  Created by Jonas Blome on 07.12.22.
//

import SwiftUI

struct ConverterView: View {
    @ObservedObject var converterViewModel: ConverterViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Euro -> Dollar")
                TextField("Conversion Rate", text: $converterViewModel.euroToDollar)
            }
            HStack {
                Text("Euro -> Pound")
                TextField("Conversion Rate", text: $converterViewModel.euroToPound)
            }
            HStack {
                TextField("€", text: $converterViewModel.euro)
                Text("Euro")
            }
            HStack {
                TextField("$", text: $converterViewModel.dollar)
                Text("Dollar")
            }
            HStack {
                TextField("￡", text: $converterViewModel.pound)
                    .padding(.bottom)
                Text("Pound")
            }
            Button("Get Online Exchange Rates") {
                converterViewModel.getOnlineRates()
            }
            Text("Source of Online Exchange Rates: European Central Bank")
                .foregroundColor(Color.gray)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
        .padding()
    }
}

struct ConverterView_Previews: PreviewProvider {
    static var previews: some View {
        ConverterView(converterViewModel: ConverterViewModel()).environmentObject(ConverterViewModel())
    }
}

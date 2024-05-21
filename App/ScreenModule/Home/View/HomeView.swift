//
//  ContentView.swift
//  Encora-Challenge
//
//  Created by Elderson Laborit on 21/05/24.
//

import SwiftUI
import CoreData

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var amount: String = Constants.emptyString

    var body: some View {
        VStack {
            TextField("Enter amount", text: $amount)
                .keyboardType(.decimalPad)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                if let amount = Double(amount) {
                    viewModel.convertCurrency(amount: amount)
                }
            }) {
                Text("Convert")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            if let errorMessage = viewModel.errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
                    .padding()
            } else {
                Text(viewModel.responseString)
                    .padding()
            }
        }
        .padding()
    }

}


#Preview {
    HomeView()
}

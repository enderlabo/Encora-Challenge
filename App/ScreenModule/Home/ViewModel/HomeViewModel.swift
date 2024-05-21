//
//  MainViewModel.swift
//  Encora-Challenge
//
//  Created by Elderson Laborit on 21/05/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var responseString: String = Constants.emptyString
    @Published var errorMessage: String?
    
    func convertCurrency(amount: Double) {
        requestConvertCurrency(amount: amount) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let responseString):
                    self?.responseString = responseString
                    self?.errorMessage = nil
                case .failure(let error):
                    self?.responseString = Constants.emptyString
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}

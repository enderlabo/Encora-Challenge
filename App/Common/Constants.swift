//
//  Constants.swift
//  Encora-Challenge
//
//  Created by Elderson Laborit on 21/05/24.
//

import UIKit

struct Constants {
    static let accountID = "freelannce211519878"
    static let apiKey: String = "hpvq62o346e7qkv39cehbfhkuc"
    static let baseUrl: String = "https://xecdapi.xe.com/v1/convert_from"
    static let unauthorized = "Unauthorized access. Please check your credentials."
    static let forbidden = "Forbidden access. You do not have permission to access this resource."
    static let notFound = "Resource not found. Please check the URL or the resource you are trying to access."
    static let tooManyRequests = "Too many requests. Please try again later."
    static let serverError = "Internal server error. Please try again later."
    static let notModified = "The resource has not been modified since the last request."
    static let unknownError = "Received unknown error with status code"
    static let invalidCredentials = "Failed to encode credentials."
    static let invalidURL = "Invalid URL."
    static let invalidResponse = "Invalid response from server."
    static let decodingError = "Failed to decode the response data."
    
    static let convertTo = "to"
    static let currencyValue = "PEN"
    static let currencyAmount = "amount"
    static let httpMethodGET = "GET"
    static let basic = "Basic"
    static let emptyString = ""
    static let authorization = "Authorization"
}

//
//  ApiError.swift
//  Encora-Challenge
//
//  Created by Elderson Laborit on 21/05/24.
//

import Foundation

enum APIError: Error, LocalizedError {
    case unauthorized 
    case forbidden
    case notFound
    case tooManyRequests
    case serverError
    case notModified
    case unknownError(statusCode: Int)
    case invalidCredentials
    case invalidURL
    case invalidResponse
    case decodingError
    
    var errorDescription: String? {
        switch self {
        case .unauthorized:
            return Constants.unauthorized
        case .forbidden:
            return Constants.forbidden
        case .notFound:
            return Constants.notFound
        case .tooManyRequests:
            return Constants.tooManyRequests
        case .serverError:
            return Constants.serverError
        case .notModified:
            return Constants.notModified
        case .unknownError(let statusCode):
            return Constants.unknownError + "\(statusCode)."
        case .invalidCredentials:
            return Constants.invalidCredentials
        case .invalidURL:
            return Constants.invalidURL
        case .invalidResponse:
            return Constants.invalidResponse
        case .decodingError:
            return Constants.decodingError
        }
    }
}

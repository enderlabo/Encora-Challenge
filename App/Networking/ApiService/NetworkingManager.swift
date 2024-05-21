//
//  NetworkingManager.swift
//  Encora-Challenge
//
//  Created by Elderson Laborit on 21/05/24.
//

import Foundation

func requestConvertCurrency(amount: Double, completion: @escaping (Result<String, Error>) -> Void) {
    let accountID = Constants.accountID
    let apiKey = Constants.apiKey
    
    let credentials = "\(accountID):\(apiKey)"
    
        guard let encodedCredentials = credentials.data(using: .utf8)?.base64EncodedString() else {
            completion(.failure(APIError.invalidCredentials))
            return
        }
        
    var components = URLComponents(string: Constants.baseUrl)
        components?.queryItems = [
            URLQueryItem(name: Constants.convertTo, value: Constants.currencyValue),
            URLQueryItem(name: Constants.currencyAmount, value: "\(amount)")
        ]
        
        guard let url = components?.url else {
            completion(.failure(APIError.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
    request.httpMethod = Constants.httpMethodGET
        
    request.setValue(Constants.basic + " \(encodedCredentials)", forHTTPHeaderField: Constants.authorization)
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(APIError.invalidResponse))
                return
            }
            
            switch httpResponse.statusCode {
            case 200...299:
                break
            case 304:
                completion(.failure(APIError.notModified))
                return
            case 401:
                completion(.failure(APIError.unauthorized))
                return
            case 403:
                completion(.failure(APIError.forbidden))
                return
            case 404:
                completion(.failure(APIError.notFound))
                return
            case 429:
                completion(.failure(APIError.tooManyRequests))
                return
            case 500:
                completion(.failure(APIError.serverError))
                return
            default:
                completion(.failure(APIError.unknownError(statusCode: httpResponse.statusCode)))
                return
            }
            
            guard let data = data, let responseString = String(data: data, encoding: .utf8) else {
                completion(.failure(APIError.decodingError))
                return
            }
            
            completion(.success(responseString))
        }
        
    task.resume()
    }

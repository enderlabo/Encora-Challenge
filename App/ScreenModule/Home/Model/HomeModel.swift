//
//  MainModel.swift
//  Encora-Challenge
//
//  Created by Elderson Laborit on 21/05/24.
//
import Foundation

// MARK: - Response
struct Response: Codable {
    let terms: String
    let privacy: String
    let from: String
    let amount: Int
    let timestamp: Date
    let to: [To]
}

// MARK: - To
struct To: Codable {
    let quotecurrency: String
    let mid: Double
}

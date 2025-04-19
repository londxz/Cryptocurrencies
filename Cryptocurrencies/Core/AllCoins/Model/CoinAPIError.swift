//
//  CoinAPIError.swift
//  Cryptocurrencies
//
//  Created by Родион Холодов on 19.04.2025.
//

import Foundation

enum CoinAPIError: Error {
    case jsonParsingFailure
    case requestFailed(description: String)
    case invalidStatusCode(statusCode: Int)
    case unknownError(error: Error)
    
    var customDescription: String {
        switch self {
        case .jsonParsingFailure: return "Failed to parse JSON"
        case .requestFailed(let description): return "Request failed: \(description)"
        case .invalidStatusCode(let statusCode): return "Invalid status code: \(statusCode)"
        case .unknownError(let error): return "An unknown error: \(error.localizedDescription)"
        }
    }
}

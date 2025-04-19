//
//  CoinModel.swift
//  Cryptocurrencies
//
//  Created by Родион Холодов on 18.04.2025.
//

import Foundation

struct CoinModel: Codable, Identifiable {
    let id: String
    let symbol: String
    let name: String
    let currentPrice: Double
    let marketCapRank: Int
    let image: String
    let high: Double
    let low: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case symbol
        case name
        case currentPrice = "current_price"
        case marketCapRank = "market_cap_rank"
        case image
        case high = "high_24h"
        case low = "low_24h"
    }
}

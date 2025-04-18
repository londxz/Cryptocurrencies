//
//  CoinModel.swift
//  Cryptocurrencies
//
//  Created by Родион Холодов on 18.04.2025.
//

import Foundation

struct CoinModel: Codable, Identifiable {
    let id: String
    let name: String
    let price: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case price = "current_price"
    }
}

//
//  CoinDataService.swift
//  Cryptocurrencies
//
//  Created by Родион Холодов on 18.04.2025.
//

import Foundation

class CoinDataService {
    func fetchCoins() async throws -> [CoinModel] {
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&per_page=20"
    
        guard let url = URL(string: urlString) else {
            throw CoinAPIError.requestFailed(description: "Invalid URL")
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw CoinAPIError.requestFailed(description: "Request failed")
            }
            
            guard httpResponse.statusCode == 200 else {
                throw CoinAPIError.invalidStatusCode(statusCode: httpResponse.statusCode)
            }
            
            guard let coins = try? JSONDecoder().decode([CoinModel].self, from: data) else {
                throw CoinAPIError.jsonParsingFailure
            }
            return coins
        
        } catch {
            throw CoinAPIError.unknownError(error: error)
        }
    }
}

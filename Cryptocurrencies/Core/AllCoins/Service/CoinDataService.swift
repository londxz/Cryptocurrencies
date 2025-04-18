//
//  CoinDataService.swift
//  Cryptocurrencies
//
//  Created by Родион Холодов on 18.04.2025.
//

import Foundation

class CoinDataService {
    
    func fetchCoins(completion: @escaping([CoinModel]) -> ()) {
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&per_page=20"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            do {
                let coins = try JSONDecoder().decode([CoinModel].self, from: data)
                completion(coins)
            } catch {
                print("DEGUG: Failed to decode JSON \(error.localizedDescription)")
                completion([])
            }
        }.resume()
    }
}

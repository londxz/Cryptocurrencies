//
//  CoinDataService.swift
//  Cryptocurrencies
//
//  Created by Родион Холодов on 18.04.2025.
//

import Foundation

class CoinDataService {
    
    func fetchCoinsWithResult(completion: @escaping(Result<[CoinModel], Error>) -> ()) {
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&per_page=20"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else { return }
            
            do {
                let coins = try JSONDecoder().decode([CoinModel].self, from: data)
                completion(.success(coins))
            } catch {
                print("DEGUG: Failed to decode JSON \(error.localizedDescription)")
                completion(.failure(error))
            }
        }.resume()
    }
}

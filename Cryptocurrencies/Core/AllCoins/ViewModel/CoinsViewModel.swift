//
//  CoinsViewModel.swift
//  Cryptocurrencies
//
//  Created by Родион Холодов on 18.04.2025.
//

import Foundation

class CoinsViewModel: ObservableObject {
    
    @Published var coins = [CoinModel]()
    
    private let service = CoinDataService()
    
    init() {
        service.fetchCoins { coins in
            DispatchQueue.main.async {
                self.coins = coins
            }
        }
    }
}

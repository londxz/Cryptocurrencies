//
//  CoinsViewModel.swift
//  Cryptocurrencies
//
//  Created by Родион Холодов on 18.04.2025.
//

import Foundation

class CoinsViewModel: ObservableObject {
    
    @Published var coins = [CoinModel]()
    @Published var errorMessage: String?
    
    private let service = CoinDataService()
    
    init() {
        service.fetchCoinsWithResult { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let coins):
                    self.coins = coins
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}

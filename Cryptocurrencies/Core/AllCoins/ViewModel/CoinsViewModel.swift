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
        Task { try await fetchCoins() }
    }
    
    @MainActor
    func fetchCoins() async throws {
        do {
            coins = try await service.fetchCoins()
        } catch let error as CoinAPIError {
            errorMessage = error.customDescription
        }
    }
}

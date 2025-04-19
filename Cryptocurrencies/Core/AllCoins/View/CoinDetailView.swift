//
//  CoinDetailView.swift
//  Cryptocurrencies
//
//  Created by Родион Холодов on 19.04.2025.
//

import Foundation
import SwiftUI
import Kingfisher

struct CoinDetailView: View {
    
    let coin: CoinModel
    
    var body: some View {
        VStack(spacing: 20) {
            KFImage(URL(string: coin.image))
                .placeholder {
                    ProgressView()
                        .frame(width: 40, height: 40)
                }
                .fade(duration: 0.3)
                .resizable()
                .frame(width: 150, height: 150)
                
            VStack(spacing: 10) {
                Text("TOP #\(coin.marketCapRank)")
                    .font(.headline)
                Text("Price: $\(coin.currentPrice.trimmed)")
                Text("24h high: $\(coin.high.trimmed)")
                Text("24h low: $\(coin.low.trimmed)")
            }
        }
        .navigationTitle(coin.name)
        
    }
}

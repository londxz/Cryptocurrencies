//
//  ContentView.swift
//  Cryptocurrencies
//
//  Created by Родион Холодов on 18.04.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CoinsViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.coins) { coin in
                HStack(spacing: 12) {
                    Text("\(coin.marketCapRank)")
                        .foregroundStyle(.gray)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("\(coin.name)")
                            .font(.headline)
                        Text("\(coin.symbol.uppercased())")
                    }
                }
                .font(.footnote)
            }
        }
        .overlay {
            if let error = viewModel.errorMessage {
                Text(error)
            }
        }
    }
}

#Preview {
    ContentView()
}

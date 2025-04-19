//
//  ContentView.swift
//  Cryptocurrencies
//
//  Created by Родион Холодов on 18.04.2025.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @StateObject var viewModel = CoinsViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.coins) { coin in
                    NavigationLink(destination: CoinDetailView(coin: coin)) {
                        HStack(spacing: 12) {
                            Text("\(coin.marketCapRank)")
                                .foregroundStyle(.gray)
                            KFImage(URL(string: coin.image))
                                .placeholder {
                                    ProgressView()
                                        .frame(width: 40, height: 40)
                                }
                                .fade(duration: 0.3)
                                .resizable()
                                .frame(width: 40, height: 40)
                                
                            VStack(alignment: .leading, spacing: 5) {
                                Text("\(coin.name)")
                                    .font(.headline)
                                Text("\(coin.symbol.uppercased())")
                            }
                        }
                        .font(.footnote)
                    }
                }
            }
            .overlay {
                if let error = viewModel.errorMessage {
                    Text(error)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

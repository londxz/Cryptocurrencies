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
                Text(coin.name)
            }
        }
    }
}

#Preview {
    ContentView()
}

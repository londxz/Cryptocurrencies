//
//  DoubleExtension.swift
//  Cryptocurrencies
//
//  Created by Родион Холодов on 19.04.2025.
//

extension Double {
    var trimmed: String {
        var string = String(self)
        while string.contains(".") && string.last == "0" {
            string.removeLast()
        }
        if string.last == "." {
            string.removeLast()
        }
        return string
    }
}

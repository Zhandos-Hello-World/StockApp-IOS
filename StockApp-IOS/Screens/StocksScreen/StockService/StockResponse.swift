//
//  StockResponse.swift
//  StockApp-IOS
//
//  Created by Zhandos Baimurat on 21.11.2022.
//

import Foundation

struct StockItem: Decodable  {
    let id: String
    let symbol: String
    let name: String
    let image: String
    let price: Double
    let change: Double
    let changePercentage: Double
    
    func getPrice() -> String {
        return formatForChange(price)
    }
    
    func showChange() -> String {
        return "\(formatForChange(change)) \(formatForPercentageChange(changePercentage))"
    }
    
    private func formatForPercentageChange(_ number: Double) -> String {
        var temp = number
        lengthFormat(&temp)
        
        var tempString = String(temp)
        tempString = "(\(tempString.replacingOccurrences(of: ".", with: ","))%)"
        return tempString
    }
    
    private func formatForChange(_ number: Double) -> String {
        var temp = number
        lengthFormat(&temp)
        
        var tempString = String(temp)
        if temp > 0 {
            tempString = "+$\(tempString)"
        }
        
        else if temp < 0 {
            tempString = "-$\(tempString.suffix(tempString.count - 1))"
        }
        
        return tempString
    }
    
    private func lengthFormat(_ number: inout Double) {
        guard let n = Double(String(format: "%.2f", number)) else {
            return
        }
        number = n
    }

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case price = "current_price"
        case change = "price_change_24h"
        case changePercentage = "price_change_percentage_24h"
    }
}

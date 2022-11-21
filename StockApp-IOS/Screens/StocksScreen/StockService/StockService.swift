//
//  StockService.swift
//  StockApp-IOS
//
//  Created by Zhandos Baimurat on 21.11.2022.
//

import Foundation

protocol StockServiceProtocol {
    
    func getStocks(currency: String, count: String,  completion: @escaping (Result<[StockItem], NetworkError>) -> Void)
    
    func getStocks(currency: String, completion: @escaping (Result<[StockItem], NetworkError>) -> Void)
    
    func getStocks(completion: @escaping (Result<[StockItem], NetworkError>) -> Void)
    
}


class StockService: StockServiceProtocol {
    private let service: NetworkService
    
    
    init (service: NetworkService) {
        self.service = service
    }
    
    func getStocks(currency: String, count: String,  completion: @escaping (Result<[StockItem], NetworkError>) -> Void) {
        service.execute(with: StockRouter.stocks(currency: currency, count: count), completion: completion)
    }
}




extension StockServiceProtocol {

    func getStocks(currency: String, completion: @escaping (Result<[StockItem], NetworkError>) -> Void) {
        getStocks(currency: currency, count: "100", completion: completion)
    }
    
    
    func getStocks(completion: @escaping (Result<[StockItem], NetworkError>) -> Void) {
        getStocks(currency: "usd", completion: completion)
    }
}


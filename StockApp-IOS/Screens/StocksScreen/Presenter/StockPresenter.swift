//
//  StockPresenter.swift
//  StockApp-IOS
//
//  Created by Zhandos Baimurat on 21.11.2022.
//

import Foundation

protocol StockViewProtocol: AnyObject {
    func updateView()
    
    func updateView(withLoader isLoading: Bool)
    
    func updateView(withError message: String)
}


protocol StockPresenterProtocol {

    var itemsCount: Int { get }
    
    func loadView()
    
    func model(for indexPath: IndexPath) -> StockItemModelProtocol
    
}


class StockPresenter: StockPresenterProtocol {
    private var stocks: [StockItemModel] = []
    private let service: StockServiceProtocol
    weak var view: StockViewProtocol?
    var itemsCount: Int { stocks.count }
    
    
    init(service: StockServiceProtocol) {
        self.service = service
    }
    
    
    func loadView() {
        service.getStocks { [weak self] result in
            self?.view?.updateView(withLoader: true)
            
            switch result {
            case .success(let stocks):
                self?.stocks = stocks.map { StockItemModel(stock: $0) }
                self?.view?.updateView()
            case .failure(let message):
                self?.view?.updateView(withError: message.localizedDescription)
            }
        }
    }
    
    func model(for indexPath: IndexPath) -> StockItemModelProtocol {
        stocks[indexPath.row]
    }
}


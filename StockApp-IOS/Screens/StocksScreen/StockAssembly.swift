//
//  StockAssembly.swift
//  StockApp-IOS
//
//  Created by Zhandos Baimurat on 21.11.2022.
//

import Foundation
import UIKit

final class StockAssembly {
    static let assembler: StockAssembly = .init()
    private init() {}
    
    private lazy var network: NetworkService = Network()
    private lazy var stockService: StockServiceProtocol = StockService(service: network)
    
    
    func stockVC() -> UIViewController {
        let presenter = StockPresenter(service: stockService)
        let view = StockViewController(presenter: presenter)
        presenter.view = view
        return view
    }
    
}

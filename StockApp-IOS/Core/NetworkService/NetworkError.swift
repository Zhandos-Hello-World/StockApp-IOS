//
//  NetworkError.swift
//  StockApp-IOS
//
//  Created by Zhandos Baimurat on 21.11.2022.
//

import Foundation


enum NetworkError: Error {
    case missingUrl
    case taskError
    case responseError
    case dataError
    case decodeError
}

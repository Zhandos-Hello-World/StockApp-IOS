//
//  NetworkService.swift
//  StockApp-IOS
//
//  Created by Zhandos Baimurat on 21.11.2022.
//

import Foundation

protocol NetworkService {
    func execute<T: Decodable>(with router: Router, completion: @escaping (Result<T, NetworkError>) -> Void)
}

final class Network: NetworkService {
    private let session = URLSession(configuration: .default)
    
    func execute<T>(with router: Router, completion: @escaping (Result<T, NetworkError>) -> Void) where T: Decodable {
        call(with: router) { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
    
    
    private func call<T>(with router: Router, completion: @escaping (Result<T, NetworkError>) -> Void) where T: Decodable {
        guard let request = try? router.request() else {
            completion(.failure(NetworkError.missingUrl))
            return
        }
        
        let task = session.dataTask(with: request) { data, response, error in
            if let _ = error {
                completion(.failure(NetworkError.taskError))
                return
            }
            
            guard let response = response as? HTTPURLResponse, case (200...299) = response.statusCode else {
                completion(.failure(NetworkError.responseError))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.dataError))
                return
            }
            
            guard let decodeResult = try? JSONDecoder().decode(T.self, from: data) else {
                completion(.failure(NetworkError.decodeError))
                return
            }
            
            completion(.success(decodeResult))
        }
        task.resume()
    }
}

//
//  Network Helper.swift
//  UserDefaultsProj
//
//  Created by Kevin Natera on 9/27/19.
//  Copyright © 2019 Kevin Natera. All rights reserved.
//

import Foundation

enum ErrorHandling: Error {
    case badURL
    case decodingError
    case noData
}

class NetworkHelper {
    private init () {}
    
    static let shared = NetworkHelper()
    
    
    func getData(urlString: String, completionHandler: @escaping (Result<Data, Error>) -> Void){
        
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(ErrorHandling.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                completionHandler(.failure(ErrorHandling.noData))
                return
            }
            
            guard let data = data else {
                completionHandler(.failure(ErrorHandling.noData))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completionHandler(.failure(ErrorHandling.badURL))
                return
            }
            
            switch response.statusCode {
            case 404:
                completionHandler(.failure(ErrorHandling.noData))
            case 401,403:
                completionHandler(.failure(ErrorHandling.badURL))
            case 200...299:
                completionHandler(.success(data))
            default:
                completionHandler(.failure(ErrorHandling.decodingError))
            }
            }.resume()
    }
}

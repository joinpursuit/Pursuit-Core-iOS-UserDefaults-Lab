//
//  AstrologyAPI.swift
//  UserDefaults
//
//  Created by Cameron Rivera on 1/13/20.
//  Copyright © 2020 Cameron Rivera. All rights reserved.
//

import Foundation

struct HoroscopeAPI{
    static func getHoroscope(from urlString: String, completion: @escaping (Result<Horoscope,NetworkError>) -> ()){
        guard let url = URL(string: urlString) else {
            completion(.failure(.badURL(urlString)))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { result in
            switch result{
            case .failure(let netError):
                completion(.failure(.networkClientError(netError)))
            case .success(let data):
                do{
                    let horror = try JSONDecoder().decode(Horoscope.self, from: data)
                    completion(.success(horror))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}

//
//  HoroscopeAPIClient.swift
//  HoroscopeApp
//
//  Created by Liubov Kaper  on 1/13/20.
//  Copyright © 2020 Luba Kaper. All rights reserved.
//

import Foundation

struct HoroscopeAPIClient {
    static func fetchHoroscope(for sign: String, completion: @escaping (Result<Horoscope, AppError>) ->()) {
        
    
       let horoscopeEndpointURL = "http://sandipbgt.com/theastrologer/api/horoscope/\(sign)/today"
        
        guard let url = URL(string: horoscopeEndpointURL) else {
            completion(.failure(.badURL(horoscopeEndpointURL)))
            return
        }
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let horoscopes = try JSONDecoder().decode(Horoscope.self, from: data)
                    completion(.success(horoscopes))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}

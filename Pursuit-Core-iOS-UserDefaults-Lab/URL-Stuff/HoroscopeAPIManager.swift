//
//  HoroscopeAPIManager.swift
//  Pursuit-Core-iOS-UserDefaults-Lab
//
//  Created by Krystal Campbell on 9/25/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import Foundation

class HoroscopeAPIManager {
    private init(){}
    static let shared = HoroscopeAPIManager()
    
    func getHoroscopes(showSign: String, completionHandler: @escaping (Result<Horoscope, AppError>) -> Void){
        
        let urlStr = "http://sandipbgt.com/theastrologer/api/horoscope/\(showSign)/today "
        
        guard let url = URL(string: urlStr) else {
            completionHandler(.failure(.badURL))
            return
        }
        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get) {(result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                do {
                    let horoscopeInfo = try JSONDecoder().decode(Horoscope.self, from: data)
                    completionHandler(.success(horoscopeInfo))
                } catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
            }
        }
    }
}

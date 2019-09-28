//
//  HoroscopeAPIClient.swift
//  UserDefaults
//
//  Created by Michelle Cueva on 9/24/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import Foundation

struct  HoroscopeAPIHelper {
    private init() {}
    
    static var shared = HoroscopeAPIHelper()
    
    func getUrl(str:String) -> String {
        return "http://sandipbgt.com/theastrologer/api/horoscope/\(str)/today/"
    }
    
 
    mutating func getHoroscope(sunSign: String, completionHandler: @ escaping (Result<Horoscope, AppError>) -> ()) {
        
        
        NetworkManager.shared.fetchData(urlString: getUrl(str: sunSign)) {
            (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                do {
                    let horoscopeInfo = try Horoscope.getHoroscope(from: data)
                    completionHandler(.success(horoscopeInfo))
                    
                } catch {
                    completionHandler(.failure(.badURL))
                }
            }
        }
    }
}

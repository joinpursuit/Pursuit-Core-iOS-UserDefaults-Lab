//
//  HoroscopeAPIClient.swift
//  UserDefaultsProj
//
//  Created by Kevin Natera on 9/27/19.
//  Copyright © 2019 Kevin Natera. All rights reserved.
//

import Foundation

class HoroscopeAPIHelper {
   private init() {}
   
   static let shared = HoroscopeAPIHelper()

    func getHoroscope(sign: String, completionHandler: @escaping (Result<Horoscope,ErrorHandling>) -> () ) {
   let urlStr = "http://sandipbgt.com/theastrologer/api/horoscope/\(sign)/today/"
  
   NetworkHelper.shared.getData(urlString: urlStr) { (result) in
       switch result {
       case .failure(let error):
           print(error)
       case .success(let data):
           do {
            let horoscopeInfo = try JSONDecoder().decode(Horoscope.self, from: data)
               completionHandler(.success(horoscopeInfo))
           } catch {
               completionHandler(.failure(.decodingError))
           }
       }
   }
 }
}

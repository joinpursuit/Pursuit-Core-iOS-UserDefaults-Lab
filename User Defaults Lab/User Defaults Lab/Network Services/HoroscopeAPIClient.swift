//
//  HoroscopeAPIClient.swift
//  User Defaults Lab
//
//  Created by Bienbenido Angeles on 1/13/20.
//  Copyright © 2020 Bienbenido Angeles. All rights reserved.
//

import Foundation

struct HoroscopeAPIClient {
    static func getHoroscope (horoscope: String, completion: @escaping (Result<[HoroscopeSign], AppError>)->()){
        let endPointUrl = "http://sandipbgt.com/theastrologer/api/horoscope/all/today"
        guard let url = URL(string: endPointUrl) else {
            completion(.failure(.badURL(endPointUrl)))
            return
        }
        let request = URLRequest(url: url)
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result{
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do{
                    let horoscopes = try  JSONDecoder().decode([HoroscopeSign].self, from: data)
                    completion(.success(horoscopes))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}

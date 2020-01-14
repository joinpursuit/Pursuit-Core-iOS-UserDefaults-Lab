//
//  NetworkError.swift
//  UserDefaults
//
//  Created by Cameron Rivera on 1/13/20.
//  Copyright © 2020 Cameron Rivera. All rights reserved.
//

import Foundation

enum NetworkError: Error{
    case badURL(String)
    case decodingError(Error)
    case encodingError(Error)
    case noData
    case noResponse
    case networkClientError(Error)
    case badStatusCode(Int)
}

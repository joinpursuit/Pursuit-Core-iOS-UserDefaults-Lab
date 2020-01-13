//
//  Horoscope.swift
//  UserDefaults
//
//  Created by Cameron Rivera on 1/13/20.
//  Copyright © 2020 Cameron Rivera. All rights reserved.
//

import Foundation

struct Horoscope: Decodable{
    let sunsign: String
    let date: String
    let horoscope: String
    let meta: MetaData
}

struct MetaData: Decodable{
    let mood: String
    let keywords: String
    let intensity: String
}

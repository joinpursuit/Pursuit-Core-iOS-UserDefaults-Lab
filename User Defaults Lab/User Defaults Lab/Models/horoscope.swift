//
//  horoscope.swift
//  User Defaults Lab
//
//  Created by Bienbenido Angeles on 1/13/20.
//  Copyright © 2020 Bienbenido Angeles. All rights reserved.
//

import Foundation

struct HoroscopeSign: Decodable {
    let sunsign: String
    let horoscope: String
    let meta: MetaData
}

struct MetaData: Decodable {
    let mood: String
    let keyword: String
    let intensity: String
}

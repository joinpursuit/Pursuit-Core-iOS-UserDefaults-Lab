//
//  HoroscopeModel.swift
//  HoroscopeApp
//
//  Created by Liubov Kaper  on 1/13/20.
//  Copyright © 2020 Luba Kaper. All rights reserved.
//

import Foundation

struct Horoscope: Decodable {
    let sunsign: String
    let horoscope: String
}

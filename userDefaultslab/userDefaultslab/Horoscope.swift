//
//  Horoscope.swift
//  userDefaultslab
//
//  Created by Ahad Islam on 12/25/19.
//  Copyright © 2019 Ahad Islam. All rights reserved.
//

import Foundation

// MARK: - Element
struct Horoscope: Codable {
    let sunsign, credit, date, horoscope: String
    let meta: Meta
}

// MARK: - Meta
struct Meta: Codable {
    let mood, keywords, intensity: String
}

//
//  Sign.swift
//  userDefaultslab
//
//  Created by Ahad Islam on 12/25/19.
//  Copyright © 2019 Ahad Islam. All rights reserved.
//

import Foundation

enum Sign: String {
    case aries
    case taurus
    case gemini
    case cancer
    case leo
    case virgo
    case libra
    case scorpio
    case saggitarius
    case capricorn
    case aquarius
    case pisces
    
    static func getSign(_ num: Int) -> Sign {
        switch num {
        case 321...419:
            return aries
        case 420...520:
            return taurus
        case 521...620:
            return gemini
        case 621...722:
            return cancer
        case 723...822:
            return leo
        case 823...922:
            return virgo
        case 923...1022:
            return libra
        case 1023...1121:
            return scorpio
        case 1122...1221:
            return saggitarius
        case 120...218:
            return aquarius
        case 219...320:
            return pisces
        default:
            return capricorn
        }
    }
}

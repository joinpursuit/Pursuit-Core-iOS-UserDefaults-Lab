//
//  UserPreferences.swift
//  UserDefaults
//
//  Created by Cameron Rivera on 1/13/20.
//  Copyright © 2020 Cameron Rivera. All rights reserved.
//

import Foundation

enum Sunsign: String{
    case aries = "aries"
    case tauros = "tauros"
    case gemini = "gemini"
    case cancer = "cancer"
    case leo = "leo"
    case virgo = "virgo"
    case libra = "libra"
    case scorpio = "scorpio"
    case sagittarius = "sagittarius"
    case capricorn = "capricorn"
    case aquarius = "aquarius"
    case pisces = "pisces"
}

struct UserPreferenceKey{
    static let sign = "Horoscope Settings"
    static let name = "Username"
}

class UserPreferences{
    static let shared = UserPreferences()
    private var sign = Sunsign.aries
    private init(){
        
    }
    
    func saveHoroscope(using userData: UserData) {
        UserDefaults.standard.set(userData.sign.rawValue, forKey: UserPreferenceKey.sign)
        UserDefaults.standard.set(userData.name, forKey: UserPreferenceKey.name)
    }
    
    func getHoroscope() -> UserData?{
        if let name = UserDefaults.standard.object(forKey: UserPreferenceKey.name) as? String, let sign = UserDefaults.standard.object(forKey: UserPreferenceKey.sign) as? String{
            return UserData(name: name, sign: Sunsign(rawValue: sign) ?? Sunsign.aquarius)
        }
        return nil
    }
    
}

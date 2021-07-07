//
//  UserPreferences.swift
//  HoroscopeApp
//
//  Created by Liubov Kaper  on 1/13/20.
//  Copyright © 2020 Luba Kaper. All rights reserved.
//

import Foundation

struct UserPreferenceKey {
    static let horoscopeText = "Horoscope Text"
    static let userName = "Name"
    static let userSign = "Sign"
}
class UserPreference {
    
    private init() {}
    
    static let shared = UserPreference()
    
    func updateHoroscope(with horoscope: String) {
        
        UserDefaults.standard.set(horoscope, forKey: UserPreferenceKey.horoscopeText)
    }
    
    func getHoroscope() -> String? {
        guard let horoscope = UserDefaults.standard.object(forKey: UserPreferenceKey.horoscopeText) as? String else {
            return nil
        }
        return horoscope
    }
    
    func updateName(with name: String) {
        UserDefaults.standard.set(name, forKey: UserPreferenceKey.userName)
    }
    
    func getName() -> String? {
        guard let name = UserDefaults.standard.object(forKey: UserPreferenceKey.userName) as? String else {
            return nil
        }
        return name
    }
    func updateSign(with sign: String) {
        UserDefaults.standard.set(sign, forKey: UserPreferenceKey.userSign)
    }
    
    func getSign() -> String? {
        guard let sign = UserDefaults.standard.object(forKey: UserPreferenceKey.userSign) as? String else {
            return nil
        }
        return sign
    }
}

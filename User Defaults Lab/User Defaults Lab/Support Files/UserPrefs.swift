//
//  UserPrefs.swift
//  User Defaults Lab
//
//  Created by Bienbenido Angeles on 1/13/20.
//  Copyright © 2020 Bienbenido Angeles. All rights reserved.
//

import Foundation

struct UserPrefenceKey {
    static let name = "Name"
    static let horoscopes = "Horoscopes"
    static let dateOfBirth = "Date Of Birth"
}

class UserPreferences{
    
    private init(){}
    private let standard = UserDefaults.standard
    static let shared = UserPreferences()
    
    func storeName(with name: String){
        standard.set(name, forKey: UserPrefenceKey.name)
    }
    
    func getName() -> String?{
        guard let name = standard.value(forKey: UserPrefenceKey.name) as? String else { return nil }
        return name
    }
    
    func storeHoroscope (with horoscope: Int) {
        standard.set(horoscope, forKey: UserPrefenceKey.horoscopes)
    }
    
    func getHoroscope() -> Int? {
        guard let horoscope = standard.value(forKey: UserPrefenceKey.horoscopes) as? Int else { return nil }
        return horoscope
    }
    
    func storeDate(with date: Date){
        standard.set(date, forKey: UserPrefenceKey.dateOfBirth)
    }
    
    func getDate() -> Date?{
        guard let date = standard.value(forKey: UserPrefenceKey.dateOfBirth) as? Date? else { return nil }
        return date
    }
}

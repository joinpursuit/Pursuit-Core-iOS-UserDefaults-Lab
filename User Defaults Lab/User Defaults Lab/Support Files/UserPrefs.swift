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
    
    func store<T>(with obj: T, UserPrefKey: String){
        standard.set(obj, forKey: UserPrefKey)
    }
    
    func get<T>(UserPrefKey: String) -> T?{
        guard let obj = standard.object(forKey: UserPrefKey) as? T else {
            return nil
        }
        return obj
    }
}

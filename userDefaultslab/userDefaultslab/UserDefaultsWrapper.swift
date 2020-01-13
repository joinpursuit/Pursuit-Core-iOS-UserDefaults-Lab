//
//  UserDefaultsWrapper.swift
//  userDefaultslab
//
//  Created by Ahad Islam on 12/25/19.
//  Copyright © 2019 Ahad Islam. All rights reserved.
//

import Foundation

class UserDefaultsWrapper {
    
    static let helper = UserDefaultsWrapper()
    
    private let usernameKey = "username"
    private let birthdateKey = "birthdate"
    
    private init () {}
    
    func store(username: String) {
        UserDefaults.standard.set(username, forKey: usernameKey)
    }
    
    func store(date: Date) {
        UserDefaults.standard.set(date, forKey: birthdateKey)
    }
    
    func getUsername() -> String? {
        UserDefaults.standard.string(forKey: usernameKey)
    }
    
    func getBirthDate() -> Date? {
        UserDefaults.standard.value(forKey: birthdateKey) as? Date
    }
    
}

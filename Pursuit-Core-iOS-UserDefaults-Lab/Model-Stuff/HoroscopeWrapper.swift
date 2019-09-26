//
//  HoroscopeWrapper.swift
//  Pursuit-Core-iOS-UserDefaults-Lab
//
//  Created by Krystal Campbell on 9/25/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import Foundation

class UserDefaultsWrapper {

    static let manager = UserDefaultsWrapper()
    
    func store(userName: String) {
        UserDefaults.standard.set(userName, forKey: usernameKey)
        
    }
    
    func getUsername() -> String? {
        return UserDefaults.standard.value(forKey: usernameKey) as? String
    }
    
    
    private init() {}
    
    private let usernameKey = "userName"
  
}

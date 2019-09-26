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

    func store(sunSign: String){
        UserDefaults.standard.set(sunSign, forKey: sunSignKey)
    }
    
    func getUsername() -> String? {
        return UserDefaults.standard.value(forKey: usernameKey) as? String
    }
    
    func getSunSign() -> String? {
        return UserDefaults.standard.value(forKey: sunSignKey) as? String
    }
    
    //func store()
//    func getBirthday() -> String? {
//        
//    }
//    
    
    private init() {}
    
    private let usernameKey = "userName"
  
    private let sunSignKey = "sunSign"
    
    private let birthdayKey = "birthday"
}

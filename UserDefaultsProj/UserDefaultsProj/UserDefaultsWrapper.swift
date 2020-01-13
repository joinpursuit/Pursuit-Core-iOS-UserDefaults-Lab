//
//  UserDefaultsWrapper.swift
//  UserDefaultsProj
//
//  Created by Kevin Natera on 9/24/19.
//  Copyright © 2019 Kevin Natera. All rights reserved.
//

import Foundation
import UIKit

class UserDefaultsWrapper {
    
    static let wrapper = UserDefaultsWrapper()
    
    
    func getUserName() -> String? {
        return UserDefaults.standard.value(forKey: userNameKey) as? String
    }
    
    func getBirthday() -> Date? {
        return UserDefaults.standard.value(forKey: birthdayKey) as? Date
    }
    
    func getSign() -> String? {
        return UserDefaults.standard.value(forKey: signKey) as? String
    }
    
    func store(userName: String) {
         UserDefaults.standard.set(userName, forKey: userNameKey)
    }
    
    func store(birthday: Date)  {
        UserDefaults.standard.set(birthday, forKey: birthdayKey)
        print(birthday)
    }
    
    func store(sign: String) {
        UserDefaults.standard.set(sign, forKey: signKey)
    }
    
    private let userNameKey = "userName"
    private let birthdayKey = "birthday"
    private let signKey = "sign"
}

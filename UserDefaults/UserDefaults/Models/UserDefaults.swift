//
//  UserDefaults.swift
//  UserDefaults
//
//  Created by Michelle Cueva on 9/24/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import Foundation

class UserDefaultsWrapper {
    static let shared = UserDefaultsWrapper()
    
    // Mark: getter
    func getBirthday() -> Date? {
        return UserDefaults.standard.value(forKey: userBirthdayKey) as? Date
    }
    
    //Mark:Setter
    
    func store(birthday: Date) {
        UserDefaults.standard.set(birthday, forKey: userBirthdayKey)
    }
    
    
    private let userBirthdayKey = "birthday"
}

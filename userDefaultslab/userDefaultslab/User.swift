//
//  User.swift
//  userDefaultslab
//
//  Created by Ahad Islam on 11/20/19.
//  Copyright © 2019 Ahad Islam. All rights reserved.
//

import Foundation

struct User {
    let name: String?
    let birthMonth: String?
    
    init(name: String? = nil, birthMonth: String? = nil) {
        self.name = name
        self.birthMonth = birthMonth
    }
}

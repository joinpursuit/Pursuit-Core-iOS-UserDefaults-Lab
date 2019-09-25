//
//  DateExtention.swift
//  UserDefaults
//
//  Created by Michelle Cueva on 9/24/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import Foundation

extension Date {
    func isBetween(_ date1: Date, and date2: Date) -> Bool {
        return (min(date1, date2) ... max(date1, date2)).contains(self)
    }
}

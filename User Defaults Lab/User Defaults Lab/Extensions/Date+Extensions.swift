//
//  Date+Extensions.swift
//  User Defaults Lab
//
//  Created by Bienbenido Angeles on 1/14/20.
//  Copyright © 2020 Bienbenido Angeles. All rights reserved.
//

import Foundation

extension Date{
    func isBetween(_ dateRange: ClosedRange<Date>) -> Bool{
        return dateRange.contains(self)
    }
}

//
//  DateHelper.swift
//  UserDefaults
//
//  Created by Cameron Rivera on 1/13/20.
//  Copyright © 2020 Cameron Rivera. All rights reserved.
//

import Foundation

struct DateHelper{
    static func dateToString(_ date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d"
        return dateFormatter.string(from: date)
    }
    
    static func dateToSign(_ dateString: String) -> Sunsign?{
        let dateArr = dateString.components(separatedBy: " ")
        let month = dateArr[0]
        let day = Int(dateArr[1])!
        var sign = ""
        
        if (month == "March" && day >= 21) || (month == "April" && day <= 19){
            sign = "aries"
        } else if (month == "April" && day >= 20) || (month == "May" && day <= 20){
            sign = "taurus"
        } else if (month == "May" && day >= 21) || (month == "June" && day <= 20){
            sign = "gemini"
        } else if (month == "June" && day >= 21) || (month == "July" && day <= 22){
            sign = "cancer"
        } else if (month == "July" && day >= 22) || (month == "August" && day <= 22){
            sign = "leo"
        } else if (month == "August" && day >= 23) || (month == "September" && day <= 22){
            sign = "virgo"
        } else if (month == "September" && day >= 23) || (month == "October" && day <= 22){
            sign = "libra"
        } else if (month == "October" && day >= 23) || (month == "November" && day <= 21){
            sign = "scorpio"
        } else if (month == "November" && day >= 22) || (month == "December" && day <= 21){
            sign = "sagittarius"
        } else if (month == "December" && day >= 22) || (month == "January" && day <= 19){
            sign = "capricorn"
        } else if (month == "January" && day >= 20) || (month == "February" && day <= 18){
            sign = "aquarius"
        } else {
            sign = "pisces"
        }
        if let sunsign = Sunsign(rawValue: sign){
            return sunsign
        }
        return nil
    }
}

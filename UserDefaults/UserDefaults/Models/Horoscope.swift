//
//  Horoscope.swift
//  UserDefaults
//
//  Created by Michelle Cueva on 9/24/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import Foundation

struct Horoscope: Codable {
    let sunsign: String
    let horoscope: String
    
    static func getHoroscope(from jsonData: Data) throws -> Horoscope {
        let response = try JSONDecoder().decode(Horoscope.self, from: jsonData)
        return response
    }
    
    static func getSunSign(date: Date) -> String {
        
        if date.isBetween(getDate(month: 01, day: 20, date: date), and: getDate(month: 02, day: 18, date: date)){
            return "aquarius"
        } else if date.isBetween(getDate(month: 02, day: 19, date: date), and: getDate(month: 03, day: 20, date: date)){
            return "pisces"
        } else if date.isBetween(getDate(month: 03, day: 21, date: date), and: getDate(month: 04, day: 19, date: date)){
            return "aries"
        } else if date.isBetween(getDate(month: 04, day: 20, date: date), and: getDate(month: 05, day: 20, date: date)){
            return "taurus"
        } else if date.isBetween(getDate(month: 05, day: 21, date: date), and: getDate(month: 06, day: 20, date: date)){
            return "gemini"
        } else if date.isBetween(getDate(month: 06, day: 21, date: date), and: getDate(month: 07, day: 22, date: date)){
            return "cancer"
        } else if date.isBetween(getDate(month: 07, day: 23, date: date), and: getDate(month: 08, day: 22, date: date)){
            return "leo"
        } else if date.isBetween(getDate(month: 08, day: 23, date: date), and: getDate(month: 09, day: 22, date: date)){
            return "virgo"
        } else if date.isBetween(getDate(month: 09, day: 23, date: date), and: getDate(month: 10, day: 22, date: date)){
            return "libra"
        } else if date.isBetween(getDate(month: 10, day: 23, date: date), and: getDate(month: 11, day: 21, date: date)){
            return "scorpio"
        } else if date.isBetween(getDate(month: 11, day: 22, date: date), and: getDate(month: 12, day: 21, date: date)){
            return "sagitarius"
        } else {
            return "capricorn"
        }
       
    }
    
    private static func  getDate(month: Int, day: Int, date:Date) -> Date {
        let calendar = Calendar.current
        let birthyear = calendar.component(.year, from: date)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        if let dateFormat = formatter.date(from: "\(birthyear)-\(month)-\(day)") {
            return dateFormat
        }
        return Date()
    }
}

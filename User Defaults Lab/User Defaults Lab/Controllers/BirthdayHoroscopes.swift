//
//  BirthdayHoroscopes.swift
//  User Defaults Lab
//
//  Created by Bienbenido Angeles on 1/14/20.
//  Copyright © 2020 Bienbenido Angeles. All rights reserved.
//

import UIKit

class BirthDayHoroscopesViewController: UIViewController {
    
    @IBOutlet weak var birthdayDatePicker: UIDatePicker!
    @IBOutlet weak var horoscopeInfoLabel: UILabel!
    
    var allHoroScopeData = [HoroscopeSign]()
    
    var dob = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        horoscopeInfoLabel.isHidden = true
    }
    
    func loadData(){
        HoroscopeAPIClient.getHoroscope { (result) in
            switch result{
            case .failure(let appError):
                self.showAlert(title: "Network Error", message: "\(appError)")
            case .success(let horoscopeSigns):
                self.allHoroScopeData = horoscopeSigns
            }
        }
    }
    
    func getHoroscope() -> String{
        var horoscope = ""
        
        let fullDateFormatter = DateFormatter()
        fullDateFormatter.dateFormat = "yyyy/MM/dd"
        
        //DOB code
        let selectedDateAsBirthDay = dob
        
        //DOB year as string code
        let yearDateFormatter = DateFormatter()
        yearDateFormatter.dateFormat = "yyyy"
        let yearString = yearDateFormatter.string(from: selectedDateAsBirthDay)
        
        //DOB year as int code
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: selectedDateAsBirthDay)
        let yearInt = components.year
        
        //all possible horoscope ranges
        let aries = fullDateFormatter.date(from: "\(yearString)/03/21")!...fullDateFormatter.date(from: "\(yearString)/04/19")!
        let taurus = fullDateFormatter.date(from: "\(yearString)/04/20")!...fullDateFormatter.date(from: "\(yearString)/5/20")!
        let gemini = fullDateFormatter.date(from: "\(yearString)/05/21")!...fullDateFormatter.date(from: "\(yearString)/6/20")!
        let cancer = fullDateFormatter.date(from: "\(yearString)/06/21")!...fullDateFormatter.date(from: "\(yearString)/7/22")!
        let leo = fullDateFormatter.date(from: "\(yearString)/07/22")!...fullDateFormatter.date(from: "\(yearString)/8/22")!
        let virgo = fullDateFormatter.date(from: "\(yearString)/08/23")!...fullDateFormatter.date(from: "\(yearString)/9/22")!
        let libra = fullDateFormatter.date(from: "\(yearString)/09/23")!...fullDateFormatter.date(from: "\(yearString)/10/22")!
        let scorpio = fullDateFormatter.date(from: "\(yearString)/10/23")!...fullDateFormatter.date(from: "\(yearString)/11/22")!
        let sagittarius = fullDateFormatter.date(from: "\(yearString)/11/22")!...fullDateFormatter.date(from: "\(yearString)/12/21")!
        let capricorn = fullDateFormatter.date(from: "\(yearString)/12/22")!...fullDateFormatter.date(from: "\(String(yearInt!+1))/1/19")!
        let aquarius = fullDateFormatter.date(from: "\(yearString)/01/20")!...fullDateFormatter.date(from: "\(yearString)/2/18")!
        let pisces = fullDateFormatter.date(from: "\(yearString)/02/22")!...fullDateFormatter.date(from: "\(yearString)/12/21")!
        
        //let ariesEval = selectedDateAsBirthDay.isBetween(aries)
        
        
        switch selectedDateAsBirthDay {
        case aries:
            horoscope = "aries"
        case taurus:
            horoscope = "taurus"
        case gemini:
            horoscope = "gemini"
        case cancer:
            horoscope = "cancer"
        case leo:
            horoscope = "leo"
        case virgo:
            horoscope = "virgo"
        case libra:
            horoscope = "libra"
        case scorpio:
            horoscope = "scorpio"
        case sagittarius:
            horoscope = "sagittarius"
        case capricorn:
            horoscope = "capricorn"
        case aquarius:
            horoscope = "aquarius"
        case pisces:
            horoscope = "pisces"
        default:
            break
        }
        
        return horoscope
    }
    
    func evaluateIfHoroscopeIsBetweenDateRange(dob date: Date, horoscope range: ClosedRange<Date>) -> Bool{
        
        return date.isBetween(range)
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        dob = sender.date
    }
    
    
    @IBAction func horoscopeButton(_ sender: UIButton) {
        
        let horoscope = getHoroscope()
        let filteredData = allHoroScopeData.filter{$0.sunsign == horoscope}.first!
        horoscopeInfoLabel.isHidden = false
        horoscopeInfoLabel.text = "Horoscope:\n\(filteredData.horoscope)\nMood:\(filteredData.meta.mood)\nKeywords:\(filteredData.meta.keywords)"
    }
    
}

//
//  ViewController.swift
//  UserDefaultsProj
//
//  Created by Kevin Natera on 9/24/19.
//  Copyright © 2019 Kevin Natera. All rights reserved.
//

import UIKit

class DefaultViewController: UIViewController, UITextFieldDelegate {
    
    var userName = String()
    
    var birthdayDate = Date() {
        didSet {
            getSign(birthday: birthdayDate)
        }
    }
    
    var userSign = ""
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        UserDefaultsWrapper.wrapper.store(sign: userSign)
        UserDefaultsWrapper.wrapper.store(birthday: birthdayDate)
        UserDefaultsWrapper.wrapper.store(userName: userName)
        
        self.performSegue(withIdentifier: "toHoroscope", sender: UIButton.self)
    }
    
    
       
    @IBAction func textFieldIsTyped(_ sender: UITextField) {
        if let text = sender.text {
        userName = text
      }
    }
    
    @IBAction func dateWasPicked(_ sender: UIDatePicker) {
        birthdayDate = sender.date
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        loadDefaults()
    }
    
    private func loadDefaults() {
        if let defaultName = UserDefaultsWrapper.wrapper.getUserName() {
            userName = defaultName
        }
        if let defaultBirthday = UserDefaultsWrapper.wrapper.getBirthday() {
            birthdayDate = defaultBirthday
            datePicker.date = defaultBirthday
        }
        if let defaultSign = UserDefaultsWrapper.wrapper.getSign() {
            userSign = defaultSign
            self.performSegue(withIdentifier: "toHoroscope", sender: (Any).self)
        }
    }
    
   private func getSign(birthday: Date) {
        
    let calendar = Calendar.current

    let month = calendar.component(.month, from: birthdayDate)

    let day = calendar.component(.day, from: birthdayDate)

    switch month {
    case 1:
        if day <= 19 {
            userSign = "capricorn"
        } else {
            userSign = "aquarius"
        } 
    case 2:
        if day <= 18 {
            userSign = "aquarius"
        } else {
            userSign = "pisces"
        }
    case 3:
        if day <= 20 {
            userSign = "pisces"
        } else {
            userSign = "aries"
        }
    case 4:
        if day <= 19 {
            userSign = "aries"
        } else {
            userSign = "taurus"
        }
    case 5:
        if day <= 20 {
            userSign = "taurus"
        } else {
            userSign = "gemini"
        }
    case 6:
        if day <= 20 {
            userSign = "gemini"
        } else {
            userSign = "cancer"
        }
    case 7:
        if day <= 22 {
            userSign = "cancer"
        } else {
            userSign = "leo"
        }
    case 8:
        if day <= 22 {
            userSign = "leo"
        } else {
            userSign = "virgo"
        }
    case 9:
        if day <= 22 {
            userSign = "virgo"
        } else {
            userSign = "libra"
        }
    case 10:
        if day <= 22 {
            userSign = "libra"
        } else {
            userSign = "scorpio"
        }
    case 11:
        if day <= 21 {
            userSign = "scorpio"
        } else {
            userSign = "sagittarius"
        }
    case 12:
        if day <= 21 {
            userSign = "sagittarius"
        } else {
            userSign = "capricorn"
        }
        default:
            print("oops")
        }
    }
    
    
}



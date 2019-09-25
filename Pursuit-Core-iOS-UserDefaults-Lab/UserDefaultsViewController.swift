//
//  UserDefaultsViewController.swift
//  Pursuit-Core-iOS-UserDefaults-Lab
//
//  Created by Krystal Campbell on 9/25/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit


class UserDefaultsViewController: UIViewController, UITextFieldDelegate {
    
    var userName = "" {
        didSet {
            welcomeLabel.text = "Welcome\(UserName)!"
            
            // performLabelTextUpdates()
            // UserDefaultsWrapper.wrapper.store(userName: userName)
        }
    }
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var BirthdatePicker: UIDatePicker!
    
    @IBOutlet weak var NameLabel: UITextField!
    
    @IBAction func UserName(_ sender: UITextField) {
        
        func textField(_ textField:UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
            if let text = textField.text,
                let textRange = Range(range, in: text) {
                let updatedText = text.replacingCharacters(in: textRange, with: string)
                userName = updatedText
            }
            return true 
            //
            //            guard let text = textField.text else {
            //                return false
            //            }
            //            let range = Range(range, in: text)!
            //            let newText = text.replacingCharacters(in: range, with: string)
            //        userName = newText
            //            return true
        }
    }
    
        
        @IBAction func BirthdatePicker(_ sender: UIDatePicker) {
        }
        
        @IBOutlet weak var AstrologyPicker: UIPickerView!
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            welcomeLabel.text = "Welcome"
            NameLabel.delegate = self
            
        }
    }


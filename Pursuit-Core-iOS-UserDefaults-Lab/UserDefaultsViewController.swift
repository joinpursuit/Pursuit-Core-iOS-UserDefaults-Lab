//
//  UserDefaultsViewController.swift
//  Pursuit-Core-iOS-UserDefaults-Lab
//
//  Created by Krystal Campbell on 9/25/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit


class UserDefaultsViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var SignPicker: UIPickerView!
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var BirthdatePicker: UIDatePicker!
    
    @IBOutlet weak var NameLabel: UITextField!
    
    @IBOutlet weak var signPickedLabel: UILabel!
    
    @IBOutlet weak var birthdayPickedLabel: UILabel!
    
    @IBAction func BirthdatePicker(_ sender: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        let strDate = dateFormatter.string(from: BirthdatePicker.date)
        birthdayPickedLabel.text = strDate
    }
    
    let defaults = UserDefaults.standard
    
    var pickerData: [String] = [String]()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.signPickedLabel.text = pickerData[row]
    }
    
    
    
    @IBAction func textField(_ sender: UITextField) {
    }
    
    func textField(_ textField:UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        //        if let text = textField.text,
        //            let textRange = Range(range, in: text) {
        //            let updatedText = text.replacingCharacters(in: textRange, with: string)
        //            userName = updatedText
        //        }
        //        return true
        
        guard let text = textField.text else {
            return false
        }
        let range = Range(range, in: text)!
        let newText = text.replacingCharacters(in: range, with: string)
        userName = newText
        return true
    }
    
    @IBOutlet weak var AstrologyPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // self.NameLabel.text = ""
        //welcomeLabel.text = "Welcome"
        NameLabel.delegate = self
        setInitialValuesFromUserDefaults()
        self.SignPicker.delegate = self
        self.SignPicker.dataSource = self
        
        pickerData = ["Capricorn", "Gemini", "Taurus", "Aries", "Libra", "Pisces", "Leo", "Virgo","Aquarius", "Cancer", "Scorpio", "Sagittarius"]
    }
    
    
    
    var userName = "" {
        didSet {
            welcomeLabel.text = "Welcome \(userName) !"
            // performLabelTextUpdates()
            UserDefaultsWrapper.manager.store(userName: userName)
        }
    }
    
    
    
    private func setInitialValuesFromUserDefaults(){
        if let storedUsername = UserDefaults.standard.value(forKey: "userName") as? String {
            NameLabel.text = storedUsername
            userName = storedUsername
        }
    }
}


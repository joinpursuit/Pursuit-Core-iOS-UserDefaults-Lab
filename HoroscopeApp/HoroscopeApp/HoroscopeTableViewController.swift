//
//  HoroscopeTableViewController.swift
//  HoroscopeApp
//
//  Created by Liubov Kaper  on 1/13/20.
//  Copyright © 2020 Luba Kaper. All rights reserved.
//

import UIKit

class HoroscopeTableViewController: UITableViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBOutlet weak var signPicker: UIPickerView!
    
    
    @IBOutlet weak var signLabel: UILabel!
    
    var name: UserName?
    
    
    // data for pickerView
    private let signs = ["Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signPicker.delegate = self
        signPicker.dataSource = self
        nameTextField.delegate = self
        name = UserName(name: "LUBA")
       
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         UserPreference.shared.updateHoroscope(with: "leo")
         
    }
}

extension HoroscopeTableViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return signs.count
    }
}

extension HoroscopeTableViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return signs[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        signLabel.text = signs[row]
    }
}

extension HoroscopeTableViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // dismisses keyboard
        textField.resignFirstResponder()
        
        name?.name = textField.text ?? "no user name"
        
        return true
        
    }
}

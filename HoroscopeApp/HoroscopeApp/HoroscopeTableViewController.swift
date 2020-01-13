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
    
    
    // dat for pickerView
    private let signs = ["Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signPicker.delegate = self
        signPicker.dataSource = self
        

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
}

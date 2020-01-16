//
//  ViewController.swift
//  User Defaults Lab
//
//  Created by Bienbenido Angeles on 1/13/20.
//  Copyright © 2020 Bienbenido Angeles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var horoscopePicker: UIPickerView!
    @IBOutlet weak var horoscopeDataLabel: UILabel!
    @IBOutlet weak var outputNameLabel: UILabel!
    
    private var horoscopesOnlineList = [String]()
    {
        didSet {
            DispatchQueue.main.async {
                self.horoscopePicker.selectRow(self.currentHoroscopeIndex ?? 2, inComponent: 0, animated: true)
            }
        }
    }
    
    private var horoscopeAllData = [HoroscopeSign]()
    
    private var currentHoroscopeIndex: Int?

    private var currentHoroscope:String?

    private var name: String?{
        didSet{
            //update UI
            outputNameLabel.text! = "Name:\n\(name ?? "")"
            //store data
            UserPreferences.shared.store(with: name!, UserPrefKey: UserPrefenceKey.name)
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadData()
        pickerViewDelegateOrDataSources()
        textViewDelegateOrDataSources()
        //currentHoroscope = horoscopesOnlineList.first
        horoscopeDataLabel.isHidden = true
        self.horoscopePicker.selectRow(self.currentHoroscopeIndex ?? 2, inComponent: 0, animated: true)
        print("Retrieve", currentHoroscopeIndex)
    }
    
    func loadData(){
        HoroscopeAPIClient.getHoroscope { (result) in
            switch result{
            case .failure(let appError):
                self.showAlert(title: "Network Error", message: "\(appError)")
            case .success(let horoscopeSigns):
                self.horoscopesOnlineList = horoscopeSigns.map{$0.sunsign}
                self.horoscopeAllData = horoscopeSigns
            }
        }
        
        //getting stored data
        if let storedName: String = UserPreferences.shared.get(UserPrefKey: UserPrefenceKey.name) {
            name = storedName
        }
        
        if let storedHoroscope: Int = UserPreferences.shared.get(UserPrefKey: UserPrefenceKey.horoscopes){
            currentHoroscopeIndex = storedHoroscope
        }
    }
    
    func pickerViewDelegateOrDataSources(){
        horoscopePicker.dataSource = self
        horoscopePicker.delegate = self
    }
    
    func textViewDelegateOrDataSources(){
        nameTextField.delegate = self
    }
    
    func labelUpdated(){
        name = nameTextField.text ?? ""
        //store name
        UserPreferences.shared.store(with: name!, UserPrefKey: UserPrefenceKey.name)
        outputNameLabel.text! = "Name:\n\(name ?? "")"
    }
    
    @IBAction func viewHoroscopeButton(_ sender: UIButton) {
        let filteredData = horoscopeAllData.filter{$0.sunsign == currentHoroscope}.first!
        horoscopeDataLabel.isHidden = false
        horoscopeDataLabel.text = "Horoscope:\n\(filteredData.horoscope)\nMood:\(filteredData.meta.mood)\nKeywords:\(filteredData.meta.keywords)"
        UserPreferences.shared.store(with: currentHoroscopeIndex!, UserPrefKey: UserPrefenceKey.horoscopes)
        //print("Store", currentHoroscopeIndex)
    }
}

extension ViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        currentHoroscope = horoscopesOnlineList[row]
        return horoscopesOnlineList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentHoroscopeIndex = row
    }
}

extension ViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return horoscopesOnlineList.count
    }
}

extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        labelUpdated()
        textField.resignFirstResponder()
        return true
    }
}

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
    private var currentHoroscope:String?
    private var horoscopeAllData = [HoroscopeSign]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadData()
        pickerViewDelegateOrDataSources()
        textViewDelegateOrDataSources()
        currentHoroscope = horoscopesOnlineList.first
        horoscopeDataLabel.isHidden = true
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
    }
    
    func pickerViewDelegateOrDataSources(){
        horoscopePicker.dataSource = self
        horoscopePicker.delegate = self
    }
    
    func textViewDelegateOrDataSources(){
        nameTextField.delegate = self
    }
    
    func labelUpdated(){
        let name = nameTextField.text ?? ""
        outputNameLabel.text! = "Name:\n\(name)"
    }
    
    @IBAction func viewHoroscopeButton(_ sender: UIButton) {
        let filteredData = horoscopeAllData.filter{$0.sunsign == currentHoroscope}.first!
        //print(filteredData)
        horoscopeDataLabel.isHidden = false
        horoscopeDataLabel.text = "Horoscope:\n\(filteredData.horoscope)\nMood:\(filteredData.meta.mood)\nKeywords:\(filteredData.meta.keywords)"
    }
}

extension ViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        currentHoroscope = horoscopesOnlineList[row]
        return horoscopesOnlineList[row]
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

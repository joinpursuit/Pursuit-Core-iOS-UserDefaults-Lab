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
    
    private var horoscopesOnlineList = [String]()
    private var currentHoroscope:String?
    private var horoscopeAllData = [HoroscopeSign]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadData()
        pickerViewDelegateOrDataSources()
        currentHoroscope = horoscopesOnlineList.first
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
    
    @IBAction func viewHoroscopeButton(_ sender: UIButton) {
        
    }
    
}

extension ViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
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


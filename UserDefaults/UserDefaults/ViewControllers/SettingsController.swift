//
//  SettingsController.swift
//  UserDefaults
//
//  Created by Cameron Rivera on 1/13/20.
//  Copyright © 2020 Cameron Rivera. All rights reserved.
//

import UIKit

class SettingsController: UIViewController{
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var signs = ["aries", "taurus", "gemini", "cancer", "leo", "virgo", "libra", "scorpio", "sagittarius", "capricorn", "aquarius", "pisces"]
    
    var selectedSign = false
    var userData = UserData(name: "", sign: .aries)
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp(){
        textField.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.leftBarButtonItem?.title = "back"
        navigationItem.leftBarButtonItem?.isEnabled = false
        textField.placeholder = "Enter your name here"
    }
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem){
        UserPreferences.shared.saveHoroscope(using: userData)
        navigationController?.popViewController(animated: true)
    }
    
}

extension SettingsController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let xCell = tableView.dequeueReusableCell(withIdentifier: "signCell", for: indexPath)
        xCell.textLabel?.text = signs[indexPath.row]
        return xCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return signs.count
    }
}

extension SettingsController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSign = true
        if let sign = Sunsign(rawValue: signs[indexPath.row]){
            userData.sign = sign
            if selectedSign && userData.name != ""{
                navigationItem.leftBarButtonItem?.isEnabled = true
            }
        }
    }
}

extension SettingsController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else {
            return false
        }
        userData.name = text
        if selectedSign && userData.name != ""{
            navigationItem.leftBarButtonItem?.isEnabled = true
        }
        textField.resignFirstResponder()
        return true
    }
}

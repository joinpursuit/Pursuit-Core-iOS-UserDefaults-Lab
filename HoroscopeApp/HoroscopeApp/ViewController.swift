//
//  ViewController.swift
//  HoroscopeApp
//
//  Created by Liubov Kaper  on 1/13/20.
//  Copyright © 2020 Luba Kaper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var settingsButton: UIButton!
    
    @IBOutlet weak var horoscopeText: UITextView!
    
    
    @IBOutlet weak var signLabel: UILabel!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var currentName = "Luba"  {
        didSet {
            nameLabel.text = currentName
        }
    }
    
    var currentSign = "leo" {
        didSet {
            signLabel.text = currentSign
        }
    }
    
    var horoscope: Horoscope? {
        didSet {
            DispatchQueue.main.async {
                
                self.horoscopeText.text = self.horoscope?.horoscope
                self.signLabel.text = self.horoscope?.sunsign
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // getHoroscope(sign:  currentSign)
       // horoscopeText.text = horoscope?.horoscope
        updateUI()
    }
    
    
    private func updateUI() {
        if let userName = UserPreference.shared.getName() {
            currentName = userName
        }
        if let userSign = UserPreference.shared.getSign() {
            currentSign = userSign
        }
    
    }
    
    @IBAction func addUserInfo(segue: UIStoryboardSegue) {
        
        guard let horoscopeVC = segue.source as? HoroscopeTableViewController, let enteredName = horoscopeVC.name, let enterdSign = horoscopeVC.signLabel else {
            fatalError("failed to  access HoroscopeViewController")
        }
        signLabel.text = enterdSign.text
        nameLabel.text = enteredName.name
        getHoroscope(sign: signLabel.text?.lowercased() ?? "Leo")
        
        
        // SAVE DEFAULTS
        UserPreference.shared.updateName(with: enteredName.name)
        UserPreference.shared.updateSign(with: enterdSign.text ?? "leo")
        UserPreference.shared.updateHoroscope(with: horoscopeText.text)
        
    }
    
    func getHoroscope(sign: String) {
        HoroscopeAPIClient.fetchHoroscope(for: sign, completion:  {[weak self] (result) in
            switch result {
            case .failure(let appError):
                print("error: \(appError)")
            case .success(let signs):
                self?.horoscope = signs
            }
        })
        
    }
    
}


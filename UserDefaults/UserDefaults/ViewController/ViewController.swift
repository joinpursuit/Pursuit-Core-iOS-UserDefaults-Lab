//
//  ViewController.swift
//  UserDefaults
//
//  Created by Michelle Cueva on 9/24/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var DatePicker: UIDatePicker!
    
    var birthday: Date! {
        didSet {
            UserDefaultsWrapper.shared.store(birthday: self.birthday)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadDefaultSettings()
    }
    
    private func loadDefaultSettings() {
        if let userBirthday = UserDefaultsWrapper.shared.getBirthday() {
            birthday = userBirthday
//            pushToNextController()
        }
    }

    
    @IBAction func pressButton(_ sender: UIButton) {
        birthday = DatePicker.date
        pushToNextController()
    }
    
    func pushToNextController() {
        let storyboard = UIStoryboard.init(name: "Main", bundle:nil)
        let horoscopeDVC = storyboard.instantiateViewController(withIdentifier: "HoroscopeViewController") as! HoroscopeViewController
        DispatchQueue.global().async {
            
        
            HoroscopeAPIHelper.shared.getHoroscope(sunSign: Horoscope.getSunSign(date:self.birthday)) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let HoroscopesFromOnline):
                    horoscopeDVC.horoscope = HoroscopesFromOnline
                    self.navigationController?.pushViewController(horoscopeDVC, animated: true)
                   

                case .failure(let error):
                    print(error)
                }
            }
            }
        }
    }
    
    
}


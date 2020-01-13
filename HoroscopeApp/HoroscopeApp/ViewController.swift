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
       getHoroscope(sign: "leo")
        //horoscopeText.text =
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


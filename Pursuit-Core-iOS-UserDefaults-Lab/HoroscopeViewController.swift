//
//  HoroscopeViewController.swift
//  Pursuit-Core-iOS-UserDefaults-Lab
//
//  Created by Krystal Campbell on 9/25/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

class HoroscopeViewController: UIViewController {
    
    
    var horoscopes: Horoscope!

    @IBOutlet weak var HoroscopeTextView: UITextView!
    
    @IBOutlet weak var sunSignLabel: UILabel!
    private func loadData(horoscopeSign: String) {
        HoroscopeAPIManager.shared.getHoroscopes(showSign: horoscopeSign){(result)in
            DispatchQueue.main.async {
                switch result{
                case .failure(let error):
                    print(error)
                case .success(let horoscopesFromOnline): self.horoscopes = horoscopesFromOnline
                }
            }
        }
        
    }

    func setUpLabels(){
        HoroscopeTextView.text = horoscopes.horoscope
        sunSignLabel.text = horoscopes.sunsign
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //loadData(horoscopeSign: horoscopes.horoscope)
        setUpLabels()
    }

}

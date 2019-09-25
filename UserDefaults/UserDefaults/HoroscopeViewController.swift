//
//  HoroscopeViewController.swift
//  UserDefaults
//
//  Created by Michelle Cueva on 9/24/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import UIKit

class HoroscopeViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var horoscopeInfo: UITextView!
    var horoscope: Horoscope! {
        didSet {
            horoscopeInfo.text = self.horoscope.horoscope
            nameLabel.text = self.horoscope.sunsign
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

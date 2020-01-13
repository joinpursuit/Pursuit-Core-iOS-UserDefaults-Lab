//
//  HoroscopeViewController.swift
//  UserDefaultsProj
//
//  Created by Kevin Natera on 9/24/19.
//  Copyright © 2019 Kevin Natera. All rights reserved.
//

import UIKit

class HoroscopeViewController: UIViewController {
    var horoscope: Horoscope? {
        didSet {
            textView.text = horoscope?.horoscope
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    

    private func loadData() {
          if let defaultName = UserDefaultsWrapper.wrapper.getUserName() {
            nameLabel.text = defaultName.capitalized
          }
          if let defaultSign = UserDefaultsWrapper.wrapper.getSign() {
            signLabel.text = defaultSign.capitalized
            HoroscopeAPIHelper.shared.getHoroscope(sign: defaultSign) { (result) in
                DispatchQueue.main.async {
                    switch result {
                    case .failure(let error):
                        print(error)
                    case .success(let data):
                        self.horoscope = data
                    }
                }
            }
         }
  }
}

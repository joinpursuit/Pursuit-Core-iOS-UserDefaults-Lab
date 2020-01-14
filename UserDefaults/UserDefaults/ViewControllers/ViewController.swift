//
//  ViewController.swift
//  UserDefaults
//
//  Created by Cameron Rivera on 1/13/20.
//  Copyright © 2020 Cameron Rivera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var horoscopeTextView: UITextView!
    
    var currentHoroscope: Horoscope?
    var userData: UserData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setUp()
    }
    
    private func setUp(){
        navigationItem.title = "Daily Horoscope"
        navigationItem.rightBarButtonItem?.title = "Settings"
        if let data = UserPreferences.shared.getHoroscope(){
            greetingLabel.text = "Greetings \(data.name), your daily horoscope is shown below."
            navigationItem.title = data.sign.rawValue
            let urlString = "http://sandipbgt.com/theastrologer/api/horoscope/\(data.sign.rawValue)/today"
            HoroscopeAPI.getHoroscope(from: urlString) { [weak self] result in
                switch result{
                case .failure(let netError):
                    self?.showAlert("Horoscope Retrieval Error", "Error: \(netError)")
                case .success(let horo):
                    self?.currentHoroscope = horo
                    DispatchQueue.main.async{
                        self?.horoscopeTextView.text = horo.horoscope
                    }
                }
            }
        } else {
            greetingLabel.text = "Navigate to the settings menu to display your personal horoscope for the day."
            horoscopeTextView.text = ""
        }
    }

    @IBAction func settingsButtonPressed(_ sender: UIBarButtonItem){
        guard let settingsVC = storyboard?.instantiateViewController(withIdentifier: "SettingsController") as? SettingsController else {
            showAlert("Segue Error", "Could not instantiate instance of SettingsController")
            return
        }
        navigationController?.pushViewController(settingsVC, animated: true)
    }

}


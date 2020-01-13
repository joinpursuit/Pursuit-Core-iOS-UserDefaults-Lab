//
//  HoroscopeViewController.swift
//  userDefaultslab
//
//  Created by Ahad Islam on 12/25/19.
//  Copyright © 2019 Ahad Islam. All rights reserved.
//

import UIKit

class HoroscopeViewController: UIViewController {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Horoscope"
        label.font = .systemFont(ofSize: 30)
        return label
    }()
    
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 20)
        textView.isEditable = false
        return textView
    }()
    
    private lazy var editButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit", for: .normal)
        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        return button
    }()
    
    private var horoscope: Horoscope! {
        didSet {
            textView.text = """
            Hello \(UserDefaultsWrapper.helper.getUsername() ?? "Guest"),
            \(horoscope.horoscope)
            """
        }
    }
    
    private var endpointURL: String { "http://sandipbgt.com/theastrologer/api/horoscope/\(sign.rawValue)/today/"
    }
    
    private var sign: Sign {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLdd"
        let y = Int(dateFormatter.string(from: UserDefaultsWrapper.helper.getBirthDate()!)) ?? -1
        return Sign.getSign(y)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        configureView()
        loadData()
    }
    
    @objc private func buttonPressed(_ sender: UIButton) {
        present(ViewController(), animated: true, completion: nil)
    }
    
    private func loadData() {
        GenericCoderAPI.manager.getJSON(objectType: Horoscope.self, with: endpointURL) { result in
            switch result {
            case .failure(let error):
                print("Error occured getting JSON in HoroscopeViewController: \(error)")
            case .success(let horoscopeFromAPI):
                self.horoscope = horoscopeFromAPI
            }
        }
    }
    
    private func configureView() {
        setupTitleLabel()
        setupTextView()
        setupButton()
    }
    
    private func setupTitleLabel() {
        view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
    }
    
    private func setupTextView() {
        view.addSubview(textView)
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.centerYAnchor),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }
    
    private func setupButton() {
        view.addSubview(editButton)
        
        editButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            editButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            editButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            editButton.widthAnchor.constraint(equalToConstant: editButton.intrinsicContentSize.width + 20)])
    }
}

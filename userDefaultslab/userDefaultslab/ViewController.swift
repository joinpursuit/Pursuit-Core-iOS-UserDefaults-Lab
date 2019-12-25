//
//  ViewController.swift
//  userDefaultslab
//
//  Created by Ahad Islam on 11/19/19.
//  Copyright © 2019 Ahad Islam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .bezel
        textField.backgroundColor = .secondarySystemBackground
        textField.placeholder = "Enter your name.."
        textField.text = UserDefaultsWrapper.helper.getUsername()
        textField.addTarget(self, action: #selector(validateField(_:)), for: .editingChanged)
        return textField
    }()
    
    private lazy var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        if let date = UserDefaultsWrapper.helper.getBirthDate() {
            picker.date = date
        }
        return picker
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.setTitle("Signup", for: .normal)
        button.setTitleColor(.systemGray, for: .disabled)
        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        configureView()
    }
    
    @objc private func validateField(_ sender: UITextField) {
        button.isEnabled = sender.hasText ? true : false
    }
    
    @objc private func buttonPressed(_ sender: UIButton) {
        print(datePicker.date.description)
        print("Button pressed.")
        UserDefaultsWrapper.helper.store(username: textField.text!)
        UserDefaultsWrapper.helper.store(date: datePicker.date)
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let sceneDelegate = windowScene.delegate as? SceneDelegate,
            let window = sceneDelegate.window
            else {
                return
        }
        
        window.rootViewController = HoroscopeViewController()
        
    }
    
    private func configureView() {
        setupTextField()
        setupDatePicker()
        setupButton()
    }
    
    private func setupTextField() {
        let label = UILabel()
        label.text = "Your name:"
        
        let stackView = UIStackView(arrangedSubviews: [label, textField])
        stackView.axis = .horizontal
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)])
    }
    
    private func setupDatePicker() {
        let label = UILabel()
        label.text = "Your birthday:"
        
        let stackView = UIStackView(arrangedSubviews: [label, datePicker])
        stackView.axis = .horizontal
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)])
    }
    
    private func setupButton() {
        view.addSubview(button)
        button.isEnabled = textField.hasText ? true : false
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            button.widthAnchor.constraint(equalToConstant: view.frame.width / 2),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
    }
}



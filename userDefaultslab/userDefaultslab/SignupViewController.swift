//
//  SignupViewController.swift
//  userDefaultslab
//
//  Created by Ahad Islam on 11/19/19.
//  Copyright © 2019 Ahad Islam. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    
    //MARK: - Properties

    
    lazy var userNameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemRed
        return textField
    }()
    
    lazy var birthMonthTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemBlue
        return textField
    }()
    
    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your name:"
        return label
    }()
    
    lazy var birthMonthLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your birth month."
        return label
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.text = "Sign Up"
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(trySignUp), for: .touchUpInside)
        return button
    }()
    
    // MARK:- Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        configureView()
        // Do any additional setup after loading the view.
    }
    
    // MARK:- Private Methods
    
    private func configureView() {
        addUserNameTextField()
        addBirthMonthTextField()
        addUserNameLabel()
        addBirthMonthLabel()
        addSignUpButton()
    }
        
    private func addUserNameTextField() {
        view.addSubview(userNameTextField)
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userNameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            userNameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            userNameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)])
    }
    
    private func addBirthMonthTextField() {
        view.addSubview(birthMonthTextField)
        birthMonthTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            birthMonthTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 20),
            birthMonthTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant:  -8),
            birthMonthTextField.widthAnchor.constraint(equalTo: userNameTextField.widthAnchor)])
    }
    
    private func addUserNameLabel() {
        view.addSubview(userNameLabel)
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            userNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8)])
    }
    
    private func addBirthMonthLabel() {
        view.addSubview(birthMonthLabel)
        birthMonthLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            birthMonthLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 20),
            birthMonthLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8)])
    }
    
    private func addSignUpButton() {
        view.addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signUpButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5)])
    }
    
    // MARK: - Objective C Methods
    
    @objc func trySignUp() {
        
    }
    
    //What i need to do.  Finish userdefaults.  create a user page, and asdfasdfee json.
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


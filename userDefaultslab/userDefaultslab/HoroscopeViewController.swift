//
//  ViewController.swift
//  userDefaultslab
//
//  Created by Ahad Islam on 11/19/19.
//  Copyright © 2019 Ahad Islam. All rights reserved.
//

import UIKit

class HoroscopeViewController: UIViewController {
    
    // MARK: - Properties
    
    private var user: User?
    
    lazy var testLabel: UILabel = {
        let label = UILabel()
        label.text = "Hi."
        label.backgroundColor = .red
        return label
    }()
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        if user == nil {
//            present(SignupViewController(), animated: true, completion: nil)
            show(SignupViewController(), sender: nil)
        }
    }
    
    // MARK: - Initializers
    
    init(user: User?) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    convenience init() {
        self.init(user: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented.")
    }
}



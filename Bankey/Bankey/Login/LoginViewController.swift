//
//  ViewController.swift
//  Bankey
//
//  Created by ronaldo silva on 8/14/25.
//

import UIKit

class LoginViewController: UIViewController {

    
    private lazy var infoLabel: UILabel = {
        let label  = UILabel()
        label.text = "Bankey"
        label.font = .boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label  = UILabel()
        label.numberOfLines = 0
        label.text = "Your premium source for all \n things banking"
        label.font = .boldSystemFont(ofSize: 10)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var loginView  = LoginView()
    
    private lazy var signButton: UIButton = {
        let button = UIButton(type: .system)
        button.configuration = .filled()
        button.configuration?.imagePadding = 8
        button.setTitle("Sign In", for: [])
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        return button
    }()
    
    private lazy var erromessageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .systemRed
        label.isHidden = true
        label.numberOfLines = 0
        label.text = "error failure"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension LoginViewController {
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout(){
        view.addSubview(infoLabel)
        view.addSubview(titleLabel)
        view.addSubview(loginView)
        view.addSubview(signButton)
        view.addSubview(erromessageLabel)
        
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        
        NSLayoutConstraint.activate([
            signButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            erromessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signButton.bottomAnchor, multiplier: 2),
            erromessageLabel.leadingAnchor.constraint(equalTo: signButton.leadingAnchor),
            erromessageLabel.trailingAnchor.constraint(equalTo: signButton.trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 28),
            infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: infoLabel.bottomAnchor, multiplier: 1),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}


extension LoginViewController {
    
    @objc func signInTapped(sender: UIButton){
        erromessageLabel.isHidden = true
        login()
    }
    
    private func login(){
        guard let username = loginView.usernameTextField.text, let password = loginView.passwordTextField.text else {
            assertionFailure("Username / password should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username and password cannot be blank")
            return
        }
        if username == "rjsilva" && password == "admin" {
            signButton.configuration?.showsActivityIndicator = true
        } else {
            configureView(withMessage: "Incorrect username / password")
        }
    }
    
    private func configureView(withMessage message: String){
        erromessageLabel.isHidden = false
        erromessageLabel.text = message
    }
}

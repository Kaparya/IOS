//
//  SecondViewController.swift
//  TwoScreens
//
//  Created by Damir Kandelov on 21.09.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    var userData: UserData = UserData()
    
    private lazy var loginLabel: UILabel = {
        let loginLabel = UILabel()
        loginLabel.font = .boldSystemFont(ofSize: 20)
        loginLabel.textColor = .black
        loginLabel.text = "Login: \(userData.login)"
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        return loginLabel
    }()
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = .boldSystemFont(ofSize: 20)
        nameLabel.textColor = .black
        nameLabel.text = "Name: \(userData.name)"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    private lazy var ageLabel: UILabel = {
        let ageLabel = UILabel()
        ageLabel.font = .boldSystemFont(ofSize: 20)
        ageLabel.textColor = .black
        ageLabel.text = "Age: \(userData.age)"
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        return ageLabel
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Update profile", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addAction(
            .init{ [weak self] _ in
                self?.updateProfile()
            } , for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(loginLabel)
        view.addSubview(nameLabel)
        view.addSubview(ageLabel)
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            loginLabel.heightAnchor.constraint(equalToConstant: 30),
            loginLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            loginLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            nameLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            ageLabel.heightAnchor.constraint(equalToConstant: 30),
            ageLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            ageLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
        ])
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 28),
            button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
        ])
    }
    
    private func updateProfile() {
        let controller = ChangeInfoViewController()
        controller.delegate = self
        
        navigationController?.pushViewController(
            controller, animated: true)
        print("> Update profile button <")
    }
}

extension MainViewController: ChangeInfoViewControllerDelegate {
    func getCurrentUserData() -> UserData {
        return self.userData
    }

    func setCurrentUserData(login: String?, name: String?, age: Int?) {
        if let login = login {
            self.userData.login = login
            loginLabel.text = "Login: \(userData.login)"
        }
        if let name = name {
            self.userData.name = name
            nameLabel.text = "Name: \(userData.name)"
        }
        if let age = age {
            self.userData.age = age
            ageLabel.text = "Age: \(userData.age)"
        }
    }
}

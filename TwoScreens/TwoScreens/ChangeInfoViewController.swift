//
//  ViewController.swift
//  TwoScreens
//
//  Created by Damir Kandelov on 21.09.2024.
//

import UIKit

protocol ChangeInfoViewControllerDelegate {
    func getCurrentUserData() -> UserData
    func setCurrentUserData(login: String?, name: String?, age: Int?)
}

class ChangeInfoViewController: UIViewController {
    
    var delegate: ChangeInfoViewControllerDelegate?
    
    private lazy var loginTextField: UITextField = {
        let loginTextField = UITextField()
        loginTextField.placeholder = "Previous login : " + (delegate?.getCurrentUserData().login ?? "")
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        return loginTextField
    }()
    private lazy var nameTextField: UITextField = {
        let nameTextField = UITextField()
        nameTextField.placeholder = "Previous name: " + (delegate?.getCurrentUserData().name ?? "")
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        return nameTextField
    }()
    private lazy var ageTextField: UITextField = {
        let ageTextField = UITextField()
        ageTextField.placeholder = "Previous age: " + String(delegate?.getCurrentUserData().age ?? 0)
        ageTextField.translatesAutoresizingMaskIntoConstraints = false
        return ageTextField
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addAction(
            .init{ [weak self] _ in
                guard let self = self else { return }
                if let delegate = delegate {
                    print(
                        """
                        --- Data read ---
                        Login:\(loginTextField.text ?? "")
                        Name:\(nameTextField.text ?? "")
                        Age:\(ageTextField.text ?? "")
                        ---
                        """)
                    
                    let oldUserData = delegate.getCurrentUserData()
                    delegate.setCurrentUserData(
                        login: loginTextField.hasText
                            ? loginTextField.text : nil,
                        name: nameTextField.hasText
                            ? nameTextField.text : nil,
                        age: ageTextField.hasText
                            ? Int(ageTextField.text!) : nil
                    )
                }
                navigationController?
                    .popViewController(animated: true)
                print("> Save button <")
            } , for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureUI()
    }

    private func configureUI() {
        view.backgroundColor = .systemGray6
        
        view.addSubview(loginTextField)
        view.addSubview(nameTextField)
        view.addSubview(ageTextField)
        
        view.addSubview(saveButton)
        
        NSLayoutConstraint.activate([
            loginTextField.heightAnchor.constraint(equalToConstant: 28),
            loginTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            loginTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            loginTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            nameTextField.heightAnchor.constraint(equalToConstant: 28),
            nameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            ageTextField.heightAnchor.constraint(equalToConstant: 28),
            ageTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            ageTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            ageTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90),
        ])
        
        NSLayoutConstraint.activate([
            saveButton.heightAnchor.constraint(equalToConstant: 28),
            saveButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            saveButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
        ])
    }
}





//
//  MainViewController.swift
//  TabBar
//
//  Created by Damir Kandelov on 20.10.2024.
//

import UIKit

protocol MainViewControllerDelegate {
    func setName()
}

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    var images: [String] = [""]
    
    var delegate: MainViewControllerDelegate?
    
    var onTap: ((Int) -> Void)?
    
    // MARK: - Subviews
    
    private var customView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
//        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var label: UILabel = {
        let label = UILabel()
        label.text = "kfejfnremf"
        label.font = .systemFont(ofSize: 22, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Tapm me", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addAction(
            .init { [weak self] _ in
                guard let self else { return }
                buttonAction2()
                delegate?.setName()
                onTap?(5)
                navigationController?.popViewController(animated: true)
            },
            for: .touchUpInside
        )
//        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "drop.fill.24")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.delegate = self
        textField.placeholder = "Введите текст"
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    // MARK: - Init
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    @objc
    private func buttonAction() {
        print("111")
    }
    
    private func buttonAction2() {
        guard let text = textField.text else { return }
        print(text)
        textField.text = nil
    }
    
    private func configureUI() {
        view.backgroundColor = .brown
        
        view.addSubview(customView)
        
//        NSLayoutConstraint.activate([
//            customView.widthAnchor.constraint(equalToConstant: 100),
//            customView.heightAnchor.constraint(equalToConstant: 100),
//            customView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            customView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50)
//        ])
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.leadingAnchor.constraint(equalTo: customView.trailingAnchor, constant: 40)
        ])
        
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.bottomAnchor.constraint(equalTo: customView.topAnchor, constant: -50),
            imageView.heightAnchor.constraint(equalToConstant: 50),
            imageView.widthAnchor.constraint(equalToConstant: 50),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        view.addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textField.topAnchor.constraint(equalTo: customView.bottomAnchor, constant: 100)
        ])
    }
    
    func setInfo(name: String) { }
}

extension ViewController: UITextFieldDelegate { }


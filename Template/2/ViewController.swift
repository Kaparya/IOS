//
//  ViewController.swift
//  2
//
//  Created by Damir Kandelov on 09.09.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Constants
    
    // MARK: - Properties
    
    // MARK: - Subview
    
    private var number = ""
    
    private let customView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        
        button.layer.cornerRadius = 12
        
        button.backgroundColor = .blue
        button.setTitle("Tap me", for: .normal)
        button.setTitleColor(.black, for: .highlighted)
//        button.addTarget(self, action: #selector(onTap), for: .touchUpInside)
        button.addAction(
            .init { _ in
                self.onTap2()
            }, for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var oneButton: UIButton = self.configureButton(number: "1")
    private lazy var twoButton: UIButton = self.configureButton(number: "2")
    private lazy var threeButton: UIButton = self.configureButton(number: "3")
    private lazy var resultButton: UIButton = self.configureButton(number: "")
    private lazy var clearButton: UIButton = self.configureButton(number: "CLEAR")
    
    
    // MARK: - Init
    
    // MARK: - Methods
    
    private func configureButton(number: String) -> UIButton {
        let button = UIButton()
        
        button.layer.cornerRadius = 12
        
        button.backgroundColor = .black
        button.setTitle(number, for: .normal)
        button.setTitleColor(.orange, for: .highlighted)
        button.addAction(
            .init { _ in
                switch number {
                case "1":
                    self.onTap1()
                case "2":
                    self.onTap2()
                case "3":
                    self.onTap3()
                case "CLEAR":
                    self.clearTap()
                default:
                    self.resultTap()
                }
            }, for: .touchDown)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    @objc
    private func onTap() {
        print("111")
    }
    private func onTap1() {
        number += "1"
        print(number)
    }
    private func onTap2() {
        number += "2"
        print(number)
    }
    private func onTap3() {
        number += "3"
        print(number)
    }
    private func clearTap() {
        number = ""
        print(number)
    }
    private func resultTap() {
        resultButton.setTitle(number, for: .highlighted)
        print(number)
    }


    private func configureUI() {
        view.backgroundColor = .gray
        
//        view.addSubview(customView)
//        view.addSubview(button)
        view.addSubview(oneButton)
        view.addSubview(twoButton)
        view.addSubview(threeButton)
        view.addSubview(clearButton)
        view.addSubview(resultButton)
        
//        NSLayoutConstraint.activate([
//            customView.widthAnchor.constraint(equalToConstant: 100),
//            customView.heightAnchor.constraint(equalToConstant: 100),
//            customView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            customView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
//        ])
        
        NSLayoutConstraint.activate([
            oneButton.widthAnchor.constraint(equalToConstant: 100),
            oneButton.heightAnchor.constraint(equalToConstant: 100),
            oneButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            oneButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            twoButton.widthAnchor.constraint(equalToConstant: 100),
            twoButton.heightAnchor.constraint(equalToConstant: 100),
            twoButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            twoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            threeButton.widthAnchor.constraint(equalToConstant: 100),
            threeButton.heightAnchor.constraint(equalToConstant: 100),
            threeButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            threeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            clearButton.widthAnchor.constraint(equalToConstant: 100),
            clearButton.heightAnchor.constraint(equalToConstant: 100),
            clearButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            clearButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            clearButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            resultButton.heightAnchor.constraint(equalToConstant: 100),
            resultButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            resultButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            resultButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
    }
}


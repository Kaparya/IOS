//
//  ViewController.swift
//  Gallery
//
//  Created by Damir Kandelov on 09.09.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Constants
    
    // MARK: - Properties
    
    private var images: [UIImage?] = []
    private var names: [String] = []
    private var currentImage: Int = 0
    
    // MARK: - Subview
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .systemBlue
        label.text = "Aivazovskiy"
        label.font = .systemFont(ofSize: 40, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .systemBlue
        label.text = self.names[self.currentImage]
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var prevButton: UIButton = self.configureButton(imageName: "arrow.backward.square")
    private lazy var nextButton: UIButton = self.configureButton(imageName: "arrow.right.square")
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = self.images[self.currentImage]
        imageView.contentMode = .scaleAspectFit
        
        imageView.layer.cornerRadius = 14
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Init
    
    private func configureButton(imageName: String) -> UIButton {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(
            pointSize: 50, weight: .medium, scale: .default)
        
        button.setImage(UIImage(systemName: imageName, withConfiguration: config), for: .normal)
        button.setImage(UIImage(systemName: imageName + ".fill", withConfiguration: config), for: .highlighted)
        button.addAction(
            .init { _ in
                switch imageName {
                case "arrow.backward.square":
                    self.prevTap()
                case "arrow.right.square":
                    self.nextTap()
                default:
                    break
                }
            }, for: .touchDown)

        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }
    
    private func downloadImages() {
        images.append(UIImage(named: "more1.jpg") ?? nil)
        names.append("more1")
        images.append(UIImage(named: "more2.jpg") ?? nil)
        names.append("more2")
        images.append(UIImage(named: "more3.jpg") ?? nil)
        names.append("more3")
    }

    private func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(titleLabel)
        view.addSubview(nameLabel)
        
        view.addSubview(prevButton)
        view.addSubview(nextButton)
        
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
        ])
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 500),
        ])
        
        NSLayoutConstraint.activate([
            prevButton.widthAnchor.constraint(equalToConstant: 100),
            prevButton.heightAnchor.constraint(equalToConstant: 100),
            prevButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            prevButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
        ])
        NSLayoutConstraint.activate([
            nextButton.widthAnchor.constraint(equalToConstant: 100),
            nextButton.heightAnchor.constraint(equalToConstant: 100),
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadImages()
        configureUI()
    }
    
    private func prevTap() {
        currentImage = (currentImage + images.count - 1) % images.count
        print(currentImage)
        imageView.image = self.images[self.currentImage]
        nameLabel.text = self.names[self.currentImage]
        
    }
    private func nextTap() {
        currentImage = (currentImage + 1) % images.count
        print(currentImage)
        imageView.image = self.images[self.currentImage]
        nameLabel.text = self.names[self.currentImage]
    }
}


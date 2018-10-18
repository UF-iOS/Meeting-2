//
//  ViewController.swift
//  Meeting 2
//
//  Created by Siddha Tiwari on 10/16/18.
//  Copyright © 2018 Siddha Tiwari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        setupViews()
        
        doneButton.addTarget(self, action: #selector(buttonTouchDown), for: .touchDown)
        // MARK: show that you need to use touchupinside and touchupoutside
        doneButton.addTarget(self, action: #selector(buttonTouchUp), for: .touchUpInside)
        doneButton.addTarget(self, action: #selector(resetOpacity), for: .touchUpOutside)
    }
    
    @objc func buttonTouchDown() {
        UIView.animate(withDuration: 0.2, animations: {
            // MARK: show that you need to use self
            self.doneButton.alpha = 0.4
        })
    }
    
    @objc func resetOpacity() {
        UIView.animate(withDuration: 0.2, animations: {
            self.doneButton.alpha = 1
        })
    }
    
    @objc func buttonTouchUp() {
        var name = nameInput.text ?? "your pet"
        if name == "" { name = "spooky beastie" }
        let alert = UIAlertController(title: "Submitted", message: "We'll find \(name) a buddy!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
            alert.dismiss(animated: true, completion: nil)
        }))
        present(alert, animated: true, completion: nil)
        resetOpacity()
    }
    
    // MARK: use screenshot make to show safearea
    // MARK: explain why declare var outside method
    // MARK: show non closure before closure
    lazy var titleBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Pet Park"
        //label.backgroundColor = .blue
        return label
    }()
    
    lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.backgroundColor = .blue
        return view
    }()
    
    lazy var image: UIImageView = {
        let image = UIImage(named: "dog")
        let view = UIImageView(image: image)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = UIView.ContentMode.scaleAspectFill
        view.layer.cornerRadius = 75
        view.layer.masksToBounds = true
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.white.cgColor
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Name"
        return label
    }()
    
    lazy var nameInput: UITextField = {
        let input = UITextField()
        input.translatesAutoresizingMaskIntoConstraints = false
        input.placeholder = "What's your pet's name?"
        input.backgroundColor = #colorLiteral(red: 0.9995340705, green: 0.988355577, blue: 0.4726552367, alpha: 1)
        input.layer.cornerRadius = 3
        input.delegate = self
        return input
    }()
    
    lazy var descLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Likes"
        return label
    }()
    
    lazy var descBox: UITextView = {
        let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9995340705, green: 0.988355577, blue: 0.4726552367, alpha: 1)
        view.layer.cornerRadius = 3
        view.returnKeyType = UIReturnKeyType.done
        view.delegate = self
        view.font = UIFont.systemFont(ofSize: 16)
        return view
    }()
    
    lazy var doneButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 1, green: 0.4969027123, blue: 0, alpha: 1)
        button.setTitle("SUBMIT", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.layer.cornerRadius = 25
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 0, height: 10)
        button.layer.shadowRadius = 10
        return button
    }()
    
    func setupViews() {
        
        // MARK: show how ordering of adding subviews matters
        view.addSubview(titleBackground)
        view.addSubview(titleLabel)
        view.addSubview(container)
        container.addSubview(nameLabel)
        container.addSubview(nameInput)
        container.addSubview(doneButton)
        container.addSubview(image)
        container.addSubview(descLabel)
        container.addSubview(descBox)
        
        NSLayoutConstraint.activate([
            titleBackground.topAnchor.constraint(equalTo: view.topAnchor),
            titleBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            titleBackground.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: titleLabel.intrinsicContentSize.width),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            container.topAnchor.constraint(equalTo: titleBackground.bottomAnchor, constant: 20),
            container.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            nameLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            nameLabel.widthAnchor.constraint(equalToConstant: 70),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            nameInput.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 20),
            nameInput.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            nameInput.heightAnchor.constraint(equalToConstant: 30),
            nameInput.topAnchor.constraint(equalTo: nameLabel.topAnchor),
            
            doneButton.heightAnchor.constraint(equalToConstant: 50),
            doneButton.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
            doneButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 10),
            doneButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            image.heightAnchor.constraint(equalToConstant: 150),
            image.widthAnchor.constraint(equalToConstant: 150),
            image.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            
            descLabel.widthAnchor.constraint(equalToConstant: 70),
            descLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            
            descBox.topAnchor.constraint(equalTo: descLabel.topAnchor),
            descBox.heightAnchor.constraint(equalToConstant: 100),
            descBox.widthAnchor.constraint(equalTo: nameInput.widthAnchor),
            descBox.leadingAnchor.constraint(equalTo: descLabel.trailingAnchor, constant: 20)
//            descBox.trailingAnchor.constraint(equalTo: container.trailingAnchor)
            ])
        
    }

}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}

extension ViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            view.endEditing(true)
            return false
        }
        return true
    }
}


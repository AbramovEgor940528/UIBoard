//
//  ViewController.swift
//  UIBoard
//
//  Created by Alex Vasilyev on 13.08.2025.
//

import UIKit

class ViewController: UIViewController {

    private let colorSwitch = UISwitch()
    private let colorView = UIView()
    private let someLabel = UILabel()
    private let stepper = UIStepper()
    private let roundableView = UIView()
    private let slider = UISlider()
    private let textField = UITextField()
    private let progressView = UIProgressView(progressViewStyle: .default)
    private let segmentedControl = UISegmentedControl(items: ["First", "Second"])
    private let actionButton = UIButton(type: .system)

  
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupConstraints()
    }

    private func setup() {
        colorSwitch.addTarget(self, action: #selector(switchToggled), for: .valueChanged)
        colorSwitch.onTintColor = .red
        
        colorView.backgroundColor = .blue
        colorView.layer.cornerRadius = 8
        
        someLabel.text = "Введите число от 0 до 100"
        
        
        [colorSwitch, colorView, someLabel, stepper, roundableView,
         slider, textField, progressView, segmentedControl, actionButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            colorSwitch.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            colorSwitch.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            
            colorView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            colorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            colorView.widthAnchor.constraint(equalToConstant: 248),
            colorView.heightAnchor.constraint(equalToConstant: 31),
            
            someLabel.topAnchor.constraint(equalTo: colorSwitch.bottomAnchor, constant: 32),
            someLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            
            someLabel.widthAnchor.constraint(equalToConstant: 203),
            someLabel.heightAnchor.constraint(equalToConstant: 21),
            
            roundableView.topAnchor.constraint(equalTo: someLabel.bottomAnchor, constant: 32),
            roundableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            roundableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 32),
            roundableView.widthAnchor.constraint(equalToConstant: 329),
            roundableView.heightAnchor.constraint(equalToConstant: 100),
            
            slider.topAnchor.constraint(equalTo: roundableView.bottomAnchor, constant: 37),
            slider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            slider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),
            
            textField.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 32),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),
            
            progressView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 32),
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            segmentedControl.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 154),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            
            actionButton.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 67),
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),
            actionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32)
        ])
    }

    @objc private func switchToggled() {
        colorView.backgroundColor = colorSwitch.isOn ? .red : .blue
    }

    @objc private func stepperChanged() {
        someLabel.text = "Введите число от 0 до 100\nТекущее: \(Int(stepper.value))"
    }

    
}

//
//  SecondViewController.swift
//  UIBoard
//
//  Created by Егор Абрамов on 21.08.2025.
//

import UIKit

final class SecondViewController: UIViewController {
    
    private let colorSwitch = UISwitch()
    private let colorView = UIView()
    private let counterLabel = UILabel()
    private let stepper = UIStepper()
    private let roundableView = UIView()
    private let slider = UISlider()
    private let textField = UITextField()
    private let progressView = UIProgressView(progressViewStyle: .default)
    private let segmentedControl = UISegmentedControl(items: ["First", "Second"])
    private let actionButton = UIButton(type: .system)

  
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

private extension SecondViewController {
    
    func setupView() {
        setupSubviews()
        addSubviews()
        setupConstraints()
        switchToggled()
        stepperChanged()
       
    }
    
    func setupSubviews() {
        setupColorSwitch()
        setupColorView()
        setupCounterLabel()
        setupStepper()
        setupRoundableView()
        setupSlider()
        setupTextField()
        setupProgressView()
        setupSegmentedControl()
        setupActionButton()
    }

    func setupColorSwitch() {
        colorSwitch.translatesAutoresizingMaskIntoConstraints = false
        colorSwitch.onTintColor = .red
        colorSwitch.isOn = false
        
        colorSwitch.addTarget(self, action: #selector(switchToggled), for: .valueChanged)
    }
    
    func setupColorView() {
        colorView.translatesAutoresizingMaskIntoConstraints = false
        colorView.backgroundColor = .systemBlue
        colorView.layer.cornerRadius = 8
    }
    
    func setupCounterLabel() {
        counterLabel.translatesAutoresizingMaskIntoConstraints = false
        counterLabel.text = "Текущее состояние счетчика"
        counterLabel.textColor = .systemOrange
      
    }
    
    func setupStepper() {
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.value = 0
        stepper.minimumValue = 0
        stepper.maximumValue = 100
        stepper.stepValue = 1
        
        
        stepper.addTarget(self, action: #selector(stepperChanged), for: .valueChanged)
        
    }

    func setupRoundableView() {
        roundableView.translatesAutoresizingMaskIntoConstraints = false
        roundableView.backgroundColor = .systemBlue
    }
    
    func setupSlider() {
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 0
    }
    
    func setupTextField() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.text = "Введите число от 0 до 100"
        textField.textColor = .systemOrange
    }
    
    func setupProgressView() {
        progressView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupSegmentedControl() {
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupActionButton () {
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.setTitleColor(.systemOrange, for: .normal)
        actionButton.setTitle("Кнопка", for: .normal)
        actionButton.backgroundColor = .systemBlue
        actionButton.layer.cornerRadius = 8
    }
    
    func addSubviews() {
        view.addSubview(colorSwitch)
        view.addSubview(colorView)
        view.addSubview(counterLabel)
        view.addSubview(stepper)
        view.addSubview(roundableView)
        view.addSubview(slider)
        view.addSubview(textField)
        view.addSubview(progressView)
        view.addSubview(segmentedControl)
        view.addSubview(actionButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            colorSwitch.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            colorSwitch.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            
            colorView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            colorView.leadingAnchor.constraint(equalTo: colorSwitch.trailingAnchor, constant: 32),
            colorView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            colorView.heightAnchor.constraint(equalToConstant: 31),
            
            counterLabel.topAnchor.constraint(equalTo: colorSwitch.bottomAnchor, constant: 32),
            counterLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            
            stepper.leadingAnchor.constraint(equalTo: counterLabel.trailingAnchor, constant: 20),
            stepper.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            stepper.centerYAnchor.constraint(equalTo: counterLabel.centerYAnchor),

            roundableView.topAnchor.constraint(equalTo: counterLabel.bottomAnchor, constant: 32),
            roundableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            roundableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            roundableView.heightAnchor.constraint(equalToConstant: 100),
            slider.topAnchor.constraint(equalTo: roundableView.bottomAnchor, constant: 37),
            slider.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            slider.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),

            textField.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 32),
            textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 64),
            textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -64),

            progressView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 32),
            progressView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 64),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),

            segmentedControl.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -67),
            segmentedControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            segmentedControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100),
            segmentedControl.heightAnchor.constraint(equalToConstant: 40),
            
            actionButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 64),
            actionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -64),
            actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            actionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func switchToggled() {
        colorView.backgroundColor = colorSwitch.isOn ? .systemRed : .systemBlue
    }
    
    @objc private func stepperChanged() {
        counterLabel.text = "Текущее число: \(Int(stepper.value))"
    }
}

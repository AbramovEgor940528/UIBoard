//
//  SecondViewController.swift
//  UIBoard
//
//  Created by Егор Абрамов on 21.08.2025.
//

import UIKit

final class SecondViewController: UIViewController {
    
    // MARK: - Constants
        
        private enum Spacing {
            static let small: CGFloat = 8
            static let medium: CGFloat = 20
            static let large: CGFloat = 32
            static let extraLarge: CGFloat = 37
            static let huge: CGFloat = 64
            static let segmentedControl: CGFloat = 67
            static let segmentedControlWidth: CGFloat = 100
        }
        
        private enum Colors {
            static let blue = UIColor.systemBlue
            static let red = UIColor.systemRed
            static let orange = UIColor.systemOrange
            static let black = UIColor.black
        }
        
        private enum ColorSwitch {
            static let onTintColor = Colors.red
            static let initialIsOn = false
        }
        
        private enum ColorView {
            static let backgroundColor = Colors.blue
            static let cornerRadius = Spacing.small
            static let height: CGFloat = 31
        }
        
        private enum CounterLabel {
            static let text = "Текущее состояние счетчика"
            static let textColor = Colors.orange
        }
        
        private enum Stepper {
            static let minValue: Double = 0
            static let maxValue: Double = 100
            static let stepValue: Double = 1
            static let initialValue: Double = 0
        }
        
        private enum RoundableView {
            static let backgroundColor = Colors.blue
            static let height: CGFloat = 100
            static let maxCornerRadius: Float = 50
        }
        
        private enum Slider {
            static let minValue: Float = 0
            static let maxValue: Float = 100
            static let initialValue: Float = 0
        }
        
        private enum TextField {
            static let placeholder = "Введите число от 0 до 100"
            static let textColor = Colors.orange
            static let tintColor = Colors.orange
        }
        
        private enum ProgressView {
            static let minValue: Float = 0
            static let maxValue: Float = 1
        }
        
        private enum SegmentedControl {
            static let height: CGFloat = 40
            static let items = ["First", "Second"]
        }
        
        private enum ActionButton {
            static let title = "Кнопка"
            static let titleColor = Colors.black
            static let backgroundColor = Colors.blue
            static let cornerRadius = Spacing.small
            static let height: CGFloat = 50
        }
    
    // MARK: - UI Properties
    
    private let colorSwitch = UISwitch()
    private let colorView = UIView()
    private let counterLabel = UILabel()
    private let stepper = UIStepper()
    private let roundableView = UIView()
    private let slider = UISlider()
    private let textField = UITextField()
    private let progressView = UIProgressView(progressViewStyle: .default)
    private let segmentedControl = UISegmentedControl(items: SegmentedControl.items)
    private let actionButton = UIButton(type: .system)
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

// MARK: - Private Methods

private extension SecondViewController {
    
    // MARK: - Setup Methods
    
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
        colorSwitch.onTintColor = ColorSwitch.onTintColor
        colorSwitch.isOn = ColorSwitch.initialIsOn
        
        colorSwitch.addTarget(self, action: #selector(switchToggled), for: .valueChanged)
    }
    
    func setupColorView() {
        colorView.translatesAutoresizingMaskIntoConstraints = false
        colorView.backgroundColor = ColorView.backgroundColor
        colorView.layer.cornerRadius = ColorView.cornerRadius
    }
    
    func setupCounterLabel() {
        counterLabel.translatesAutoresizingMaskIntoConstraints = false
        counterLabel.text = CounterLabel.text
        counterLabel.textColor = CounterLabel.textColor
    }
    
    func setupStepper() {
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.value = Stepper.initialValue
        stepper.minimumValue = Stepper.minValue
        stepper.maximumValue = Stepper.maxValue
        stepper.stepValue = Stepper.stepValue
        
        stepper.addTarget(self, action: #selector(stepperChanged), for: .valueChanged)
    }

    func setupRoundableView() {
        roundableView.translatesAutoresizingMaskIntoConstraints = false
        roundableView.backgroundColor = RoundableView.backgroundColor
    }
    
    func setupSlider() {
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = Slider.minValue
        slider.maximumValue = Slider.maxValue
        slider.value = Slider.initialValue
        
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
    }
    
    func setupTextField() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = TextField.placeholder
        textField.textColor = TextField.textColor
        textField.tintColor = TextField.tintColor
        textField.becomeFirstResponder()
        textField.keyboardType = .numberPad
     
        textField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
    }
    
    func setupProgressView() {
        progressView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupSegmentedControl() {
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupActionButton () {
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.setTitleColor(ActionButton.titleColor, for: .normal)
        actionButton.setTitle(ActionButton.title, for: .normal)
        actionButton.backgroundColor = ActionButton.backgroundColor
        actionButton.layer.cornerRadius = ActionButton.cornerRadius
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
    // MARK: - Layout
    
    func setupConstraints() {
            NSLayoutConstraint.activate([
                colorSwitch.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Spacing.medium),
                colorSwitch.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Spacing.large),
                
                colorView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Spacing.medium),
                colorView.leadingAnchor.constraint(equalTo: colorSwitch.trailingAnchor, constant: Spacing.large),
                colorView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Spacing.large),
                colorView.heightAnchor.constraint(equalToConstant: ColorView.height),
                
                counterLabel.topAnchor.constraint(equalTo: colorSwitch.bottomAnchor, constant: Spacing.large),
                counterLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Spacing.large),
                
                stepper.leadingAnchor.constraint(equalTo: counterLabel.trailingAnchor, constant: Spacing.medium),
                stepper.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Spacing.large),
                stepper.centerYAnchor.constraint(equalTo: counterLabel.centerYAnchor),

                roundableView.topAnchor.constraint(equalTo: counterLabel.bottomAnchor, constant: Spacing.large),
                roundableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Spacing.large),
                roundableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Spacing.large),
                roundableView.heightAnchor.constraint(equalToConstant: RoundableView.height),
                
                slider.topAnchor.constraint(equalTo: roundableView.bottomAnchor, constant: Spacing.extraLarge),
                slider.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Spacing.large),
                slider.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Spacing.large),

                textField.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: Spacing.large),
                textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Spacing.huge),
                textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Spacing.huge),

                progressView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: Spacing.large),
                progressView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Spacing.huge),
                progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Spacing.huge),

                segmentedControl.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -Spacing.segmentedControl),
                segmentedControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Spacing.segmentedControlWidth),
                segmentedControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Spacing.segmentedControlWidth),
                segmentedControl.heightAnchor.constraint(equalToConstant: SegmentedControl.height),
                
                actionButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Spacing.huge),
                actionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Spacing.huge),
                actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Spacing.large),
                actionButton.heightAnchor.constraint(equalToConstant: ActionButton.height)
            ])
        }
    
    // MARK: - Actions
    
    @objc func switchToggled() {
        colorView.backgroundColor = colorSwitch.isOn ? .systemRed : .systemBlue
    }
    
    @objc func stepperChanged() {
        counterLabel.text = "Текущее число: \(Int(stepper.value))"
    }
    
    @objc func sliderValueChanged() {
//        первый вариант
        
//        if slider.value >= 50 {
//            roundableView.layer.cornerRadius = 50
//        } else {
//            roundableView.layer.cornerRadius = CGFloat(slider.value)
//        }
//
//        второй вариант
        
//        roundableView.layer.cornerRadius = slider.value >= 50 ? 50 : CGFloat(slider.value)
        
//        третий вариант
    
        roundableView.layer.cornerRadius = CGFloat(min(slider.value, 50))
    }
    
    @objc func textFieldChanged() {
        if let text = textField.text,
           let value = Float(text),
           value >= 0 && value <= 100 {
            
            let progress = value / 100.0
            progressView.setProgress(progress, animated: true)
        } else {
            progressView.setProgress(0, animated: true)
        }
    }
}

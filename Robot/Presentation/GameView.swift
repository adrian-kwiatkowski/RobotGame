import UIKit

class GameView: UIView {
    
    let viewModel: GameViewModel
    
    let appTitleLabel = UILabel()
    let roomSetupLabel = UILabel()
    let widthLabelStepper = LabelStepperView()
    let lengthLabelStepper = LabelStepperView()
    let robotSetupLabel = UILabel()
    let xLabelStepper = LabelStepperView()
    let yLabelStepper = LabelStepperView()
    let directionLabel = UILabel()
    let directionSegmentedControl = UISegmentedControl(items: ["N", "E", "S", "W"])
    let commandsLabel = UILabel()
    let commandsTextField = UITextField()
    let startGameButton = UIButton(type: .system)
    let resultsLabel = UILabel()
    let resultsValueLabel = UILabel()
    
    init(viewModel: GameViewModel = GameViewModel()) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupUI()
        setupConstraints()
        bindUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubviews(appTitleLabel,
                    roomSetupLabel,
                    widthLabelStepper,
                    lengthLabelStepper,
                    robotSetupLabel,
                    xLabelStepper,
                    yLabelStepper,
                    directionLabel,
                    directionSegmentedControl,
                    commandsLabel,
                    commandsTextField,
                    startGameButton,
                    resultsLabel,
                    resultsValueLabel)
        
        backgroundColor = .systemBackground
        
        appTitleLabel.text = "Robot Game"
        appTitleLabel.textAlignment = .center
        
        roomSetupLabel.text = "Room setup:"
        widthLabelStepper.titleLabel.text = "width:"
        widthLabelStepper.stepper.minimumValue = 1.0
        lengthLabelStepper.titleLabel.text = "length:"
        lengthLabelStepper.stepper.minimumValue = 1.0
        
        robotSetupLabel.text = "Robot setup:"
        xLabelStepper.titleLabel.text = "x:"
        yLabelStepper.titleLabel.text = "y:"
        directionLabel.text = "Direction:"
        directionSegmentedControl.selectedSegmentIndex = 0
        
        commandsLabel.text = "Commands (L, R, F):"
        commandsTextField.borderStyle = .roundedRect
        commandsTextField.textAlignment = .right
        
        startGameButton.setTitle("Start game", for: .normal)
        startGameButton.backgroundColor = .systemBlue
        startGameButton.setTitleColor(UIColor.white, for: .normal)
        startGameButton.layer.cornerRadius = 16
        
        resultsLabel.text = "Result:"
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.frame.origin.y == 0 {
                self.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.frame.origin.y != 0 {
            self.frame.origin.y = 0
        }
    }
    
    @objc func dismissKeyboard() {
        endEditing(true)
    }
    
    func setupConstraints() {
        appTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        roomSetupLabel.translatesAutoresizingMaskIntoConstraints = false
        widthLabelStepper.translatesAutoresizingMaskIntoConstraints = false
        lengthLabelStepper.translatesAutoresizingMaskIntoConstraints = false
        robotSetupLabel.translatesAutoresizingMaskIntoConstraints = false
        xLabelStepper.translatesAutoresizingMaskIntoConstraints = false
        yLabelStepper.translatesAutoresizingMaskIntoConstraints = false
        directionLabel.translatesAutoresizingMaskIntoConstraints = false
        directionSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        commandsLabel.translatesAutoresizingMaskIntoConstraints = false
        commandsTextField.translatesAutoresizingMaskIntoConstraints = false
        startGameButton.translatesAutoresizingMaskIntoConstraints = false
        resultsLabel.translatesAutoresizingMaskIntoConstraints = false
        resultsValueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            appTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            appTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
            appTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16.0),
            
            roomSetupLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            roomSetupLabel.topAnchor.constraint(equalTo: appTitleLabel.bottomAnchor, constant: 16.0),
            
            widthLabelStepper.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32.0),
            widthLabelStepper.topAnchor.constraint(equalTo: roomSetupLabel.bottomAnchor, constant: 16.0),
            widthLabelStepper.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32.0),
            
            lengthLabelStepper.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32.0),
            lengthLabelStepper.topAnchor.constraint(equalTo: widthLabelStepper.bottomAnchor, constant: 16.0),
            lengthLabelStepper.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32.0),
            
            robotSetupLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            robotSetupLabel.topAnchor.constraint(equalTo: lengthLabelStepper.bottomAnchor, constant: 32.0),
            robotSetupLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
            
            xLabelStepper.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32.0),
            xLabelStepper.topAnchor.constraint(equalTo: robotSetupLabel.bottomAnchor, constant: 16.0),
            xLabelStepper.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32.0),
            
            yLabelStepper.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32.0),
            yLabelStepper.topAnchor.constraint(equalTo: xLabelStepper.bottomAnchor, constant: 16.0),
            yLabelStepper.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32.0),
            
            directionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32.0),
            directionLabel.topAnchor.constraint(equalTo: yLabelStepper.bottomAnchor, constant: 16.0),
            
            directionSegmentedControl.leadingAnchor.constraint(equalTo: directionLabel.trailingAnchor, constant: 32.0),
            directionSegmentedControl.centerYAnchor.constraint(equalTo: directionLabel.centerYAnchor),
            directionSegmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
            
            commandsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            commandsLabel.topAnchor.constraint(equalTo: directionLabel.bottomAnchor, constant: 32.0),
            
            commandsTextField.leadingAnchor.constraint(equalTo: commandsLabel.trailingAnchor, constant: 32.0),
            commandsTextField.centerYAnchor.constraint(equalTo: commandsLabel.centerYAnchor),
            commandsTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
            
            startGameButton.topAnchor.constraint(equalTo: commandsLabel.bottomAnchor, constant: 32.0),
            startGameButton.heightAnchor.constraint(equalToConstant: 40.0),
            startGameButton.widthAnchor.constraint(equalToConstant: 120.0),
            startGameButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            resultsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            resultsLabel.topAnchor.constraint(equalTo: startGameButton.bottomAnchor, constant: 16.0),
            
            resultsValueLabel.leadingAnchor.constraint(equalTo: resultsLabel.trailingAnchor, constant: 8.0),
            resultsValueLabel.centerYAnchor.constraint(equalTo: resultsLabel.centerYAnchor),
            resultsValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0)
        ])
    }
    
    @objc private func widthLabelStepperValueChanged(_ sender: UIStepper) {
        viewModel.widthStepperValueChanged(Int(sender.value))
    }
    
    @objc private func lengthLabelStepperValueChanged(_ sender: UIStepper) {
        viewModel.lengthStepperValueChanged(Int(sender.value))
    }
    
    @objc private func xLabelStepperValueChanged(_ sender: UIStepper) {
        viewModel.xStepperValueChanged(Int(sender.value))
    }
    
    @objc private func yLabelStepperValueChanged(_ sender: UIStepper) {
        viewModel.yStepperValueChanged(Int(sender.value))
    }
    
    @objc private func directionSegmentedControlValueChanged(_ sender: UISegmentedControl) {
        viewModel.directionControlTapped(sender.selectedSegmentIndex)
    }
    
    @objc private func commandsTextFieldValueChanged(_ sender: UITextField) {
        viewModel.commandsTyped(sender.text ?? "")
    }
    
    @objc private func startGameButtonTapped(_ sender: UIButton) {
        endEditing(true)
        viewModel.startGame()
    }
    
    func bindUI() {
        viewModel.widthRelay.sink {
            self.widthLabelStepper.valueLabel.text = "\(Int($0))"
            self.xLabelStepper.stepper.maximumValue = Double($0) - 1.0
            self.xLabelStepper.stepper.sendActions(for: .valueChanged)
        }.store(in: &viewModel.cancellables)
        
        viewModel.lengthRelay.sink {
            self.lengthLabelStepper.valueLabel.text = "\(Int($0))"
            self.yLabelStepper.stepper.maximumValue = Double($0) - 1.0
            self.yLabelStepper.stepper.sendActions(for: .valueChanged)
        }.store(in: &viewModel.cancellables)
        
        viewModel.xRelay.sink {
            self.xLabelStepper.valueLabel.text = "\(Int($0))"
        }.store(in: &viewModel.cancellables)
        
        viewModel.yRelay.sink {
            self.yLabelStepper.valueLabel.text = "\(Int($0))"
        }.store(in: &viewModel.cancellables)
        
        viewModel.resultsRelay.sink {
            self.resultsValueLabel.text = $0
        }.store(in: &viewModel.cancellables)
        
        widthLabelStepper.stepper.addTarget(self, action: #selector(widthLabelStepperValueChanged(_:)), for: .valueChanged)
        
        lengthLabelStepper.stepper.addTarget(self, action: #selector(lengthLabelStepperValueChanged(_:)), for: .valueChanged)
        
        xLabelStepper.stepper.addTarget(self, action: #selector(xLabelStepperValueChanged(_:)), for: .valueChanged)
        
        yLabelStepper.stepper.addTarget(self, action: #selector(yLabelStepperValueChanged(_:)), for: .valueChanged)
        
        directionSegmentedControl.addTarget(self, action: #selector(directionSegmentedControlValueChanged(_:)), for: .valueChanged)
        
        commandsTextField.addTarget(self, action: #selector(commandsTextFieldValueChanged(_:)), for: .editingChanged)
        
        startGameButton.addTarget(self, action: #selector(startGameButtonTapped(_:)), for: .touchUpInside)
    }
}

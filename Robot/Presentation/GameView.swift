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
    let directionSegmentedControl = UISegmentedControl(items: ["North", "East", "South", "West"])
    let startGameButton = UIButton(type: .roundedRect)
    let resultsLabel = UILabel()
    let resultsValueLabel = UILabel()
    
    init(viewModel: GameViewModel = GameViewModel()) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupUI()
        setupConstraints()
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
                    startGameButton,
                    resultsLabel,
                    resultsValueLabel)
        
        backgroundColor = .systemBackground
        
        appTitleLabel.text = "Robot Game"
        appTitleLabel.textAlignment = .center
        
        roomSetupLabel.text = "Room setup:"
        widthLabelStepper.titleLabel.text = "width:"
        widthLabelStepper.valueLabel.text = "1"
        lengthLabelStepper.titleLabel.text = "length:"
        lengthLabelStepper.valueLabel.text = "2"
        
        robotSetupLabel.text = "Robot setup:"
        xLabelStepper.titleLabel.text = "x:"
        xLabelStepper.valueLabel.text = "1"
        yLabelStepper.titleLabel.text = "y:"
        yLabelStepper.valueLabel.text = "1"
        directionLabel.text = "Direction:"
        directionSegmentedControl.selectedSegmentIndex = 0
        
        startGameButton.setTitle("Start game", for: .normal)
        
        resultsLabel.text = "Result:"
        resultsValueLabel.text = "(1, 2) N"
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
            directionSegmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32.0),
            
            startGameButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32.0),
            startGameButton.topAnchor.constraint(equalTo: directionLabel.bottomAnchor, constant: 16.0),
            startGameButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32.0),
            
            resultsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            resultsLabel.topAnchor.constraint(equalTo: startGameButton.bottomAnchor, constant: 16.0),
            
            resultsValueLabel.leadingAnchor.constraint(equalTo: resultsLabel.trailingAnchor, constant: 8.0),
            resultsValueLabel.centerYAnchor.constraint(equalTo: resultsLabel.centerYAnchor),
            resultsValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0)
        ])
    }
}

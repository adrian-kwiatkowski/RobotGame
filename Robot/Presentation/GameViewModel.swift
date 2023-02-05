import Combine

class GameViewModel {
    
    var cancellables = Set<AnyCancellable>()
    
    let widthRelay = CurrentValueSubject<Int, Never>(1)
    let lengthRelay = CurrentValueSubject<Int, Never>(1)
    let xRelay = CurrentValueSubject<Int, Never>(0)
    let yRelay = CurrentValueSubject<Int, Never>(0)
    let directionRelay = CurrentValueSubject<Direction, Never>(Direction.north)
    let commandsRelay = CurrentValueSubject<String, Never>("")
    
    let resultsRelay = CurrentValueSubject<String, Never>("")
    
    func widthStepperValueChanged(_ newValue: Int) {
        widthRelay.send(newValue)
    }
    
    func lengthStepperValueChanged(_ newValue: Int) {
        lengthRelay.send(newValue)
    }
    
    func xStepperValueChanged(_ newValue: Int) {
        xRelay.send(newValue)
    }
    
    func yStepperValueChanged(_ newValue: Int) {
        yRelay.send(newValue)
    }
    
    func directionControlTapped(_ newValue: Int) {
        guard let newDirection = Direction(rawValue: newValue) else { return }
        directionRelay.send(newDirection)
    }
    
    func commandsTyped(_ commands: String) {
        commandsRelay.send(commands)
    }
    
    func startGame() {
        guard let room = Room(width: widthRelay.value, length: lengthRelay.value) else {
            resultsRelay.send("Unable to create room")
            return
        }
        let startingPoint = Point(x: xRelay.value, y: yRelay.value)
        let robot = Robot(coordinates: startingPoint, direction: directionRelay.value)
        guard var game = Game(room: room, robot: robot, commands: commandsRelay.value) else {
            resultsRelay.send("unable to create game")
            return
        }
        
        game.start()
        
        resultsRelay.send("(\(game.robot.coordinates.x), \(game.robot.coordinates.y)) \(game.robot.direction.initialLetter)")
    }
}

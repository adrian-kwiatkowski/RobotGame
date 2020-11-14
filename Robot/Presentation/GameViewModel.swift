import RxRelay
import RxSwift

class GameViewModel {
    
    let disposeBag = DisposeBag()
    
    let widthRelay = BehaviorRelay(value: 1)
    let lengthRelay = BehaviorRelay(value: 1)
    let xRelay = BehaviorRelay(value: 0)
    let yRelay = BehaviorRelay(value: 0)
    let directionRelay = BehaviorRelay(value: Direction.north)
    let commandsRelay = BehaviorRelay(value: "")
    
    let resultsRelay = BehaviorRelay(value: "")
    
    func widthStepperValueChanged(_ newValue: Int) {
        widthRelay.accept(newValue)
    }
    
    func lengthStepperValueChanged(_ newValue: Int) {
        lengthRelay.accept(newValue)
    }
    
    func xStepperValueChanged(_ newValue: Int) {
        xRelay.accept(newValue)
    }
    
    func yStepperValueChanged(_ newValue: Int) {
        yRelay.accept(newValue)
    }
    
    func directionControlTapped(_ newValue: Int) {
        guard let newDirection = Direction(rawValue: newValue) else { return }
        directionRelay.accept(newDirection)
    }
    
    func commandsTyped(_ commands: String) {
        commandsRelay.accept(commands)
    }
    
    func startGame() {
        guard let room = Room(width: widthRelay.value, length: lengthRelay.value) else {
            resultsRelay.accept("Unable to create room")
            return
        }
        let startingPoint = Point(x: xRelay.value, y: yRelay.value)
        let robot = Robot(coordinates: startingPoint, direction: directionRelay.value)
        guard var game = Game(room: room, robot: robot, commands: commandsRelay.value) else {
            resultsRelay.accept("unable to create game")
            return
        }
        
        game.start()
        
        resultsRelay.accept("(\(game.robot.coordinates.x), \(game.robot.coordinates.y)) \(game.robot.direction.initialLetter)")
    }
}

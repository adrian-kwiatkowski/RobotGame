protocol RobotProtocol {
    var coordinates: PointProtocol { get set }
    var direction: Direction { get }
    
    func canMoveForward(in room: RoomProtocol) -> Bool
    mutating func execute(command: Command)
}

struct Robot: RobotProtocol {
    var coordinates: PointProtocol
    var direction: Direction
    
    mutating func execute(command: Command) {
        switch command {
        case .moveForward:
            moveForward()
        case .turnLeft:
            turnLeft()
        case .turnRight:
            turnRight()
        }
    }
    
    func canMoveForward(in room: RoomProtocol) -> Bool {
        let potentialMoveCoordinates = coordinates.leadingPoint(toThe: direction)
        return room.contains(point: potentialMoveCoordinates)
    }
    
    private mutating func moveForward() {
        coordinates = coordinates.leadingPoint(toThe: direction)
    }
    
    private mutating func turnRight() {
        let newValue = mod(direction.rawValue + 1, Direction.allCases.count)
        guard let newDirection = Direction(rawValue: newValue) else { return }
        direction = newDirection
    }
    
    private mutating func turnLeft() {
        let newValue = mod(direction.rawValue - 1, Direction.allCases.count)
        guard let newDirection = Direction(rawValue: newValue) else { return }
        direction = newDirection
    }
    
    private func mod(_ a: Int, _ n: Int) -> Int {
        let r = a % n
        return r >= 0 ? r : r + n
    }
}

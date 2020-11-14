@testable import Robot

struct RobotStub: RobotProtocol {
    
    var coordinates: PointProtocol
    var direction: Direction
    
    mutating func execute(command: Command) {}
    
    func canMoveForward(in room: RoomProtocol) -> Bool {
        return true
    }
}

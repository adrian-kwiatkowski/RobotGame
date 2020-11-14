protocol GameProtocol {
    func start()
}

struct Game {
    
    let room: RoomProtocol
    var robot: RobotProtocol
    let commands: [Command]
    
    init?(room: RoomProtocol, robot: RobotProtocol, commands: String) {
        self.room = room
        
        guard room.contains(point: robot.coordinates) else { return nil }
        
        self.robot = robot
        
        self.commands = commands.compactMap{ Command(rawValue: $0) }
    }
    
    mutating func start() {
        for command in commands {
            
            if command == .moveForward {
                guard robot.canMoveForward(in: room) else { continue }
            }
    
            robot.execute(command: command)
        }
    }
}

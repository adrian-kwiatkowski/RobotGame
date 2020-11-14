import XCTest
@testable import Robot

class GameTests: XCTestCase {
    
    func testInitWithProperValues() {
        let room = RoomStub(width: 5, length: 5)
        let startingPoint = PointStub(x: 1, y: 1)
        let robot = RobotStub(coordinates: startingPoint, direction: .north)
        let subject = Game(room: room, robot: robot, commands: "RFRFFRFRF")
        
        XCTAssertNotNil(subject)
    }
    
    func testInitWithEmptyCommands() {
        let room = RoomStub(width: 5, length: 5)
        let startingPoint = PointStub(x: 1, y: 1)
        let robot = RobotStub(coordinates: startingPoint, direction: .north)
        let subject = Game(room: room, robot: robot, commands: "")
        
        XCTAssertNotNil(subject)
    }
    
    func testGameExample1() {
        let room = RoomStub(width: 5, length: 5)
        let startingPoint = PointStub(x: 1, y: 2)
        let robot = Robot(coordinates: startingPoint, direction: .north)
        var subject = Game(room: room, robot: robot, commands: "RFRFFRFRF")
        
        subject?.start()
        
        XCTAssertEqual(subject!.robot.coordinates as! PointStub, PointStub(x: 1, y: 3))
        XCTAssertEqual(subject?.robot.direction, .north)
    }
    
    func testGameExample2() {
        let room = RoomStub(width: 5, length: 5)
        let startingPoint = PointStub(x: 0, y: 0)
        let robot = Robot(coordinates: startingPoint, direction: .east)
        var subject = Game(room: room, robot: robot, commands: "RFLFFLRF")
        
        subject?.start()
        
        XCTAssertEqual(subject!.robot.coordinates as! PointStub, PointStub(x: 3, y: 1))
        XCTAssertEqual(subject?.robot.direction, .east)
    }
    
    func testGameExample3() {
        let room = RoomStub(width: 5, length: 5)
        let startingPoint = PointStub(x: 0, y: 0)
        let robot = Robot(coordinates: startingPoint, direction: .north)
        var subject = Game(room: room, robot: robot, commands: "FFFFF")
        
        subject?.start()
        
        XCTAssertEqual(subject!.robot.coordinates as! PointStub, startingPoint)
        XCTAssertEqual(subject?.robot.direction, robot.direction)
    }
    
    func testGameExample4() {
        let room = RoomStub(width: 5, length: 5)
        let startingPoint = PointStub(x: 0, y: 0)
        let robot = Robot(coordinates: startingPoint, direction: .north)
        var subject = Game(room: room, robot: robot, commands: "LL")
        
        subject?.start()
        
        XCTAssertEqual(subject!.robot.coordinates as! PointStub, startingPoint)
        XCTAssertEqual(subject?.robot.direction, .south)
    }
}

import XCTest
@testable import Robot

class RobotTests: XCTestCase {
    
    let pointStub = PointStub(x: 0, y: 0)
    let roomStub = RoomStub(width: 2, length: 2)
    
    func testCanMoveForwardNorthReturnsFalse() {
        let subject = Robot(coordinates: pointStub, direction: .north)
        XCTAssertFalse(subject.canMoveForward(in: roomStub))
    }
    
    func testCanMoveForwardNorthReturnsTrue() {
        let subject = Robot(coordinates: PointStub(x: 1, y: 1), direction: .north)
        XCTAssertTrue(subject.canMoveForward(in: roomStub))
    }
    
    func testCanMoveForwardEastReturnsFalse() {
        let subject = Robot(coordinates: PointStub(x: 1, y: 0), direction: .east)
        XCTAssertFalse(subject.canMoveForward(in: roomStub))
    }
    
    func testCanMoveForwardEastReturnsTrue() {
        let subject = Robot(coordinates: pointStub, direction: .east)
        XCTAssertTrue(subject.canMoveForward(in: roomStub))
    }
    
    func testCanMoveForwardSouthReturnsFalse() {
        let subject = Robot(coordinates: PointStub(x: 0, y: 1), direction: .south)
        XCTAssertFalse(subject.canMoveForward(in: roomStub))
    }
    
    func testCanMoveForwardSouthReturnsTrue() {
        let subject = Robot(coordinates: pointStub, direction: .south)
        XCTAssertTrue(subject.canMoveForward(in: roomStub))
    }
    
    func testCanMoveForwardWestReturnsFalse() {
        let subject = Robot(coordinates: pointStub, direction: .west)
        XCTAssertFalse(subject.canMoveForward(in: roomStub))
    }
    
    func testCanMoveForwardWestReturnsTrue() {
        let subject = Robot(coordinates: PointStub(x: 1, y: 0), direction: .west)
        XCTAssertTrue(subject.canMoveForward(in: roomStub))
    }
    
    func testNorthMoveForward() {
        var subject = Robot(coordinates: pointStub, direction: .north)
        
        subject.execute(command: .moveForward)
        
        XCTAssertEqual(subject.coordinates as! PointStub, PointStub(x: 0, y: -1))
        XCTAssertEqual(subject.direction, .north)
    }
    
    func testEastMoveForward() {
        var subject = Robot(coordinates: pointStub, direction: .east)
        
        subject.execute(command: .moveForward)
        
        XCTAssertEqual(subject.coordinates as! PointStub, PointStub(x: 1, y: 0))
        XCTAssertEqual(subject.direction, .east)
    }
    
    func testSouthMoveForward() {
        var subject = Robot(coordinates: pointStub, direction: .south)
        
        subject.execute(command: .moveForward)
        
        XCTAssertEqual(subject.coordinates as! PointStub, PointStub(x: 0, y: 1))
        XCTAssertEqual(subject.direction, .south)
    }
    
    func testWestMoveForward() {
        var subject = Robot(coordinates: pointStub, direction: .west)
        
        subject.execute(command: .moveForward)
        
        XCTAssertEqual(subject.coordinates as! PointStub, PointStub(x: -1, y: 0))
        XCTAssertEqual(subject.direction, .west)
    }
    
    func testNorthTurnRight() {
        var subject = Robot(coordinates: pointStub, direction: .north)
        
        subject.execute(command: .turnRight)
        
        XCTAssertEqual(subject.coordinates as! PointStub, PointStub(x: 0, y: 0))
        XCTAssertEqual(subject.direction, .east)
    }
    
    func testNorthTurnLeft() {
        var subject = Robot(coordinates: pointStub, direction: .north)
        
        subject.execute(command: .turnLeft)
        
        XCTAssertEqual(subject.coordinates as! PointStub, PointStub(x: 0, y: 0))
        XCTAssertEqual(subject.direction, .west)
    }
    
    func testEastTurnRight() {
        var subject = Robot(coordinates: pointStub, direction: .east)
        
        subject.execute(command: .turnRight)
        
        XCTAssertEqual(subject.coordinates as! PointStub, PointStub(x: 0, y: 0))
        XCTAssertEqual(subject.direction, .south)
    }
    
    func testEastTurnLeft() {
        var subject = Robot(coordinates: pointStub, direction: .east)
        
        subject.execute(command: .turnLeft)
        
        XCTAssertEqual(subject.coordinates as! PointStub, PointStub(x: 0, y: 0))
        XCTAssertEqual(subject.direction, .north)
    }
    
    func testSouthTurnRight() {
        var subject = Robot(coordinates: pointStub, direction: .south)
        
        subject.execute(command: .turnRight)
        
        XCTAssertEqual(subject.coordinates as! PointStub, PointStub(x: 0, y: 0))
        XCTAssertEqual(subject.direction, .west)
    }
    
    func testSouthTurnLeft() {
        var subject = Robot(coordinates: pointStub, direction: .south)
        
        subject.execute(command: .turnLeft)
        
        XCTAssertEqual(subject.coordinates as! PointStub, PointStub(x: 0, y: 0))
        XCTAssertEqual(subject.direction, .east)
    }
    
    func testWestTurnRight() {
        var subject = Robot(coordinates: pointStub, direction: .west)
        
        subject.execute(command: .turnRight)
        
        XCTAssertEqual(subject.coordinates as! PointStub, PointStub(x: 0, y: 0))
        XCTAssertEqual(subject.direction, .north)
    }
    
    func testWestTurnLeft() {
        var subject = Robot(coordinates: pointStub, direction: .west)
        
        subject.execute(command: .turnLeft)
        
        XCTAssertEqual(subject.coordinates as! PointStub, PointStub(x: 0, y: 0))
        XCTAssertEqual(subject.direction, .south)
    }
}

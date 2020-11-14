import XCTest
@testable import Robot

class RoomTests: XCTestCase {
    
    var subject: Room!
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        subject = nil
        super.tearDown()
    }
    
    func testInitSuccessWithCorrectWidthAndLength() {
        XCTAssertNotNil(Room(width: 1, length: 1))
    }
    
    func testInitFailWithIncorrectWidthOrLength() {
        XCTAssertNil(Room(width: 0, length: 0))
        XCTAssertNil(Room(width: 1, length: 0))
        XCTAssertNil(Room(width: 0, length: 1))
    }
    
    func testContainsPointsInsideTheRoomReturnsTrue() {
        subject = Room(width: 5, length: 5)
        
        XCTAssertTrue(subject.contains(point: PointStub(x: 0, y: 1)))
        XCTAssertTrue(subject.contains(point: PointStub(x: 1, y: 0)))
        XCTAssertTrue(subject.contains(point: PointStub(x: 3, y: 4)))
        XCTAssertTrue(subject.contains(point: PointStub(x: 4, y: 3)))
    }
    
    func testContainsPointsOutsideTheRoomReturnsFalse() {
        subject = Room(width: 5, length: 5)
        
        XCTAssertFalse(subject.contains(point: PointStub(x: -1, y: 0)))
        XCTAssertFalse(subject.contains(point: PointStub(x: 0, y: -1)))
        XCTAssertFalse(subject.contains(point: PointStub(x: 4, y: 5)))
        XCTAssertFalse(subject.contains(point: PointStub(x: 5, y: 4)))
    }
}

import XCTest
@testable import Robot

class PointTests: XCTestCase {
    
    let startingPoint = Point(x: 0, y: 0)
    
    func testLeadingPointNorth() {
        let subject = startingPoint.leadingPoint(toThe: .north) as! Point
        XCTAssertEqual(subject, Point(x: 0, y: -1))
    }
    
    func testLeadingPointEast() {
        let subject = startingPoint.leadingPoint(toThe: .east) as! Point
        XCTAssertEqual(subject, Point(x: 1, y: 0))
    }
    
    func testLeadingPointSouth() {
        let subject = startingPoint.leadingPoint(toThe: .south) as! Point
        XCTAssertEqual(subject, Point(x: 0, y: 1))
    }
    
    func testLeadingPointWest() {
        let subject = startingPoint.leadingPoint(toThe: .west) as! Point
        XCTAssertEqual(subject, Point(x: -1, y: 0))
    }
}

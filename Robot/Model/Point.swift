protocol PointProtocol {
    var x: Int { get set }
    var y: Int { get set }
    
    func leadingPoint(toThe direction: Direction) -> PointProtocol
}

extension PointProtocol {
    
    func leadingPoint(toThe direction: Direction) -> PointProtocol {
        var leadingPoint = self
        switch direction {
        case .north:
            leadingPoint.y -= 1
        case .east:
            leadingPoint.x += 1
        case .south:
            leadingPoint.y += 1
        case .west:
            leadingPoint.x -= 1
        }
        
        return leadingPoint
    }
}

struct Point: PointProtocol, Equatable {
    var x: Int
    var y: Int
}

protocol RoomProtocol {
    var width: Int { get }
    var length: Int { get }
    
    func contains(point: PointProtocol) -> Bool
}

extension RoomProtocol {
    
    func contains(point: PointProtocol) -> Bool {
        (point.x >= 0) && (point.x < width) && (point.y >= 0) && (point.y < length)
    }
}

struct Room: RoomProtocol {
    let width: Int
    let length: Int
    
    init?(width: Int, length: Int) {
        guard width > 0 && length > 0 else { return nil }
        self.width = width
        self.length = length
    }
}

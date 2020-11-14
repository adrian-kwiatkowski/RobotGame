enum Direction: Int, CaseIterable {
    case north, east, south, west
    
    var initialLetter: String {
        switch self {
        case .north:
            return "N"
        case .east:
            return "E"
        case .south:
            return "S"
        case .west:
            return "W"
        }
    }
}


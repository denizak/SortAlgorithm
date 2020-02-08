import Vapor

struct Result: Content {
    let name: String
    let time: TimeInterval
    let items: [Int]
}
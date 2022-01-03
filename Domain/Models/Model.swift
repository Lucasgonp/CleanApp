import Foundation

public protocol Model: Encodable, Equatable, Decodable {}

public extension Model {
    func toData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}

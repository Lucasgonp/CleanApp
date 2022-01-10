import Foundation

public protocol Model: Encodable, Equatable, Decodable {}

public extension Model {
    func toData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
    
    func toJson() -> [String: Any]? {
        guard let data = self.toData() else { return nil }
        let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
        return json as? [String: Any]
    }
}

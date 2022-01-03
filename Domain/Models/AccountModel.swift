import Foundation

public struct AccountModel: Model {
    public var id: String
    public var name: String
    public var email: String
    public var password: String
    
    public init(
        name: String,
        email: String,
        password: String,
        id: String
    ) {
        self.name = name
        self.email = email
        self.password = password
        self.id = id
    }
}
import Data
import Domain
import Infra
import Foundation

final class UseCaseFactory {
    private static let httpClient = AlamofireAdapter()
    private static let apiBaseUrl = "https://demo1986349.mockable.io/app"
    
    private static func makeUrl(path: String) -> URL {
        return URL(string: "\(apiBaseUrl)/\(path)")!
    }
    
    static func makeRemoteAddAccount() -> AddAccount {
        return RemoteAddAccount(url: makeUrl(path: "register"), httpClient: httpClient)
    }
}

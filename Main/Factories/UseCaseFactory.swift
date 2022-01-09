import Data
import Domain
import Infra
import Foundation

final class UseCaseFactory {
    static func makeRemoteAddAccount() -> AddAccount {
        let url = URL(string: "https://demo1986349.mockable.io/app/register")!
        let alamofireAdapter = AlamofireAdapter()
        let remoteAddAccount = RemoteAddAccount(url: url, httpClient: alamofireAdapter)
        return remoteAddAccount
    }
}

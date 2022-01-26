import Data
import Domain
import Foundation

func makeRemoteAddAccount() -> AddAccount {
    return makeRemoteAddAccountWith(httpClient: makeAlamofireAdapter())
}

func makeRemoteAddAccountWith(httpClient: HttpPostClient) -> AddAccount {
    let remoteAddAccount = RemoteAddAccount(url: makeApiUrl(path: "register"), httpClient: httpClient)
    return MainQueueDispatchDecorator(remoteAddAccount)
}

import Data
import Domain
import Foundation

func makeRemoteAddAccount(httpClient: HttpPostClient) -> AddAccount {
    let remoteAddAccount = RemoteAddAccount(url: makeApiUrl(path: "register"), httpClient: httpClient)
    return MainQueueDispatchDecorator(remoteAddAccount)
}

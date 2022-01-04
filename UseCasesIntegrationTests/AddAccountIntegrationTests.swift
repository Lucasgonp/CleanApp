import XCTest
import Data
import Domain
import Infra

class UseCasesIntegrationTests: XCTestCase {
    func test_add_account() throws {
        let alamofireAdapter = AlamofireAdapter()
        let url = URL(string: "https://demo1986349.mockable.io/app/register")!
        let sut = RemoteAddAccount(url: url, httpClient: alamofireAdapter)
        let addAccountModel = AddAccountModel(name: "Lucas Pereira", email: "LucasPereira001@mail.com", password: "any_password", passwordConfirmation: "any_password")
        let exp = expectation(description: "waiting")
        sut.add(addAccountModel: addAccountModel) { result in
            switch result {
            case .failure: XCTFail("Expect success got \(result) instead")
            case .success(let account):
                XCTAssertNotNil(account.id)
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 5)
    }
}

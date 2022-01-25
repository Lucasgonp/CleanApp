import Domain
import Data
import XCTest

class RemoteAuthenticationTests: XCTestCase {
    func test_add_should_call_http_client_with_correct_url() throws {
        let url = makeUrl()
        let (sut, httpClientSpy) = makeSut(url: url)
        let addAccountModel = makeAddAccountModel()
        sut.auth()
        XCTAssertEqual(httpClientSpy.url, [url])
    }
}

extension RemoteAuthenticationTests {
    func makeSut(url: URL = URL(string: "hrrp://any-url.com")!, file: StaticString = #filePath, line: UInt = #line) -> (sut: RemoteAuthentication, httpClientSpy: HttpClientSpy) {
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteAuthentication(url: url, httpClient: httpClientSpy)
        checkMemoryLeak(for: sut, file: file, line: line)
        checkMemoryLeak(for: httpClientSpy, file: file, line: line)
        return (sut, httpClientSpy)
    }
}

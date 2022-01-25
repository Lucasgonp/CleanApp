import Domain
import Data
import XCTest

class RemoteAuthenticationTests: XCTestCase {
    func test_auth_should_call_http_client_with_correct_url() throws {
        let url = makeUrl()
        let (sut, httpClientSpy) = makeSut(url: url)
        sut.auth(authenticationModel: makeAuthenticationModel()) { _ in }
        XCTAssertEqual(httpClientSpy.url, [url])
    }
    
    func test_auth_should_call_http_client_with_correct_data() {
        let (sut, httpClientSpy) = makeSut()
        let authenticationModel = makeAuthenticationModel()
        sut.auth(authenticationModel: authenticationModel) { _ in }
        XCTAssertEqual(httpClientSpy.data, authenticationModel.toData())
    }
    
    func test_auth_should_complete_with_error_if_client_completes_with_error() {
        let (sut, httpClientSpy) = makeSut()
        expect(sut, completeWith: .failure(.unexpected)) {
            httpClientSpy.completeWithError(.noConnectivity)
        }
    }
    
    func test_auth_should_complete_with_session_expired_error_if_client_completes_with_unauthorized() {
        let (sut, httpClientSpy) = makeSut()
        expect(sut, completeWith: .failure(.expiredSession)) {
            httpClientSpy.completeWithError(.unauthorized)
        }
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
    
    func expect(_ sut: RemoteAuthentication, completeWith expectedResult: Authentication.Result, when action: () -> Void, file: StaticString = #filePath, line: UInt = #line) {
        let exp = expectation(description: "waiting")
        sut.auth(authenticationModel: makeAuthenticationModel()) { receivedResult in
            switch (expectedResult, receivedResult) {
            case (let .failure(expectedError), let .failure(receivedError)):
                XCTAssertEqual(expectedError, receivedError, file: file, line: line)
            case (let .success(expectedAccount), let .success(receivedAccount)):
                XCTAssertEqual(expectedAccount, receivedAccount, file: file, line: line)
            default: XCTFail("Expected \(expectedResult) recieve \(receivedResult) instead", file: file, line: line)
            }
            exp.fulfill()
        }
        
        action()
        wait(for: [exp], timeout: 1)
    }
}

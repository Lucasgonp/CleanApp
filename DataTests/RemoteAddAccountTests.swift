import XCTest

struct RemoteAddAccount {
    private let url: URL
    private let httpClient: HttpPostClient
    
    init(url: URL, httpClient: HttpPostClient) {
        self.url = url
        self.httpClient = httpClient
    }
    
    func add(httpClient: HttpPostClient) {
        httpClient.post(url: url)
    }
}

protocol HttpPostClient {
    func post(url: URL)
}

class RemoteAddAccountTests: XCTestCase {
    func test_() throws {
        let url = try XCTUnwrap(URL(string: "hrrp://any-url.com"))
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteAddAccount(url: url, httpClient: httpClientSpy)
        sut.add(httpClient: httpClientSpy)
        XCTAssertEqual(httpClientSpy.url, url)
    }
    
    class HttpClientSpy: HttpPostClient {
        var url: URL?
        
        func post(url: URL) {
            self.url = url
        }
    }
}

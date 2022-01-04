import Foundation

class UrlProtocolStub: URLProtocol {
    static var emit: ((URLRequest) -> Void)?
    static var response: HTTPURLResponse?
    static var data: Data?
    static var error: Error?
    
    static func simulate(response: HTTPURLResponse?, data: Data?, error: Error?) {
        UrlProtocolStub.response = response
        UrlProtocolStub.data = data
        UrlProtocolStub.error = error
    }
    
    static func observeRequest(completion: @escaping (URLRequest) -> Void) {
        UrlProtocolStub.emit = completion
    }
    
    override open class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override open class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override open func startLoading() {
        UrlProtocolStub.emit?(request)
        if let response = UrlProtocolStub.response {
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
        }
        if let data = UrlProtocolStub.data {
            client?.urlProtocol(self, didLoad: data)
        }
        if let error = UrlProtocolStub.error {
            client?.urlProtocol(self, didFailWithError: error)
        }
        client?.urlProtocolDidFinishLoading(self)
    }
    
    override open func stopLoading() {
        
    }
}

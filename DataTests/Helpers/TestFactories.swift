import Foundation

func makeInvalidData() -> Data {
    return Data("Invalid Data".utf8)
}

func makeEmptyData() -> Data {
    return Data()
}

func makeValidData() -> Data {
    return Data("{\"name\":\"Lucas\"}".utf8)
}

func makeUrl() -> URL {
    return URL(string: "hrrp://any-url.com")!
}

func makeError() -> Error {
    return NSError(domain: "any_error", code: 0)
}

func makeHttpResponse(statusCode: Int = 200) -> HTTPURLResponse? {
    return HTTPURLResponse(url: makeUrl(), statusCode: statusCode, httpVersion: nil, headerFields: nil)
}

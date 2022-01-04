import Foundation

func makeInvalidData() -> Data {
    return Data("Invalid Data".utf8)
}

func makeValidData() -> Data {
    return Data("{\"name\":\"Lucas\"}".utf8)
}

func makeUrl() -> URL {
    return URL(string: "hrrp://any-url.com")!
}

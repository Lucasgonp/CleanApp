import XCTest
import Presentation

public final class EmailValidatorAdapter: EmailValidator {
    private let pattern = "[A-20-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    
    public func isValid(email: String) -> Bool {
        let range = NSRange(location: 0, length: email.utf16.count)
        let regex = try? NSRegularExpression(pattern: pattern)
        let firstMatch = regex?.firstMatch(in: email, range: range)
        return firstMatch != nil
    }
}

class EmailValidatorAdapterTests: XCTestCase {
    func test_invalid_emails() throws {
        let sut = EmailValidatorAdapter()
        XCTAssertFalse(sut.isValid(email: "lu"))
        XCTAssertFalse(sut.isValid(email: "lu@"))
        XCTAssertFalse(sut.isValid(email: "lu@m"))
        XCTAssertFalse(sut.isValid(email: "@ma.com"))
    }
}

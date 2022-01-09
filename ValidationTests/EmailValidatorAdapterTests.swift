import XCTest
import Presentation

public final class EmailValidatorAdapter: EmailValidator {
    private let pattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    
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
    
    func test_valid_emails() throws {
        let sut = EmailValidatorAdapter()
        XCTAssertTrue(sut.isValid(email: "lucas@mail.com"))
        XCTAssertTrue(sut.isValid(email: "lucas@cmail.com"))
        XCTAssertTrue(sut.isValid(email: "lucas@hotmail.com.br"))
        XCTAssertTrue(sut.isValid(email: "lucas@yahoo.com"))
    }
}

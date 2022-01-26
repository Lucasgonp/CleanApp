import XCTest
import Infra

class EmailValidatorAdapterTests: XCTestCase {
    func test_invalid_emails() throws {
        let sut = makeSut()
        XCTAssertFalse(sut.isValid(email: "lu"))
        XCTAssertFalse(sut.isValid(email: "lu@"))
        XCTAssertFalse(sut.isValid(email: "lu@m"))
        XCTAssertFalse(sut.isValid(email: "@ma.com"))
    }

    func test_valid_emails() throws {
        let sut = makeSut()
        XCTAssertTrue(sut.isValid(email: "lucas@mail.com"))
        XCTAssertTrue(sut.isValid(email: "lucas@cmail.com"))
        XCTAssertTrue(sut.isValid(email: "lucas@hotmail.com.br"))
        XCTAssertTrue(sut.isValid(email: "lucas@yahoo.com"))
    }
}

extension EmailValidatorAdapterTests {
    func makeSut() -> EmailValidatorAdapter {
        let sut = EmailValidatorAdapter()
        return sut
    }
}

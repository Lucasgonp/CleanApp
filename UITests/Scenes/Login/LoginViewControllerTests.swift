import XCTest
import Presentation
import UIKit
@testable import UI

class LoginViewControllerTests: XCTestCase {
    func test_loading_is_hidden_on_start() throws {
        XCTAssertEqual(makeSut().activityIndicator?.isAnimating, false)
    }
    
    func test_sut_implements_loadingView() throws {
        XCTAssertNotNil(makeSut() as LoadingView)
    }

    func test_sut_implements_alertView() throws {
        XCTAssertNotNil(makeSut() as AlertView)
    }
    
    func test_primary_button_calls_login_on_tap() throws {
        var loginViewModel: LoginViewModel?
        let sut = makeSut(loginSpy: { loginViewModel = $0 })
        sut.primaryButton?.simulateTap()
        let email = sut.emailTextField?.text
        let password = sut.passwordTextField?.text
        XCTAssertEqual(loginViewModel, LoginViewModel(email: email, password: password))
    }
    
    func test_signUp_button_calls_signUpViewController_on_tap() throws {
        let signUpSpy = SignUpButtonSpy()
        let sut = makeSut(signUpSpy: signUpSpy)
        sut.signUpButton?.simulateTap()
        XCTAssertEqual(signUpSpy.tapCallsCount, 1)
    }
}

extension LoginViewControllerTests {
    func makeSut(loginSpy: ((LoginViewModel) -> Void)? = nil, signUpSpy: SignUpButtonSpy = SignUpButtonSpy(), file: StaticString = #file, line: UInt = #line) -> LoginViewController {
        let sut = LoginViewController.instantiate()
        sut.login = loginSpy
        sut.signUp = signUpSpy.onTap
        sut.loadViewIfNeeded()
        checkMemoryLeak(for: sut, file: file, line: line)
        return sut
    }
    
    class SignUpButtonSpy {
        var tapCallsCount = 0
        func onTap() {
            tapCallsCount += 1
        }
    }
}

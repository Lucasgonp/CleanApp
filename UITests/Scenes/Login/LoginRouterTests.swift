import XCTest
import UIKit
import UI

class LoginRouterTests: XCTestCase {
    func test_goToSignUp_calls_nav_with_correct_vc() throws {
        let (sut, nav) = makeSut()
        sut.goToSignUp()
        XCTAssertEqual(nav.viewControllers.count, 1)
        XCTAssertTrue(nav.viewControllers[0] is SignUpViewController)
    }
}

extension LoginRouterTests {
    func makeSut() -> (LoginRouter, NavigationController) {
        let signUpFactorySpy = SignUpFactorySpy()
        let nav = NavigationController()
        let sut = LoginRouter(nav: nav, signUpFactory: signUpFactorySpy.makeLogin)
        return (sut, nav)
    }
}

extension LoginRouterTests {
    class SignUpFactorySpy {
        func makeLogin() -> SignUpViewController {
            return SignUpViewController.instantiate()
        }
    }
}

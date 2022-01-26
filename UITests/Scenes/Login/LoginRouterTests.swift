import XCTest
import UIKit
import UI

class LoginRouter {
    private let nav: NavigationController
    private let signUpFactory: () -> SignUpViewController
    
    public init(nav: NavigationController, signUpFactory: @escaping () -> SignUpViewController) {
        self.nav = nav
        self.signUpFactory = signUpFactory
    }
    
    public func goToSignUp() {
        nav.pushViewController(signUpFactory())
    }
}

class LoginRouterTests: XCTestCase {
    func test_goToSignUp_calls_nav_with_correct_vc() throws {
        let signUpFactorySpy = SignUpFactorySpy()
        let nav = NavigationController()
        let sut = LoginRouter(nav: nav, signUpFactory: signUpFactorySpy.makeLogin)
        sut.goToSignUp()
        
        XCTAssertEqual(nav.viewControllers.count, 1)
        XCTAssertTrue(nav.viewControllers[0] is SignUpViewController)
    }
    
    class SignUpFactorySpy {
        var makeLoginCallsCount = 0
        
        func makeLogin() -> SignUpViewController {
            return SignUpViewController.instantiate()
        }
    }
}

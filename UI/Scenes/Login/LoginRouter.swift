import Foundation

public final class LoginRouter {
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

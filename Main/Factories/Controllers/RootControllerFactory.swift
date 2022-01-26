import Foundation
import UI

public func makeRootViewController(nav: NavigationController) -> LoginViewController {
    let router = LoginRouter(nav: nav, signUpFactory: makeSignUpController)
    let controller = LoginViewController.instantiate()
    controller.signUp = router.goToSignUp
    return controller
}

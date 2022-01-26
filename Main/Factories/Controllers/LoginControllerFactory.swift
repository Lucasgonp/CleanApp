import Domain
import Foundation
import Presentation
import UI
import Validation
import Infra

public func makeLoginController() -> SignUpViewController {
    return makeSignUpControllerWith(addAccount: makeRemoteAddAccount())
}

public func makeLoginControllerWith(authentication: Authentication)-> LoginViewController {
    let controller = LoginViewController.instantiate()
    let validationComposite = ValidationComposite(validations: makeSignUpValidations())
    let presenter = LoginPresenter(alertView: WeakVarProxy(controller), authentication: authentication, loadingView: WeakVarProxy(controller), validation: validationComposite)
    controller.login = presenter.login
    return controller
}

public func makeLoginValidations() -> [Validation] {
    ValidationBuilder.field("email").label("Email").required().email().build() +
    ValidationBuilder.field("password").label("Senha").required().build()
}

import Foundation
import UIKit
import Domain
import UI

public final class SignUpComposer {
    public static func composeControllerWith(addAccount: AddAccount) -> SignUpViewController {
        let viewController = ControllerFactory.makeSignUp(addAccount: addAccount)
        return viewController
    }
}

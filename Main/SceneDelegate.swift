import UIKit
import UI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    private let signUpFactory: () -> SignUpViewController = {
        let addAccount = makeRemoteAddAccount(httpClient: makeAlamofireAdapter())
        return makeSignUpController(addAccount: addAccount)
    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let nav = NavigationController()
        let loginRouter = LoginRouter(nav: nav, signUpFactory: signUpFactory)
        let loginViewController = LoginViewController.instantiate()
        loginViewController.signUp = loginRouter.goToSignUp
        nav.setRootViewController(loginViewController)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }
}


import UIKit
import UI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let nav = NavigationController()
        let rootViewController = makeRootViewController(nav: nav)
        nav.setRootViewController(rootViewController)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }
}


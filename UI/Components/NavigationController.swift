import Foundation
import UIKit

public final class NavigationController: UINavigationController {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    public convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func setup() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = Color.primaryDark
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
    }
}

public extension NavigationController {
    func setRootViewController(_ viewcontroller: UIViewController) {
        setViewControllers(viewControllers, animated: true)
    }
    
    func pushViewController(_ viewcontroller: UIViewController) {
        pushViewController(viewcontroller, animated: true)
    }
}

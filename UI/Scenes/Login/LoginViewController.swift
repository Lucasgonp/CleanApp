import Foundation
import Presentation
import UIKit

public final class LoginViewController: UIViewController, StoryBoarded {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var primaryButton: UIButton!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        title = "Testing"
        primaryButton.layer.cornerRadius = 5
        primaryButton.addTarget(self, action: #selector(primaryButtonTapped), for: .touchUpInside)
        hideKeyboardOnTap()
    }
}

extension LoginViewController {
    @objc
    func primaryButtonTapped() {
        
    }
}

extension LoginViewController: LoadingView {
    public func display(viewModel: LoadingViewModel) {
        if viewModel.isLoading {
            view.isUserInteractionEnabled = false
            activityIndicator.startAnimating()
        } else {
            view.isUserInteractionEnabled = true
            activityIndicator.stopAnimating()
        }
    }
}

extension LoginViewController: AlertView {
    public func showMessage(viewModel: AlertViewModel) {
        let alertView = UIAlertController(title: viewModel.title, message: viewModel.message, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alertView, animated: true)
    }
}

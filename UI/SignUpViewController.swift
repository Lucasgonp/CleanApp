import Foundation
import Presentation
import UIKit

final class SignUpViewController: UIViewController {
    @IBOutlet weak var actitityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var saveButton: UIButton!
    
    var signUp: ((SignUpViewModel) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func saveButtonTapped() {
        let model = SignUpViewModel(name: nil, email: nil, password: nil, passwordConfirmation: nil)
        signUp?(model)
    }
}

extension SignUpViewController: LoadingView {
    func display(viewModel: LoadingViewModel) {
        viewModel.isLoading ? actitityIndicator.startAnimating() : actitityIndicator.stopAnimating()
    }
}

extension SignUpViewController: AlertView {
    func showMessage(viewModel: AlertViewModel) {
        
    }
}

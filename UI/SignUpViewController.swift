import Foundation
import Presentation
import UIKit

final class SignUpViewController: UIViewController {
    @IBOutlet weak var actitityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension SignUpViewController: LoadingView {
    func display(viewModel: LoadingViewModel) {
        viewModel.isLoading ? actitityIndicator.startAnimating() : actitityIndicator.stopAnimating()
    }
}

import Foundation
import Domain

public final class SignUpPresenter {
    private let alertView: AlertView
    private let addAccount: AddAccount
    private let loadingView: LoadingView
    private let validation: Validation
    
    public init(
        alertView: AlertView,
        addAccount: AddAccount,
        loadingView: LoadingView,
        validation: Validation
    ) {
        self.alertView = alertView
        self.addAccount = addAccount
        self.loadingView = loadingView
        self.validation = validation
    }
    
    public func signUp(viewModel: SignUpViewModel) {
        if let message = validation.validate(data: viewModel.toJson()) {
        alertView.showMessage(viewModel: AlertViewModel(title: "Falha na validação", message: message))
        } else {
            loadingView.display(viewModel: LoadingViewModel(isLoading: true))
            addAccount.add(addAccountModel: viewModel.toAddAccountModel()) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .failure:
                    let alertViewModel = AlertViewModel(title: "Erro", message: "Algo inesperado aconteceu, tente novamente em alguns instantes.")
                    self.alertView.showMessage(viewModel: alertViewModel)
                case .success:
                    let alertViewModel = AlertViewModel(title: "Sucesso", message: "Conta criada com sucesso.")
                    self.alertView.showMessage(viewModel: alertViewModel)
                    break
                }
                self.loadingView.display(viewModel: LoadingViewModel(isLoading: false))
            }
        }
    }
}

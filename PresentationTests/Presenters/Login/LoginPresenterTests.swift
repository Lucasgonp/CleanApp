import XCTest
import Presentation
import Domain

class LoginPresenterTests: XCTestCase {
    func test_login_should_call_validation_with_correct_values() {
        let validationSpy = ValidationSpy()
        let sut = makeSut(validation: validationSpy)
        let viewModel = makeLoginViewModel()
        sut.login(viewModel: viewModel)
        XCTAssertTrue(NSDictionary(dictionary: validationSpy.data!).isEqual(to: viewModel.toJson()!))
    }
    
    func test_login_should_show_error_message_if_validation_fails() {
        let alertViewSpy = AlertViewSpy()
        let validationSpy = ValidationSpy()
        let sut = makeSut(alertView: alertViewSpy, validation: validationSpy)
        let exp = expectation(description: "waiting")
        alertViewSpy.observe { viewModel in
            XCTAssertEqual(viewModel, AlertViewModel(title: "Falha na validação", message: "Erro"))
            exp.fulfill()
        }
        validationSpy.simulateError()
        sut.login(viewModel: makeLoginViewModel())
        wait(for: [exp], timeout: 1)
    }
    
    func test_signUp_should_call_authentication_with_correct_values() throws {
        let authenticationSpy = AuthenticationSpy()
        let sut = makeSut(authentication: authenticationSpy)
        sut.login(viewModel: makeLoginViewModel())
        XCTAssertEqual(authenticationSpy.authenticationModel, makeAuthenticationModel())
    }
    
    func test_signUp_should_show_generic_error_message_if_authentication_fails() throws {
        let authenticationSpy = AuthenticationSpy()
        let alertViewSpy = AlertViewSpy()
        let exp = expectation(description: "waiting")
        let sut = makeSut(alertView: alertViewSpy, authentication: authenticationSpy)
        alertViewSpy.observe { viewModel in
            XCTAssertEqual(viewModel, AlertViewModel(title: "Erro", message: "Algo inesperado aconteceu, tente novamente em alguns instantes"))
            exp.fulfill()
        }
        
        sut.login(viewModel: makeLoginViewModel())
        authenticationSpy.completeWithError(.unexpected)
        wait(for: [exp], timeout: 1)
    }
    
    
    func test_signUp_should_show_success_message_if_authentication_succeeds() throws {
        let authenticationSpy = AuthenticationSpy()
        let alertViewSpy = AlertViewSpy()
        let exp = expectation(description: "waiting")
        let sut = makeSut(alertView: alertViewSpy, authentication: authenticationSpy)
        alertViewSpy.observe { viewModel in
            XCTAssertEqual(viewModel, AlertViewModel(title: "Sucesso", message: "Conta criada com sucesso."))
            exp.fulfill()
        }
        
        sut.login(viewModel: makeLoginViewModel())
        authenticationSpy.completeWithAccount(makeAccountModel())
        wait(for: [exp], timeout: 1)
    }
}

extension LoginPresenterTests {
    func makeSut(alertView: AlertViewSpy = AlertViewSpy(), authentication: AuthenticationSpy = AuthenticationSpy(), loadingView: LoadingViewSpy = LoadingViewSpy(), validation: ValidationSpy = ValidationSpy(), file: StaticString = #file, line: UInt = #line) -> LoginPresenter {
        let sut = LoginPresenter(alertView: alertView, authentication: authentication, loadingView: loadingView, validation: validation)
        checkMemoryLeak(for: sut, file: file, line: line)
        return sut
    }
}

import Foundation
import Presentation

class EmailValidatorSpy: EmailValidator {
    var isValid: Bool = true
    var email: String?
    
    func isValid(email: String) -> Bool {
        self.email = email
        return isValid
    }
    
    func simulateInvalidEmail() {
        self.isValid = false
    }
}

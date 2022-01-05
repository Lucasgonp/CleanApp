import Foundation
import Domain

func makeAccountModel() -> AccountModel {
    return AccountModel(name: "any_name", email: "any_email@mail.com", password: "any_password", id: "any_id")
}

func makeAddAccountModel() -> AddAccountModel {
    return AddAccountModel(name: "any_name", email: "any_email@mail.com", password: "any_password", passwordConfirmation: "any_password")
}

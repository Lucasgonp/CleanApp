//
//  SignUpMapper.swift
//  Presentation
//
//  Created by Lucas Pereira on 05/01/22.
//

import Foundation
import Domain

public final class SignUpMapper {
    static func mapToAddAccountModel(viewModel: SignUpViewModel) -> AddAccountModel {
        return AddAccountModel(name: viewModel.name ?? "", email: viewModel.email ?? "", password: viewModel.password ?? "", passwordConfirmation: viewModel.passwordConfirmation ?? "")
    }
}

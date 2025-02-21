//
//  LoginPageViewModel.swift
//  STFM
//
//  Created by Valmir Garcia on 02/12/24.
//

import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isAuthenticated: Bool = false
    @Published var errorMessage: String?

    private var cancellables = Set<AnyCancellable>()

    init() {
        validateFields()
    }

    func login() {
        // Simulação de autenticação (substituir com requisição real à API)
        if username == "admin" && password == "123456" {
            isAuthenticated = true
        } else {
            errorMessage = "Usuário ou senha incorretos"
            isAuthenticated = false
        }
    }

    private func validateFields() {
        Publishers.CombineLatest($username, $password)
            .map { !$0.isEmpty && !$1.isEmpty }
            .sink { [weak self] isValid in
                self?.errorMessage = isValid ? nil : "Preencha todos os campos"
            }
            .store(in: &cancellables)
    }
}

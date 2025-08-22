//
//  LoginPageViewModel.swift
//  STFM
//
//  Created by Valmir Garcia on 02/12/24.
//

import SwiftUI
import Alamofire

final class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var navigateHome: Bool = false
    @Published var showLoginError: Bool = false
    @AppStorage("authToken") var authToken: String?
    
    private let authService: AuthenticationService
    private let clientManager: ClientManager
    
    init(authService: AuthenticationService = APIAuthenticationService(),
    clientManager: ClientManager = ClientManager()) {
        self.authService = authService
        self.clientManager = clientManager
    }
    
    func login(as userType: UserType) {
        authService.login(username: username, password: password, endpoint: userType.endpoint) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let loginResponse):
                    print("Cliente logado com sucesso: \(loginResponse.client.name)")
                    print("Token: \(loginResponse.token)")
                    
                    self?.clientManager.updateClient(loginResponse.client)
                    self?.authToken = loginResponse.token
                    self?.navigateHome = true
                case .failure(let error):
                    print("Erro ao logar: \(error)")
                    self?.showLoginError = true                }
            }
        }
    }
    
    func logout() {
        authService.logout()
        authToken = nil
        navigateHome = false
        username = ""
        password = ""
    }
}

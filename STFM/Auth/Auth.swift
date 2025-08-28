//
//  Auth.swift
//  STFM
//
//  Created by Mariana Maiko on 21/05/25.
//
import Alamofire
import Foundation
import SwiftUI

protocol AuthenticationService {
    func login(username: String, password: String, endpoint: String, completion: @escaping (Result<LoginResponse, Error>) -> Void)
    func logout()
}

final class APIAuthenticationService: AuthenticationService {
    func login(username: String, password: String, endpoint: String, completion: @escaping (Result<LoginResponse, Error>) -> Void) {
        let params = ["email": username, "password": password]

        AF.request(endpoint,
                   method: .post,
                   parameters: params)
            .validate()
            .responseDecodable(of: LoginResponse.self) { response in
                let result = response.result.mapError { $0 as Error }
                completion(result)
            }
    }

    func logout() {
        UserDefaults.standard.removeObject(forKey: "authToken")
    }
}


enum UserType: String, CaseIterable, Identifiable {
    case client = "Cliente"
    case doctor = "Médico"
    
    var id: String { self.rawValue }
    
    var endpoint: String {
        switch self {
        case .client: return "https://stfm.technest.net.br/api/client/login"
        case .doctor: return "https://stfm.technest.net.br/api/auth/login"
        }
    }
}

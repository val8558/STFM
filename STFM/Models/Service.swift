//
//  Service.swift
//  STFM
//
//  Created by Mariana Maiko on 11/02/25.
//

//import Foundation
//
//struct LoginResponse: Codable {
//    let status: Bool
//    let token: String?
//    let user: User?
//}
//
//struct User: Codable {
//    let id: Int
//    let name: String
//    let email: String
//}
//
//func login(email: String, password: String) {
//    guard let url = URL(string: "http://127.0.0.1:8000/auth/login") else { return }
//    
//    var request = URLRequest(url: url)
//    request.httpMethod = "POST"
//    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//    
//    let body: [String: Any] = [
//        "email": email,
//        "password": password
//    ]
//    
//    request.httpBody = try? JSONSerialization.data(withJSONObject: body)
//
//    URLSession.shared.dataTask(with: request) { data, response, error in
//        guard let data = data, error == nil else {
//            print("Erro na requisição: \(error?.localizedDescription ?? "Erro desconhecido")")
//            return
//        }
//
//        do {
//            let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
//            
//            if let token = loginResponse.token {
//                UserDefaults.standard.set(token, forKey: "userToken")
//                print("Login bem-sucedido! Token: \(token)")
//            } else {
//                print("Erro no login: Token não recebido")
//            }
//        } catch {
//            print("Erro ao decodificar JSON: \(error.localizedDescription)")
//        }
//    }.resume()
//}

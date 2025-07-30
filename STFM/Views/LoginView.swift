//
//  LoginPage.swift
//  STFM
//
//  Created by Valmir Garcia on 02/12/24.
//

import SwiftUI
import Alamofire

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isValid: Bool = false
    @EnvironmentObject var clientManager: ClientManager
    @State private var navigateHome: Bool = false
    
    var body: some View {
        NavigationStack{
            ZStack {
                Image("Login")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                ZStack {
                    ScrollView {
                        VStack(spacing: 20) {
                            Spacer(minLength: 480)
                            
                            VStack (alignment: .leading) {
                                Text("Usuário")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding(.bottom, 5)
                                
                                TextField("Digite seu usuário", text: $username)
                                    .padding()
                                    .frame(width: 250, height: 30)
                                    .foregroundStyle(Color.white)
                                    .background(Color.clear)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10, style: .circular)
                                            .stroke(Color.white, lineWidth: 1)
                                    )
                            }
                            
                            VStack (alignment: .leading){
                                Text("Senha")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding(.bottom, 5)
                                
                                SecureField("Digite sua senha", text: $password)
                                    .padding()
                                    .frame(width: 250, height: 30)
                                    .foregroundStyle(Color.white)
                                    .background(Color.clear)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10, style: .circular)
                                            .stroke(Color.white, lineWidth: 1)
                                    )
                            }
                            
                            VStack (alignment: .center) {
            
                                Button("Entrar") {
                                    login()
                                }
                                .font(.headline)
                                .foregroundColor(.black)
                                .frame(width: 250, height: 40)
                                .background(Color.yellow)
                                .cornerRadius(10)
                                .padding(.top, 10)
                                
                                .navigationDestination(isPresented: $navigateHome) {
                                    HomeView()
                                }
                                
                                HStack {
                                    Spacer()
                                    NavigationLink(destination: ForgotPasswordView()) {
                                        Text("Esqueceu sua senha?")
                                            .font(.system(size: 16, weight: .bold))
                                            .foregroundColor(.white)
                                            .padding()
                                    }
                                }
                                .padding(.top, 12)
                                .padding(.horizontal)
                                .padding(.bottom, 100)
                            }
                        }
                    }
                }
            }
        }.edgesIgnoringSafeArea(.all) .background(Color.black)
    }
    
    func login() {
        let params = ["email": username, "password": password]
        
        //        AF.request("http://127.0.0.1:8000/api/auth/login", method: .post, parameters: params)
        AF.request("https://stfm.technest.net.br/api/client/login", method: .post, parameters: params)
            .validate()
            .responseDecodable(of: LoginResponse.self) { response in
                switch response.result {
                case .success(let loginResponse):
                    print("Cliente logado com sucesso: \(loginResponse.client.name)")
                    print("Token: \(loginResponse.token)")
                    print(loginResponse)
                    
                    clientManager.updateClient(loginResponse.client)
                    navigateHome = true
                    UserDefaults.standard.set(loginResponse.token, forKey: "authToken")
                    // Aqui você pode guardar o token ou salvar o client no app
                case .failure(let error):
                    print("Erro ao logar: \(error)")
                    
                }
            }
    }
}



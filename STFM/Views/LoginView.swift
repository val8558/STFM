//
//  LoginPage.swift
//  STFM
//
//  Created by Valmir Garcia on 02/12/24.
//

import SwiftUI
import Alamofire

struct LoginView: View {
    @StateObject private var viewmodel = LoginViewModel()
    @EnvironmentObject var clientManager: ClientManager
    @State private var selectedUser: UserType = .client
    
    var body: some View {
        NavigationStack{
            if let _ = viewmodel.authToken, clientManager.client != nil {
                HomeView()
            } else {
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
                                Picker("Tipo de usuário", selection: $selectedUser) {
                                    ForEach(UserType.allCases) { type in
                                        Text(type.rawValue).tag(type)
                                    }
                                }
                                .pickerStyle(.segmented)
                                .padding(.horizontal, 40)
                                
                                VStack (alignment: .leading) {
                                    Text("Usuário")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding(.bottom, 5)
                                    
                                    TextField("Digite seu usuário", text: $viewmodel.username)
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
                                    
                                    SecureField("Digite sua senha", text: $viewmodel.password)
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
                                        viewmodel.login(as: selectedUser)
                                    }
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .frame(width: 250, height: 40)
                                    .background(Color.yellow)
                                    .cornerRadius(10)
                                    .padding(.top, 10)
                                    
                                    .navigationDestination(isPresented: $viewmodel.navigateHome) {
                                        HomeView()
                                    }
                                    
//                                    HStack {
                                        Spacer()
                                        NavigationLink(destination: ForgotPasswordView()) {
                                            Text("Esqueceu sua senha?")
                                                .font(.system(size: 16, weight: .bold))
                                                .foregroundColor(.white)
                                                .padding()
                                        }
//                                    }
                                    .padding(.top, 12)
                                    .padding(.horizontal)
                                    .padding(.bottom, 100)
                                    

                                }
                            }
                        }
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.all) .background(Color.black)
        .alert("Erro de Login", isPresented: $viewmodel.showLoginError) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Usuário ou senha incorretos. Tente novamente.")
        }
    }
}

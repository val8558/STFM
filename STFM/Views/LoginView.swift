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
//    @EnvironmentObject var clientManager: ClientManager
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
                    VStack {
                        Spacer()
                        VStack (alignment: .leading){
                            Text("Usuário")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.bottom, 5)
                            
                            
                            TextField("Digite seu usuário", text: $username)
                                .frame(width: 250, height: 30)
                                .foregroundStyle(Color.white)
                                .background(Color.clear)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10, style: .circular)
                                        .stroke(Color.white, lineWidth: 1)
                                ).padding(.bottom, 20)
                        }
                        
                        VStack (alignment: .leading){
                            Text("Senha")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.bottom, 5)
                            
                            SecureField("Digite sua senha", text: $password)
                                .frame(width: 250, height: 30)
                                .foregroundStyle(Color.white)
                                .background(Color.clear)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10, style: .circular)
                                        .stroke(Color.white, lineWidth: 1)
                                )
                                .padding(.bottom,20)
                        }
                        
                        VStack (alignment: .center) {
                            Button("Entrar") {
                                login()
//                                let authenticatedClient = Client(
//                                    name: "Usuário Teste",
//                                    age: 30,
//                                    gender: .male,
//                                    currentWeight: 75.0,
//                                    weightGoal: 70.0,
//                                    reference: .normal
//                                )
//                                navigateHome = true
//                                clientManager.updateClient(authenticatedClient)
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
//                            NavigationLink(
//                                destination: HomeView()
//                                    .environmentObject(clientManager),
//                                isActive: Binding(
//                                    get: { clientManager.client != nil },
//                                    set: { _ in }
//                                )
//                            ) {
//                                EmptyView()
//                            }

                            HStack{
                                Spacer()
                                NavigationLink(destination: MyMeals()) {
                                    Text("Esqueceu sua senha?")
                                        .font(.system(size: 10, weight: .bold))
                                        .foregroundColor(.white)
                                        .padding(.top, 12)
                                }
//                                
//                                Spacer()
//                                NavigationLink(destination: RegisterView()) {
//                                    Text("Cadastrar")
//                                        .font(.system(size: 10, weight: .bold))
//                                        .foregroundColor(.white)
//                                        .padding(.top, 12)
//                                }
//                                Spacer()
                            }
                        }
                    }
                    
                }
                .padding(.bottom, 80)
            }
        }.edgesIgnoringSafeArea(.all) .background(Color.black)
    }
    
    func login() {
        let params = ["email": username, "password": password]
        AF.request("http://127.0.0.1:8000/api/auth/login", method: .post, parameters: params).responseString { response in
            print(response)
        }
    }
}

//#Preview {
//    LoginView()
//}


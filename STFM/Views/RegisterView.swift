//
//  RegisterView.swift
//  STFM
//
//  Created by Mariana Maiko on 17/02/25.
//

import SwiftUI
import Alamofire

struct RegisterView: View {
    @State private var name: String = ""
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var confirmEmail: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var navigateHome: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Nome")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding(.bottom, 5)
                
                TextField("", text: $name)
                    .padding()
                    .frame(width: 250, height: 30)
                    .foregroundStyle(Color.black)
                    .background(Color.clear)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8, style: .circular)
                            .stroke(Color.gray, lineWidth: 1)
                    ).padding(.bottom, 30)
                Text("Usuário")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding(.bottom, 5)
                
                TextField("", text: $username)
                    .padding()
                    .frame(width: 250, height: 30)
                    .foregroundStyle(Color.black)
                    .background(Color.clear)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10, style: .circular)
                            .stroke(Color.gray, lineWidth: 1)
                    ).padding(.bottom, 30)
                Text("Email")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding(.bottom, 5)
                
                TextField("", text: $email)
                    .padding()
                    .frame(width: 250, height: 30)
                    .foregroundStyle(Color.black)
                    .background(Color.clear)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10, style: .circular)
                            .stroke(Color.gray, lineWidth: 1)
                    ).padding(.bottom, 30)
                Text("Repita seu Email")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding(.bottom, 5)
                
                TextField("", text: $confirmEmail)
                    .padding()
                    .frame(width: 250, height: 30)
                    .foregroundStyle(Color.black)
                    .background(Color.clear)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10, style: .circular)
                            .stroke(Color.gray, lineWidth: 1)
                    ).padding(.bottom, 30)
                Text("Senha")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding(.bottom, 5)
                
                SecureField("", text: $password)
                    .padding()
                    .frame(width: 250, height: 30)
                    .foregroundStyle(Color.black)
                    .background(Color.clear)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10, style: .circular)
                            .stroke(Color.gray, lineWidth: 1)
                    ).padding(.bottom, 30)
                Text("Repita a senha")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding(.bottom, 5)
                
                SecureField("", text: $confirmPassword)
                    .padding()
                    .frame(width: 250, height: 30)
                    .foregroundStyle(Color.black)
                    .background(Color.clear)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10, style: .circular)
                            .stroke(Color.gray, lineWidth: 1)
                    ).padding(.bottom, 30)
                
                Button(action: {
                    print("Login")
                    createUser()
                }
                )
                {
                    Text("Cadastrar")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 250, height: 60)
                        .background(Color.black)
                        .cornerRadius(10)
                }
                .padding(.bottom,10)
                .navigationDestination(isPresented: $navigateHome) {
                    HomeView()
                }
            }
            ZStack {
                Image("image-bottom")
            }
            .ignoresSafeArea()
            .padding(.bottom, -200)
        }
    }
    
    func checkPasswordMatch() -> Bool {
        return password == confirmPassword
    }
    
    func createUser() {
        let params = ["name": name, "email": username, "password": password]
        AF.request("http://127.0.0.1:8000/api/auth/register", method: .post, parameters: params, encoding: JSONEncoding.default).responseString { response in
            switch response.result {
            case .success(let value):
                if(value == "success") {
                    print(value)
                    navigateHome = true
                } else {
                    print(response)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

#Preview {
    RegisterView()
}

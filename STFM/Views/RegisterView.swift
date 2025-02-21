//
//  RegisterView.swift
//  STFM
//
//  Created by Mariana Maiko on 17/02/25.
//

import SwiftUI

struct RegisterView: View {
    @State private var name: String = ""
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var confirmEmail: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Nome")
                .font(.headline)
                .foregroundColor(.black)
                .padding(.bottom, 5)
              
            TextField("", text: $name)
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
              
            TextField("", text: $email)
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
              
            TextField("", text: $email)
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
              
            TextField("", text: $email)
                .frame(width: 250, height: 30)
                .foregroundStyle(Color.black)
                .background(Color.clear)
                .overlay(
                    RoundedRectangle(cornerRadius: 10, style: .circular)
                        .stroke(Color.gray, lineWidth: 1)
                ).padding(.bottom, 30)
            
            Button(action: {
                print("Login")
            })
                {
                Text("Cadastrar")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 250, height: 60)
                    .background(Color.black)
                    .cornerRadius(10)
                }.padding(.bottom,10)
            
        }
        ZStack {
            Image("image-bottom")
        }
        .ignoresSafeArea()
        .padding(.bottom, -200)
    }
}

#Preview {
    RegisterView()
}

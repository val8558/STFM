//
//  ForgotPasswordView.swift
//  STFM
//
//  Created by Valmir Garcia on 02/12/24.
//

import SwiftUI

struct ForgotPasswordView: View {
    var body: some View {
        ZStack {
            Image("Register")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack {
                Spacer()
                VStack (){
                    Text("Esqueceu sua senha?")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.bottom, 5)
                    Text("Insira seu email para recuperarmos sua conta")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.bottom, 24)
                      
                    TextField("Digite seu usuário", text: .constant(""))
                        .padding()
                        .frame(width: 280, height: 30)
                        .foregroundStyle(Color.white)
                        .background(Color.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10, style: .circular)
                                .stroke(Color.white, lineWidth: 1)
                        ).padding(.bottom, 24)
                    
                    Button(action: {
                        print("Login")
                    })
                        {
                        Text("Recuperar")
                            .font(.headline)
                            .foregroundColor(.black)
                            .frame(width: 250, height: 40)
                            .background(Color.yellow)
                            .cornerRadius(10)
                        }.padding(.bottom,10)
                    
                }.padding(.bottom, 120)
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    ForgotPasswordView()
}

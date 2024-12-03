//
//  LoginPage.swift
//  STFM
//
//  Created by Valmir Garcia on 02/12/24.
//

import SwiftUI

struct LoginPage: View {
    var body: some View {
        ZStack {
                Image("Login")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            ZStack {
                VStack {
                    Spacer()
                    VStack (alignment: .leading){
                        Text("Usuário")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.bottom, 5)
                            
                        
                        TextField("Digite seu usuário", text: .constant(""))
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
                        
                        SecureField("Digite sua senha", text: .constant(""))
                            .frame(width: 250, height: 30)
                            .foregroundStyle(Color.white)
                            .background(Color.clear)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10, style: .circular)
                                    .stroke(Color.white, lineWidth: 1)
                            )
                            .padding(.bottom,20)
                    }
                        
                    VStack (alignment: .center){
                        Button(action: {
                            print("Login")
                        })
                            {
                            Text("Entrar")
                                .font(.headline)
                                .foregroundColor(.black)
                                .frame(width: 250, height: 40)
                                .background(Color.yellow)
                                .cornerRadius(10)
                                
                            }.padding(.bottom,10)
                        HStack{
                            Spacer()
                            Button(action: {
                                print("Login")
                            })
                                {
                                Text("Esqueceu sua senha?")
                                    .font(.system(size: 10, weight: .bold))
                                    .foregroundColor(.white)
                                }.padding(.bottom,10)
                            Spacer()
                            Button(action: {
                                print("Login")
                            })
                                {
                                Text("Cadastrar")
                                    .font(.system(size: 10, weight: .bold))
                                    .foregroundColor(.white)
                                }.padding(.bottom,10)
                            Spacer()
                        }
                    }
          
                }.padding(.bottom, 60)
            }
        }.edgesIgnoringSafeArea(.all) .background(Color.black)
        
    }
}

#Preview {
    LoginPage()
}


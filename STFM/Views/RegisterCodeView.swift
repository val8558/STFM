//
//  RegisterCodePage.swift
//  STFM
//
//  Created by Valmir Garcia on 02/12/24.
//

import SwiftUI

struct RegisterCodeView: View {
    var body: some View {
        ZStack {
            Image("Register")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
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
                        ).padding(.bottom, 30)
                    
                    Button(action: {
                        print("Login")
                    })
                        {
                        Text("Cadastrar")
                            .font(.headline)
                            .foregroundColor(.black)
                            .frame(width: 250, height: 40)
                            .background(Color.yellow)
                            .cornerRadius(10)
                        }.padding(.bottom,10)
                    
                }.padding(.bottom, 170)
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    RegisterCodeView()
}

//
//  ProgressSectionView.swift
//  STFM
//
//  Created by Valmir Garcia on 03/12/24.
//

import SwiftUI

struct ProgressSectionView: View {
    @State private var progress: Double = 0.5 // Progresso inicial (50%)
    @EnvironmentObject var clientManager: ClientManager
    
    
    var body: some View {
        if let client = clientManager.client {
            VStack(spacing: 10) {
                Text("Quadro geral do programa")
                    .font(.system(size: 16, weight: .semibold))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.top, 20)
                    .padding(.bottom, 30)
                
                
                ProgressView(value: progress, total: 1.0)
                    .frame(height: 10.0)
                    .progressViewStyle(LinearProgressViewStyle(tint: .yellow))
                    .scaleEffect(x: 1, y: 2, anchor: .center)
                    .padding(.horizontal, 20)
                
                Text(String(format: "%.0f%% Completo", progress * 100))
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding(.top, 5)
                
                VStack (alignment: .leading){
                    HStack (spacing: 100) {
                        VStack {
                            Text("Peso Atual")
                                .font(.system(size: 16, weight: .semibold))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.top, 20)
                                .padding(.bottom, 5)
                            
                            Text("\(client.currentWeight) kg")
                                .font(.system(size: 16, weight: .semibold))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.bottom, 20)
                            
                            Text("Minha meta")
                                .font(.system(size: 16, weight: .semibold))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.bottom, 5)
                            
                            Text("\(client.weightGoal) kg")
                                .font(.system(size: 16, weight: .semibold))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.bottom, 30)
                        }
                        VStack {
                            Text("Próxima consulta")
                                .font(.system(size: 16, weight: .semibold))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.top, 20)
                                .padding(.bottom, 5)
                            
                            Text("13/09/2024 as 15:00")
                                .font(.system(size: 16, weight: .semibold))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.bottom, 20)
                        }
                        
                    }
                    
                    
                    
                }
                
            }.frame(width: 380, height: 280)
                .background(Color.white)
                .cornerRadius(20)
                .padding()
        }
    }
}


#Preview {
    ProgressSectionView()
}

//
//  ProgressSectionView.swift
//  STFM
//
//  Created by Valmir Garcia on 03/12/24.
//

import SwiftUI

struct ProgressSectionView: View {
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
                
                ProgressView(value: calculateProgress(current: client.initialWeight, goal: client.weightGoal), total: 1.0)
                    .frame(height: 10.0)
                    .progressViewStyle(LinearProgressViewStyle(tint: .yellow))
                    .scaleEffect(x: 1, y: 2, anchor: .center)
                    .padding(.horizontal, 20)
                
                Text(String(format: "%.0f%% Completo", calculateProgress(current: client.currentWeight, goal: client.weightGoal) * 100))
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
                            
                            Text("\(client.currentWeight ?? 0.0, specifier: "%.1f") kg")
                                .font(.system(size: 16, weight: .semibold))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.bottom, 20)
                            
                            Text("Minha meta")
                                .font(.system(size: 16, weight: .semibold))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.bottom, 5)
                            
                            Text("\(client.weightGoal ?? 0.0, specifier: "%.1f") kg")
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

extension ProgressSectionView {
    private func calculateProgress(current: Double?, goal: Double?) -> Double {
        guard let current = current, let goal = goal, goal != 0 else {
            return 0.0
        }
        let totalChange = abs(current > goal ? current - goal : 0.0)
        return 1.0 - (totalChange / 100)
    }
}


#Preview {
    ProgressSectionView()
}

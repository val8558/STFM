//
//  WeightProgressView.swift
//  STFM
//
//  Created by Valmir Garcia on 09/12/24.
//

import SwiftUI
import Charts

struct WeightProgressView: View {
    @EnvironmentObject var clientManager: ClientManager
    
    let weightData = [
        (week: "1", weight: 93),
        (week: "2", weight: 92),
        (week: "3", weight: 91),
        (week: "4", weight: 90),
        (week: "5", weight: 89)
    ]
    
    var body: some View {
        if let client = clientManager.client {
            VStack(spacing: 10) {
                HStack (spacing: 20) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Peso atual")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.black)
                        if let ultimoPeso = client.avaliations?.last?.weight {
                            Text("\(String(format: "%.1f", ultimoPeso)) kg")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.black)
                        }
//                        Text("\(String(format: "%.1f", client)) kg")
//                            .font(.system(size: 24, weight: .bold))
//                            .foregroundColor(.black)
                        Spacer()
                            .frame(height: 10)
                        Text("Minha meta")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.black)
//                        if let ultimoPeso = client.avaliations.last?.weight {
//                            Text("\(String(format: "%.1f", ultimoPeso)) kg")
//                                .font(.system(size: 24, weight: .bold))
//                                .foregroundColor(.black)
//                        }
                        Text("\(client.objectives)")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(Color.black)
                    }
                    Spacer()
                    VStack (alignment: .center, spacing: 4){
                        Chart {
                            ForEach(weightData, id: \.week) { data in
                                BarMark(
                                    x: .value("Semana", data.week),
                                    y: .value("Peso", data.weight)
                                )
                                .foregroundStyle(Color.yellow)
                            }
                        }
                        .chartXAxis(.visible)
                        .chartYAxis(.visible)
                        .chartPlotStyle { plotArea in
                            plotArea.background(Color.clear)
                        }
                        .frame(height: 150)
                        .padding(.horizontal)
                        
                        Text("Semana x Peso")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                            .padding(.top, 10)
                    }
                    
                }
                .padding(.horizontal)
                
            }
            .padding()
            .background(Color(UIColor.white))
            .cornerRadius(20)
            .shadow(radius: 3)
        }
    }
}

#Preview {
    WeightProgressView()
}


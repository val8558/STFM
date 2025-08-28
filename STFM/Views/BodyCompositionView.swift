//
//  BodyCompositionView.swift
//  STFM
//
//  Created by Mariana Maiko on 18/02/25.
//

import SwiftUI

struct BodyCompositionView: View {
    @StateObject private var viewModel = BodyCompositionViewModel()
    @EnvironmentObject var clientManager: ClientManager
    
    var body: some View {
        if let client = clientManager.client {
            VStack {
                HStack(alignment: .center) {
                    Spacer()
                    Text("Composição Corporal")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding(.top, 60)
                .padding()
                .background(Color.white)
                .clipShape(RoundedCornersShape(corners: [.bottomLeft, .bottomRight], radius: 20))
                
                weightInfoView(client: client)
                
                List(viewModel.items) { item in
                    BodyCompositionRow(item: item)
                }
                .listStyle(PlainListStyle())
            }
            .ignoresSafeArea()
            .background(Color.backgroundGray)
            .onAppear {
                viewModel.fetchBodyCompositionData(from: client)
            }
        }
    }
    private func weightInfoView(client: Client) -> some View {
        HStack {
            weightInfoBox(title: "Peso Inicial", value: String(format: "%.1f", client.initialWeight ?? 0.0))
            weightInfoBox(title: "Peso Atual", value: String(format: "%.1f", client.currentWeight ?? 0.0))
            weightInfoBox(title: "Minha Meta", value: String(format: "%.1f", client.weightGoal ?? 0.0))
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
    }
    
    private func weightInfoBox(title: String, value: String) -> some View {
        VStack {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.black)
            Text(value)
                .font(.headline)
                .bold()
        }
        .frame(maxWidth: .infinity)
    }
}

struct BodyCompositionRow: View {
    let item: BodyComposition
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(item.title)
                    .font(.headline)
                Text("Referência \n \(item.reference)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            
            VStack(alignment: .center, spacing: 4) {
                Text(item.value)
                    .bold()
            }
            
            Text(item.status)
                .frame(width: 130, height: 80) 
                .background(item.color.color)
                .foregroundColor(.black)
                .cornerRadius(8)
        }
        .background(Color.white)
        .cornerRadius(12)
    }
}

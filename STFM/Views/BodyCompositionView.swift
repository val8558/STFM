//
//  BodyCompositionView.swift
//  STFM
//
//  Created by Mariana Maiko on 18/02/25.
//

import SwiftUI

struct BodyCompositionView: View {
    @StateObject private var viewModel = BodyCompositionViewModel()

    var body: some View {
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
                
                // Cards de informações principais
                weightInfoView()
                
                // Lista dos itens de composição corporal
                List(viewModel.items) { item in
                    BodyCompositionRow(item: item)
                }
                .listStyle(PlainListStyle())
        }
        .ignoresSafeArea()
        .background(Color.backgroundGray)
    }
    
    // Informações sobre peso inicial, atual e meta
    private func weightInfoView() -> some View {
        HStack {
            weightInfoBox(title: "Peso Inicial", value: "93 kg")
            weightInfoBox(title: "Peso Atual", value: "93 kg")
            weightInfoBox(title: "Minha Meta", value: "89 kg")
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

// Card de cada item da lista
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
                .frame(width: 130, height: 80) // ✅ Define um tamanho fixo para alinhar
                .background(item.color.color)
                .foregroundColor(.black)
                .cornerRadius(8)
        }
        .background(Color.white)
        .cornerRadius(12)
    }
}

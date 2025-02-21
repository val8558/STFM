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
            HStack {
                Spacer()
                Text("Composição Corporal")
                    .font(.headline)
                Spacer()
            }
            .padding()
            .background(Color.white)
//            headerView()

            // Cards de informações principais
            weightInfoView()

            // Lista dos itens de composição corporal
            List(viewModel.items) { item in
                BodyCompositionRow(item: item)
            }
            .listStyle(PlainListStyle())
        }
        .background(Color.gray.opacity(0.2))
        .navigationBarBackButtonHidden(true)
    }

    // Header com título e botão de voltar
    private func headerView() -> some View {
        VStack {
            HStack {
                Spacer()
                Text("Composição Corporal")
                    .font(.headline)
                Spacer()
            }
            .padding()
            .background(Color.white)
        }
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
//        .padding()
        .background(Color.white)
        .cornerRadius(12)
    }
}

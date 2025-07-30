//
//  DietsView.swift
//  STFM
//
//  Created by Mariana Maiko on 21/07/25.
//

import SwiftUI

struct DietsView: View {
    @EnvironmentObject var clientManager: ClientManager

    @State private var selectedDiet: Diet?
    @State private var numberOfCups: Int = 0
    private let maxCups: Int = 6
    
    var body: some View {
        if let client = clientManager.client {
            VStack {
                dietsContent(client: client)
            }
//            .ignoresSafeArea()
            .background(Color.backgroundGray)
        } else {
            Text("Carregando informações do cliente...")
        }
    }
    
    @ViewBuilder
     func dietsContent(client: Client) -> some View {
        NavigationStack {
            WaterIntakeView()
                .padding()
            Spacer()

            ScrollView {
                ForEach(Array(client.diets?.enumerated() ?? [].enumerated()), id: \.element.id) { index, diet in
                    infoCard(diet: diet, title: "Dieta \(index + 1)", image: "diet\(index + 1)")
                }
            }
            .padding(.horizontal, 24)
        }
        .navigationDestination(item: $selectedDiet) { diet in
            MyMeals(diet: diet)
        }
        .navigationTitle("Minhas Refeições")
        .navigationBarTitleDisplayMode(.inline)

    }
    
    @ViewBuilder
    private func infoCard(diet: Diet, title: String, image: String) -> some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(height: 180)
            .padding()
            .foregroundStyle(.white)
            .overlay(cardOverlay(title: title, image: image, selectedDietValue: diet))
    }
    
    @ViewBuilder
    private func cardOverlay(title: String, image: String, selectedDietValue: Diet) -> some View {
        HStack {
            VStack(spacing: 8) {
                Text(title)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .bold()
                Button {
                    selectedDiet = selectedDietValue
                } label: {
                    Text("Ver")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: 150, height: 50)
                        .background(Color.black)
                        .cornerRadius(10)
                }
                .padding()
                .cornerRadius(12)
            }
            Image(image)
                .resizable()
                .frame(width: 100, height: 100)
        }
    }
}

//#Preview {
//    DietsView()
//}

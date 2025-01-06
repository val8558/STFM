//
//  HomeView.swift
//  STFM
//
//  Created by Valmir Garcia on 03/12/24.
//

import SwiftUI
import Foundation

struct HomeView: View {
    
    var body: some View {
        VStack {
            NavigationStack {
                HStack {
                    Text("Olá, Usuário")
                        .font(.headline)
                        .fontWeight(.bold)
                    Spacer()
                    Image("Avatar")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                }.padding(.horizontal)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    .background(Color.white)
                Spacer()
                ScrollView {
                    WeeklyCalendarView()
                        .frame(width: 390, height: 150)
                        .background(Color.white)
                    Spacer()
                    ProgressSectionView()
                    Spacer()
                    NavigationLink(destination: MyMeals()) {
                        MenuContainerRightView(title: "Minhas Refeições", content: "Consulte aqui o cardápio", image: "Meal", imageWidth: 110, imageHeight: 85, linkTo: MyMeals())
                    }
                    Spacer()
                        .frame(height: 20)
                    MenuContainerLeftView(title: "Minhas Medidas", content: "Consulte aqui suas medidas", image: "Metrics", imageWidth: 80, imageHeight: 100, destination: MyMetricsView())
                    Spacer()
                        .frame(height: 20)
                    MenuContainerRightView(title: "Minha Evolução", content: "Veja os gráficos da sua evolução", image: "Evolution", imageWidth: 100, imageHeight: 100, linkTo: MyMeals())
                }
            }
        }.background(Color.backgroundGray)
    }
}

#Preview {
    HomeView()
}

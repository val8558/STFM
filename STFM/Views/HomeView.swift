//
//  HomeView.swift
//  STFM
//
//  Created by Valmir Garcia on 03/12/24.
//

import SwiftUI
import Foundation

struct HomeView: View {
    @EnvironmentObject var clientManager: ClientManager
    @StateObject var loginViewModel = LoginViewModel()

    var body: some View {
        VStack {
            if let client = clientManager.client {
                NavigationStack {
                    HStack {
                        Text("Olá, \(client.name)")
                            .font(.headline)
                            .fontWeight(.bold)
                        Spacer()
                        Image("Avatar")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                    }
                    .padding(.horizontal)
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
                        NavigationLink(destination: DietsView()) {
                            MenuContainerRightView(
                                title: "Minhas Refeições",
                                content: "Consulte aqui o cardápio",
                                image: "Meal",
                                imageWidth: 110,
                                imageHeight: 85,
                                linkTo: DietsView()
                            )
                        }
                            Spacer().frame(height: 20)
                            MenuContainerLeftView(
                                title: "Minhas Medidas",
                                content: "Consulte aqui suas medidas",
                                image: "Metrics",
                                imageWidth: 80,
                                imageHeight: 100,
                                destination: MyMetricsView()
                            )

                        Spacer().frame(height: 20)
                        MenuContainerRightView(
                            title: "Minha Evolução",
                            content: "Veja os gráficos da sua evolução",
                            image: "Evolution",
                            imageWidth: 100,
                            imageHeight: 100,
                            linkTo: ErrorPageView()
                        )
                    }
                    Button("Deslogar") {
                        loginViewModel.logout()
                    }
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(width: 250, height: 40)
                    .background(Color.yellow)
                    .cornerRadius(10)
                    .padding(.top, 10)
                }
                .navigationBarBackButtonHidden(true)
            } else {
                Text("Carregando...")
                    .onAppear {
                        // Adicionando um pequeno delay para verificar se o client foi atualizado
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            if clientManager.client == nil {
                                print("Erro: O clientManager não foi atualizado corretamente.")
                            }
                        }
                    }
            }
        }
        .background(Color.backgroundGray)
    }
}

//#Preview {
//    HomeView()
//}

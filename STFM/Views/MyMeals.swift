//
//  SwiftUIView.swift
//  STFM
//
//  Created by Valmir Garcia on 06/12/24.
//

import SwiftUI

struct MyMeals: View {
    @EnvironmentObject var clientManager: ClientManager
    
    @State private var numberOfCups: Int = 0
    private let maxCups: Int = 6
    let diet: Diet
    
    var body: some View {
        VStack{
            NavigationStack {
                WaterIntakeView()
                    .padding()

                if diet.meals.isEmpty {
                    VStack {
                        Image("mulherErro")
                            .resizable()
                            .frame(width: 100, height: 250)
                        Text("Você ainda não tem nenhuma dieta aqui")
                            .foregroundColor(.black)
                            .bold()
                            .padding()
                    }
                } else {
                    ScrollView {
                        ForEach(diet.meals, id: \.id) { meal in
                            let title = mealTypeTitle(for: meal.type)
                            let image = mealTypeImage(for: meal.type)
                            MealMenuContainerLeftView(
                                title: title,
                                content: "",
                                image: image,
                                imageWidth: 50,
                                imageHeight: 80,
                                destination: MealDetailView(meal: meal, mealTitle: title)
                            )
                        }
                        .padding()
                    }
                }

                Spacer()
            }
            .navigationTitle("Minhas Refeições")
            .navigationBarTitleDisplayMode(.inline)
        }
        .background(Color.backgroundGray)
    }
}

private func mealTypeTitle(for type: Int) -> String {
    switch type {
    case 0: return "Dejejum"
    case 1: return "Café da Manhã"
    case 2: return "Almoço"
    case 3: return "Café da Tarde"
    case 4: return "Lanche da Tarde"
    case 5: return "Jantar"
    case 6: return "Ceia"
    default: return "Refeição"
    }
}

private func mealTypeImage(for type: Int) -> String {
    switch type {
    case 0: return "dejejum"
    case 1: return "breakfast"
    case 2: return "almoco"
    case 3: return "cafeDaTarde"
    case 4: return "lancheTarde"
    case 5: return "almoco"
    case 6: return "ceia"
    default: return "breakfast"
    }
}

struct RoundedCornersShape: Shape {
    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

//#Preview {
//    MyMeals(diet: Client.example.diets!.first!)
//}

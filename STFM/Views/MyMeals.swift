//
//  SwiftUIView.swift
//  STFM
//
//  Created by Valmir Garcia on 06/12/24.
//

import SwiftUI

struct MyMeals: View {
    
    @State private var numberOfCups: Int = 0
    private let maxCups: Int = 6
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    print("Voltar pressionado")
                }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.black)
                }
                Spacer()
                Text("Minhas Refeições")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.black)
                Spacer()
            }
            .padding(.top, 60)
            .padding()
            .background(Color.white)
            .clipShape(RoundedCornersShape(corners: [.bottomLeft, .bottomRight], radius: 20))
            Spacer()
            WaterIntakeView()
                .padding()
            Spacer()

            MealMenuContainerRightView(title: "Café da manhã", content: "Recomendadas 300 - 500 Kcal", image: "Breakfast", imageWidth: 50, imageHeight: 80)
            Spacer()
                .frame(height: 10)
            MealMenuContainerLeftView(title: "Lanche", content: "Recomendadas 300 - 500 Kcal", image: "Breakfast", imageWidth: 50, imageHeight: 80)
            Spacer()
                .frame(height: 10)
            MealMenuContainerRightView(title: "Café da manhã", content: "Recomendadas 300 - 500 Kcal", image: "Breakfast", imageWidth: 50, imageHeight: 80)
            Spacer()
                .frame(height: 10)
            MealMenuContainerLeftView(title: "Lanche", content: "Recomendadas 300 - 500 Kcal", image: "Breakfast", imageWidth: 50, imageHeight: 80)
            Spacer()
                .frame(height: 10)
        }
        .ignoresSafeArea()
        .background(Color.backgroundGray)
        
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

#Preview {
    MyMeals()
}

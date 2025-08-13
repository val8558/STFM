//
//  MealDetailView.swift
//  STFM
//
//  Created by Valmir Garcia on 06/12/24.
//

import SwiftUI

struct MealDetailView: View {
    let meal: Meal
    let mealTitle: String
    
    var body: some View {
        Spacer()
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                Spacer()
                Text(mealTitle)
                    .font(.title)
                    .bold()
                    .foregroundColor(Color(.label))
                Text(meal.meal)
                    .font(.headline)
                    .foregroundColor(Color(.label))
                Spacer()
                
            }
            .frame(width: 350, alignment: .center)
            .padding(.vertical, 20)
        }
        .background(Color(.systemGray6))
        .cornerRadius(20)
        .padding(.top, 20)
    }
}

//struct NutritionCard: View {
//    let color: Color
//    let title: String
//    let value: String
//
//    var body: some View {
//        VStack (spacing: 10){
//            RoundedRectangle(cornerRadius: 10)
//                .fill(color)
//                .frame(height: 80)
//
//            Text(title)
//                .font(.system(size: 12, weight: .bold))
//                .foregroundColor(.gray)
//
//            Text(value)
//                .font(.footnote.bold())
//                .foregroundColor(.black)
//        }
//        .frame(width: 80)
//    }
//}

//extension View {
//    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
//        clipShape(RoundedCorner(radius: radius, corners: corners))
//    }
//}

//struct RoundedCorner: Shape {
//    var radius: CGFloat
//    var corners: UIRectCorner
//
//    func path(in rect: CGRect) -> Path {
//        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//        return Path(path.cgPath)
//    }
//}


#Preview {
    MealDetailView(meal: Meal(id: 1, dietId: 1, type: 2, meal: "Arroz e Feijão fjdngjfdngjdfngjnfdjnvjndfjnvjdfnjbvnfj nfdjnfjdsn", status: 0, createdAt: "", updatedAt: ""),
                   mealTitle: "Almoço")
    .preferredColorScheme(.light) // força modo dark no preview
}

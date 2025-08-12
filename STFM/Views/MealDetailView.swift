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
                Text(mealTitle)
                    .font(.title2)
                    .bold()
                    .foregroundColor(.black)
                    .padding(.horizontal, 16)
                VStack(alignment: .center, spacing: 10) {
                    Text(meal.meal)
                        .font(.headline)
                        .foregroundColor(.black)
                }
                .padding(.horizontal, 16)
            }
            .frame(width: 350, alignment: .center)
            .padding(.vertical, 20)
            
        }
        .background(Color(UIColor.systemGroupedBackground))
        .cornerRadius(20)
        .padding(.top, -20)
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


//
//#Preview {
//    MealDetailView(meal: <#Meal#>, mealTitle: <#String#>)
//}

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

#Preview {
    MealDetailView(meal: Meal(id: 1, dietId: 1, type: 2, meal: "Arroz e Feijão fjdngjfdngjdfngjnfdjnvjndfjnvjdfnjbvnfj nfdjnfjdsn", status: 0, createdAt: "", updatedAt: ""),
                   mealTitle: "Almoço")
    .preferredColorScheme(.light)                                                         
}

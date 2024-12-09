//
//  MealDetailView.swift
//  STFM
//
//  Created by Valmir Garcia on 06/12/24.
//

import SwiftUI

struct MealDetailView: View {
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .topLeading) {
                Image("Breakfast") // Substitua por sua imagem real
                    .resizable()
                    .scaledToFill()
                    .frame(height: 300)
                    .clipped()
                    .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
                
                Button(action: {
                    print("Voltar para Minhas Refeições")
                }) {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.black)
                        .padding(10)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                }
                .padding(.leading, 16)
                .padding(.top, 16)
            }
            ScrollView {
                VStack(alignment: .center, spacing: 20) {
                    VStack(alignment: .center, spacing: 4) {
                        Text("Café da manhã")
                            .font(.title2.bold())
                            .foregroundColor(.black)
                        
                        Text("Avocado Egg Toast")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 16)
                    
                    
                    HStack(spacing: 16) {
                        NutritionCard(color: .black, title: "Proteínas", value: "21 g")
                        NutritionCard(color: .orange, title: "Carboidratos", value: "18 g")
                        NutritionCard(color: .blue, title: "Gordura", value: "10 g")
                    }
                    .padding(.horizontal, 16)
                    
                    VStack(alignment: .center, spacing: 10) {
                        Text("Modo de preparo")
                            .font(.headline)
                            .foregroundColor(.black)
                        
                        Text("""
                             Lorem ipsum dolor sit amet, consectetur adipiscing elit.Proin in finibus velit. Phasellus eget dictum libero. Cras finibus nunc bibendum posuere cursus. Nulla consectetur nec est ac lacinia.
                             """)
                        .font(.body)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
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
//        .edgesIgnoringSafeArea(.top)
    }
}

struct NutritionCard: View {
    let color: Color
    let title: String
    let value: String
    
    var body: some View {
        VStack (spacing: 10){
            RoundedRectangle(cornerRadius: 10)
                .fill(color)
                .frame(height: 80)
            
            Text(title)
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.gray)
            
            Text(value)
                .font(.footnote.bold())
                .foregroundColor(.black)
        }
        .frame(width: 80)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}



#Preview {
    MealDetailView()
}

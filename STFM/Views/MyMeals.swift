//
//  SwiftUIView.swift
//  STFM
//
//  Created by Valmir Garcia on 06/12/24.
//

import SwiftUI

struct SwiftUIView: View {
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
            
            HStack {
                Text("Copos de água")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.black)
                Spacer()
                Image(systemName: "chevron.down")
                    .font(.system(size: 18, weight: .bold))
            }.padding(.horizontal)
            Spacer()
            HStack(spacing: 10) {
                           ForEach(0..<maxCups, id: \.self) { index in
                               Image(systemName: index < numberOfCups ? "cup.and.saucer.fill" : "cup.and.saucer")
                                   .resizable()
                                   .frame(width: 40, height: 40)
                                   .foregroundColor(index < numberOfCups ? .blue : .gray)
                           }
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
    SwiftUIView()
}

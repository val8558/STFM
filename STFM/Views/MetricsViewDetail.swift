//
//  MetricsViewDetail.swift
//  STFM
//
//  Created by Valmir Garcia on 12/12/24.
//

import SwiftUI

struct MetricsViewDetail: View {
    var body: some View {
        VStack {
            HStack{
                Spacer()
                Text("Minhas Medidas")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.black)
                Spacer()
            }
            .padding(.top, 60)
            .padding()
            .background(Color.white)
            .clipShape(RoundedCornersShape(corners: [.bottomLeft, .bottomRight], radius: 20))
        }
        .ignoresSafeArea()
        .background(Color.backgroundGray)
//        Spacer()
        mainMeasureContant
            .background(Color.blue)
        Spacer()
    }
    
    @ViewBuilder private var mainMeasureContant: some View {
        VStack {
            HStack {
                Text("Peso inicial")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.black)
                Spacer()
                Text("Peso atual")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.black)
                Spacer()
                Text("Minha meta")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.black)
            }
                .padding(16)
                .frame(width: 380)
            
            HStack {
                Text("120kg")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.black)
                Spacer()
                Text("130kg")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.black)
                Spacer()
                Text("140kg")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.black)
            }
            .padding(.bottom, 10)
            .padding(.horizontal, 50)
    }
        .background(Color.red)
    }
}

#Preview {
    MetricsViewDetail()
}

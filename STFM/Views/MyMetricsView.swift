//
//  MyMetricsView.swift
//  STFM
//
//  Created by Valmir Garcia on 09/12/24.
//

import SwiftUI

struct MyMetricsView: View {
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
            .ignoresSafeArea()
            Spacer()
            WeightProgressView()
            Spacer()
            MenuContainerRightView (title: "Composição Corporal", content: "", image: "BodyComposition", imageWidth: 125, imageHeight: 100)
            MenuContainerRightView (title: "Medidas", content: "", image: "Metrics_1", imageWidth: 125, imageHeight: 100)
        }.background(Color.backgroundGray)
    }
}

#Preview {
    MyMetricsView()
}

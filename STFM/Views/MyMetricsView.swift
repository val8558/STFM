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
            
            ScrollView{
                WeightProgressView()
                Spacer()
                MenuContainerRightView (title: "Composição Corporal", content: "", image: "BodyComposition", imageWidth: 125, imageHeight: 100, linkTo: MyMeals())
                MenuContainerLeftView(title: "Diagnostico de obesidade", content: "", image: "ObDiag", imageWidth: 125, imageHeight: 100, destination: MyMeals())
                MenuContainerRightView (title: "Medidas", content: "", image: "Metrics_1", imageWidth: 125, imageHeight: 100, linkTo: MyMeals())
                MenuContainerLeftView(title: "Diagnostico \nde obesidade", content: "", image: "ObDiag", imageWidth: 125, imageHeight: 100, destination: MyMeals())
                Spacer()
            }
            
        }.background(Color.backgroundGray)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    MyMetricsView()
}

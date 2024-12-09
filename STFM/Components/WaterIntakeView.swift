//
//  SwiftUIView.swift
//  STFM
//
//  Created by Valmir Garcia on 06/12/24.
//

import SwiftUI

struct WaterIntakeView: View {
    @State private var cups: [Bool] = Array(repeating: false, count: 6)

    var body: some View {
        VStack {
            Text("Copos de água")
                .font(.system(size: 18, weight: .bold))
                .padding(.bottom, 10)

            HStack(spacing: 15) {
                ForEach(0..<cups.count, id: \.self) { index in
                    VStack {
                        Button(action: {
                            cups[index].toggle()
                        }) {
                            Image(cups[index] ? "FilledCup" : "EmptyCup") /
                                .resizable()
                                .frame(width: 40, height: 60)
                        }
                        .buttonStyle(PlainButtonStyle())

                        Text(cups[index] ? "-" : "+")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.blue)
                            .onTapGesture {
                                cups[index].toggle()
                            }
                    }
                }
            }
            .padding(.vertical, 10)

            ProgressView(value: Double(cups.filter { $0 }.count), total: Double(cups.count))
                .progressViewStyle(LinearProgressViewStyle(tint: .blue))
                .scaleEffect(x: 1, y: 4, anchor: .center) // Aumenta a espessura da barra
                .padding(.horizontal)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}


#Preview {
    WaterIntakeView()
}

//
//  MetricsViewDetail.swift
//  STFM
//
//  Created by Valmir Garcia on 12/12/24.
//

import SwiftUI

struct MetricsViewDetail: View {
    @ObservedObject var viewModel: MetricsDetailViewModel
    
    let threeColumns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    let fourColumns = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View {
        VStack (spacing: 16) {
            HStack{
                Spacer()
                Text("Composição Corporal")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.black)
                Spacer()
            }
            .padding(.top, 60)
            .padding()
            .background(Color.white)
            .clipShape(RoundedCornersShape(corners: [.bottomLeft, .bottomRight], radius: 20))
            
            VStack(spacing: 24) {
                mainMeasureContent

                tagRow
                Spacer()
            }
            .padding(.horizontal, 16)
        }
        .ignoresSafeArea()
        .background(Color.backgroundGray)
    }
    
    @ViewBuilder private var mainMeasureContent: some View {
        VStack {
            LazyVGrid(columns: threeColumns) {
                ForEach(0..<3, id: \.self) { index in
                    if index == 0 {
                        VStack (alignment: .center) {
                            Text("Peso inicial")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(.black)
                            Spacer()
                            Text("98 Kg")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.black)
                        }
                    } else if index == 1 {
                        VStack (alignment: .center) {
                            Text("Peso atual")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(.black)
                            Spacer()
                            Text("99 Kg")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.black)
                        }
                    } else if index == 2 {
                        VStack (alignment: .center) {
                            Text("Minha meta")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(.black)
                            Spacer()
                            Text("80 Kg")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.black)
                        }
                    }
                }
            }
        }
        .frame(height: 106)
        .background(Color.white)
        .clipShape(RoundedCornersShape(corners: [.topLeft, .topRight], radius: 20))
    }
    
    @ViewBuilder var tagRow: some View {
        VStack {
            LazyVGrid(columns: fourColumns, alignment: .center) {
                ForEach(0..<4, id: \.self) { index in
                    if index == 0 {
                        VStack (alignment: .center) {
                            Text("Peso")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(.black)
                        }
                    } else if index == 1 {
                        VStack (alignment: .center) {
                            Text("Referência")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(.black)
                            Spacer()
                            Text("47,4 - 80,0")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(.black)
                        }
                    } else if index == 2 {
                        VStack (alignment: .center) {
                            Text("81,6")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(.black)
                            Spacer()

                        }
                    } else if index == 3 {
                        VStack {
                            Text("Alto")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(.black)
                        }
//                        .frame(maxHeight: 100)
                        .padding(.all, 30)
                        .background(Color.red)
                    }
                }
            }
        }
        .frame(height: 106)
        .background(Color.white)
        .clipShape(RoundedCornersShape(corners: .allCorners, radius: 20))
    }
}

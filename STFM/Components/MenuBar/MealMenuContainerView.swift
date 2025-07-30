//
//  MealMenuContainerView.swift
//  STFM
//
//  Created by Valmir Garcia on 06/12/24.
//

import SwiftUI

struct MealMenuContainerRightView<Destination: View>: View {
    let title: String
    let content: String
    let image: String
    let imageWidth: CGFloat
    let imageHeight: CGFloat
    let destination: Destination?
    
    var body: some View {
        VStack {
            HStack {
                VStack (alignment: .leading) {
                    Text(title)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.black)
                        .padding(.top, 10)
                        .padding(.bottom, 5)
                    Text(content)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.gray)
                        .padding(.bottom, 16)
                    if let destination = destination {
                        NavigationLink(destination: destination) {
                            Text("Ver")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 100, height: 31)
                                .background(Color.black)
                                .cornerRadius(10)
                        }.padding(.bottom,10)
                    }
                }.padding(.leading, 20)
                Spacer()
                VStack {
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .clipShape(.ellipse)
                        .frame(width: imageWidth, height: imageHeight)
                        .padding(.bottom, 10)
                        .padding(.trailing, 40)
                }
            }
        }
        .frame(width: 380, height: 120)
        .background(Color.blue)
        .cornerRadius(20)
        .border(.black, width: 0.5)
    }
}

struct MealMenuContainerLeftView<Destination: View>: View {
    
    let title: String
    let content: String
    let image: String
    let imageWidth: CGFloat
    let imageHeight: CGFloat
    let destination: Destination?
    
    var body: some View {
        VStack {
            HStack (spacing: 100){
                VStack {
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .clipShape(.ellipse)
                        .frame(width: imageWidth, height: imageHeight)
                        .padding(.trailing, -30)
                        .padding(.leading, 10)
                }
                VStack (alignment: .leading) {
                    Text(title)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.black)
//                        .padding(.bottom, 5)
                        .padding(.top, 10)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                    Text(content)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.gray)
                        .padding(.bottom, 16)
                    if let destination = destination {
                        NavigationLink(destination: destination) {
                            Text("Ver")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 100, height: 31)
                                .background(Color.black)
                                .cornerRadius(10)
                        }.padding(.bottom,10)
                    }
                }
            }
        }
        .frame(width: 380, height: 120)
        .background(Color.white)
        .cornerRadius(20)
    }
}
//
//#Preview {
//    MyMeals()
//}

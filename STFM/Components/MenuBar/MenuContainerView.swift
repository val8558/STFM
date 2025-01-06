//
//  SwiftUIView.swift
//  STFM
//
//  Created by Valmir Garcia on 03/12/24.
//

import SwiftUI

struct MenuContainerRightView<Destination:View>: View {
    
    let title: String
    let content: String?
    let image: String
    let imageWidth: CGFloat
    let imageHeight: CGFloat
    let linkTo: Destination?
    
    var body: some View {
        VStack {
            HStack {
                VStack (alignment: .leading) {
                    Text(title)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.black)
                        .padding(.top, 10)
                        .padding(.bottom, 5)
                    Text(content ?? "")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.gray)
                        .padding(.bottom, 4)
                    
                    if let linkTo = linkTo {
                        NavigationLink(destination: linkTo) {
                            Text("Ver")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 100, height: 31)
                                .background(Color.black)
                                .cornerRadius(10)
                        } .padding(.bottom, 10)
                    }
                }.padding(.leading, 20)
                Spacer()
                VStack {
                    Image(image)
                        .resizable()
                        .frame(width: imageWidth, height: imageHeight)
                        .padding(.bottom, 10)
                        .padding(.trailing, 5)
                }
            }
        }
        .frame(width: 380, height: 120)
        .background(Color.white)
        .cornerRadius(20)
    }
}

struct MenuContainerLeftView<Destination: View>: View {
    let title: String
    let content: String?
    let image: String
    let imageWidth: CGFloat
    let imageHeight: CGFloat
    let destination: Destination?
    
    var body: some View {
        VStack {
            HStack (spacing: 80){
                VStack {
                    Image(image)
                        .resizable()
                        .frame(width: imageWidth, height: imageHeight)
                        .padding(.trailing, -30)
                }
                VStack (alignment: .leading) {
                    Text(title)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.black)
                        .padding(.bottom, 5)
                        .padding(.top, 10)
                        .lineLimit(nil)
                    if let content = content {
                        Text(content)
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.gray)
                            .padding(.bottom, 4)
                    } else { Spacer() }
                    if let destination = destination {
                        NavigationLink(destination: destination) {
                            Text("Ver")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 100, height: 30)
                                .background(Color.black)
                                .cornerRadius(10)
                        }.padding(.bottom, 10)
                    }
                }.frame(width: 200)
            }
        }
        .frame(width: 380, height: 120)
        .background(Color.white)
        .cornerRadius(20)
    }
}


#Preview {
    HomeView()
}

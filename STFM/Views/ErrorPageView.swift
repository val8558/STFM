//
//  ErrorPageView.swift
//  STFM
//
//  Created by Mariana Maiko on 20/03/25.
//

import SwiftUI

struct ErrorPageView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 50) {
            Image("error-image")
            Text("Ops... \nAinda estamos construindo essa parte")
                .font(.system(size: 18, weight: .bold))
        }
    }
}

#Preview {
    ErrorPageView()
}

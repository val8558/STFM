//
//  STFMApp.swift
//  STFM
//
//  Created by Valmir Garcia on 02/12/24.
//

import SwiftUI

@main
struct STFMApp: App {
    @StateObject private var clientManager = ClientManager()
    @StateObject private var loginViewModel = LoginViewModel()

    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(clientManager)
                .environmentObject(loginViewModel)
        }
    }
}

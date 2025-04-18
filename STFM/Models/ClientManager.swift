//
//  ClientManager.swift
//  STFM
//
//  Created by Mariana Maiko on 15/01/25.
//

import Foundation
import Combine

class ClientManager: ObservableObject {
    @Published var client: Client?
    @Published var isLoggedIn: Bool = false

    func updateClient(_ newClient: Client) {
        self.client = newClient
        self.isLoggedIn = true
    }

    func logout() {
        self.client = nil
        self.isLoggedIn = false
        UserDefaults.standard.removeObject(forKey: "authToken")
    }
}

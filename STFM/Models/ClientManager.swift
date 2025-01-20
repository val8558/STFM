//
//  ClientManager.swift
//  STFM
//
//  Created by Mariana Maiko on 15/01/25.
//

import SwiftUI

class ClientManager: ObservableObject {
    @Published var client: Client?

    func updateClient(_ client: Client) {
        self.client = client
    }
}

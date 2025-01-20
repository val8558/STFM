//
//  HomeViewModel.swift
//  STFM
//
//  Created by Mariana Maiko on 14/01/25.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    var client: Client
    
    init(client: Client) {
        self.client = client
    }
}

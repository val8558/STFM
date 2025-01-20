//
//  Client.swift
//  STFM
//
//  Created by Mariana Maiko on 14/01/25.
//

import SwiftUI

enum Gender: String, Codable {
    case male = "male"
    case female = "female"
}

enum Status: String, Codable {
    case tooHigh = "Muito alto"
    case high = "Alto"
    case normal = "Normal"
    case low = "Baixo"
    case tooLow = "Muito baixo"
    case great = "Ótimo"
    case excellent = "Excelente"
}

struct Client: Codable {
    let name: String
    let age: Int
    let gender: Gender
    let initialWeight: Double = 0.0
    let currentWeight: Double
    let weightGoal: Double
    let reference: Status
}

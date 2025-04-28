//
//  Client.swift
//  STFM
//
//  Created by Mariana Maiko on 14/01/25.
//

import SwiftUI

//enum Gender: String, Codable {
//    case male = "male"
//    case female = "female"
//}

enum Status: String, Codable {
    case tooHigh = "Muito alto"
    case high = "Alto"
    case normal = "Normal"
    case low = "Baixo"
    case tooLow = "Muito baixo"
    case great = "Ótimo"
    case excellent = "Excelente"
}

//struct Client: Codable {
//    let name: String
//    let age: Int
//    let gender: Gender
//    let initialWeight: Double = 0.0
//    let currentWeight: Double
//    let weightGoal: Double
//    let reference: Status
//}

struct LoginResponse: Decodable {
    let status: Bool
    let message: String
    let client: Client
    let token: String
}

struct Client: Decodable {
    let id: Int
    let userId: Int
    let name: String
    let birth: String
    let gender: String?
    let height: Int?
    let address: String?
    let addressNumber: Int?
    let complement: String?
    let district: String?
    let city: String?
    let career: String?
    let email: String?
    let whatsapp: String?
    let document: String?
    let avaliations: [Avaliation]?
    let objectives: [Objective]?
    let schedule: [Schedule]?
    let createdAt: String
    let updatedAt: String
    
//        let initialWeight: Double = 0.0
//        let currentWeight: Double
//        let weightGoal: Double
//        let reference: Status

    enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case name
        case birth
        case gender
        case height
        case address
        case addressNumber = "address_number"
        case complement
        case district
        case city
        case career
        case email
        case whatsapp
        case document
        case avaliations
        case objectives
        case schedule
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        
//        case initialWeight
//        case currentWeight
//        case weightGoal
//        case reference
    }
}

extension Client {
    var initialWeight: Double? {
        return avaliations?.first?.weight
    }
    
    var currentWeight: Double? {
        return avaliations?.last?.weight
    }
    
    var weightGoal: Double? {
        return objectives?.first?.weight
    }
    
    var age: Int? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)

        guard let birthDate = formatter.date(from: birth) else {
            return nil
        }

        let calendar = Calendar.current
        let now = Date()
        let ageComponents = calendar.dateComponents([.year], from: birthDate, to: now)
        return ageComponents.year
    }
}

struct Avaliation: Decodable {
    let id: Int
    let clientId: Int
    let weight: Double
    let bmi: Double
    let bodyFat: Double
    let bodyMuscle: Double
    let visceralFat: Int
    let restingMetabolism: Int
    let bodyAge: Int

    enum CodingKeys: String, CodingKey {
        case id
        case clientId = "client_id"
        case weight
        case bmi
        case bodyFat = "body_fat"
        case bodyMuscle = "body_muscle"
        case visceralFat = "visceral_fat"
        case restingMetabolism = "resting_metabolism"
        case bodyAge = "body_age"
    }
}

struct Objective: Decodable {
    let id: Int
    let clientId: Int
    let weight: Double
    let months: Int

    enum CodingKeys: String, CodingKey {
        case id
        case clientId = "client_id"
        case weight
        case months
    }
}

struct Schedule: Decodable {
    let id: Int
    let clientId: Int
    let clientAvaliationId: Int
    let date: String
    let status: Int

    enum CodingKeys: String, CodingKey {
        case id
        case clientId = "client_id"
        case clientAvaliationId = "client_avaliation_id"
        case date
        case status
    }
}


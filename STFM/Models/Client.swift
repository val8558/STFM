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
    let avaliations: [Avaliation]
    let objectives: [Objective]?
    let schedule: [Schedule]?
    let diets: [Diet]?
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
        case diets
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
        guard let firstAvaliation = avaliations.first else {
            return nil
        }
        return firstAvaliation.weight
    }
    
    var currentWeight: Double? {
        guard let lastAvaliation = avaliations.last else {
            return nil
        }
        return lastAvaliation.weight
    }
    
    var weightGoal: Double? {
        return objectives?.first?.weight
    }
    
    var bodyAge: Int {
        guard let lastBodyAge = avaliations.last?.bodyAge else {
            return 0
        }
        return lastBodyAge
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

struct Diet: Decodable, Identifiable, Hashable {
    let id: Int
    let clientId: Int
    let startDate: String
    let endDate: String?
    let status: Int
    let createdAt: String
    let updatedAt: String
    let meals: [Meal]

    enum CodingKeys: String, CodingKey {
        case id
        case clientId = "client_id"
        case startDate = "start_date"
        case endDate = "end_date"
        case status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case meals
    }
}

struct Meal: Decodable, Identifiable, Hashable {
    let id: Int
    let dietId: Int
    let type: Int
    let meal: String
    let status: Int
    let createdAt: String?
    let updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case dietId = "diet_id"
        case type
        case meal
        case status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

extension Client {
    static let example = Client(
        id: 1,
        userId: 1, name: "Cliente Exemplo",
        birth: "1990-01-01",
        gender: nil,
        height: nil,
        address: nil,
        addressNumber: nil,
        complement: nil,
        district: nil,
        city: "exemplo@email.com",
        career: "11999999999",
        email: nil,
        whatsapp: "2025-01-01T00:00:00Z",
        document: "2025-01-01T00:00:00Z",
        avaliations: [],
        objectives: nil,
        schedule: [],
        diets: [
            Diet(
                id: 1,
                clientId: 1,
                startDate: "2025-01-01",
                endDate: nil,
                status: 0,
                createdAt: "2025-01-01T00:00:00Z",
                updatedAt: "2025-01-01T00:00:00Z",
                meals: [
                    Meal(
                        id: 1,
                        dietId: 1,
                        type: 2,
                        meal: "Almoço teste",
                        status: 0,
                        createdAt: "2025-01-01T00:00:00Z",
                        updatedAt: "2025-01-01T00:00:00Z"
                    )
                ]
            )], createdAt: "",
        updatedAt: "")}

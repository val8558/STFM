//
//  BodyCompositionViewModel.swift
//  STFM
//
//  Created by Mariana Maiko on 18/02/25.
//

import Foundation
import Combine

class BodyCompositionViewModel: ObservableObject {
    @Published var items: [BodyComposition] = []

    func fetchBodyCompositionData(from client: Client) {
        guard let age = client.age else {
            print("Erro: idade inválida.")
            return
        }
        let weight = String(format: "%.1f", client.currentWeight ?? 0.0) + "kg"
        let skeletalMuscleRange = skeletalMuscleReference(for: client.gender ?? "x", age: age) //faltando valor do back
        let bodyMuscle = String(format: "%.1f", client.avaliations.last?.bodyMuscle ?? 0.0) + "%"
        let bodyAge = String(client.bodyAge)
        
        self.items = [
            BodyComposition(title: "Peso", reference: "47,4 ~ 84,0", value: weight, status: "Muito Alto", color: .high),
            BodyComposition(title: "Músculo Esquelético", reference: skeletalMuscleRange, value: "", status: "Excelente", color: .excellent),
            BodyComposition(title: "Massa Muscular", reference: "34,2 ~ 50,5Kg", value: bodyMuscle, status: "Ótimo", color: .good),
            BodyComposition(title: "Idade Corporal", reference: "47,4 ~ 84,0", value: bodyAge, status: "+23 Anos", color: .neutral),
        ]
    }
    
    func skeletalMuscleReference(for gender: String, age: Int) -> String {
        switch gender.lowercased() {
        case "f":
            switch age {
            case 18...39: return "24,3 ~ 30,3"
            case 40...59: return "24,1 ~ 30,1"
            case 60...80: return "23,9 ~ 29,9"
            default: return "Sem referência"
            }
        case "m":
            switch age {
            case 18...39: return "33,3 ~ 39,3"
            case 40...59: return "33,1 ~ 39,1"
            case 60...79: return "32,9 ~ 38,9"
            default: return "Sem referência"
            }
        default:
            return "xx ~ xx"
        }
    }
}

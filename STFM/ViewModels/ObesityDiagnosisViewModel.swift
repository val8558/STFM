//
//  ObesityDiagnosisViewModel.swift
//  STFM
//
//  Created by Mariana Maiko on 23/04/25.
//

import Foundation
import Combine

class ObesityDiagnosisViewModel: ObservableObject {
    @Published var items: [BodyComposition] = []

    func fetchBodyCompositionData(from client: Client) {
        let imc = String(format: "%.1f", client.avaliations.last?.bmi ?? 0.0)
        let bodyFat = String(format: "%.1f", client.avaliations.last?.bodyFat ?? 0.0) + "%" // precisa inserir o valor em porcentagem
        let visceralFat = String(format: "%.1f", client.avaliations.last?.visceralFat ?? 0.0) + "%"
        let bodyAge = String(client.bodyAge)
        
        self.items = [
            BodyComposition(title: "IMC", reference: "18,5 ~ 25,0 Kg/m2", value: imc, status: "Muito Alto", color: .high),
            BodyComposition(title: "Gordura Corporal", reference: "1 ~ 9", value: bodyFat, status: "Acima do Normal", color: .neutral),
            BodyComposition(title: "Gordura Visceral", reference: "1 ~ 9", value: visceralFat, status: "Muito alto", color: .high),
            BodyComposition(title: "Idade Corporal", reference: "N/A", value: bodyAge, status: "Acima", color: .neutral),
            BodyComposition(title: "Rel. Cintura/Quadril", reference: "0,84 ~ 0,91", value: "", status: "Muito Alto", color: .high),
        ]
    }
}

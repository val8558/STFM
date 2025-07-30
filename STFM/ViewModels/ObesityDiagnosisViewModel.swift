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
//            BodyComposition(title: "Peso", reference: "47,4 ~ 84,0", value: "81,5", status: "Muito Alto", color: .high),
//            BodyComposition(title: "Músculo Esquelético", reference: "47,4 ~ 84,0", value: "39,8kg", status: "Excelente", color: .excellent),
//            BodyComposition(title: "Massa Muscular", reference: "34,2 ~ 50,5Kg", value: "59,5kg", status: "Ótimo", color: .good),
//            BodyComposition(title: "Idade Corporal", reference: "47,4 ~ 84,0", value: "81,7kg", status: "+23 Anos", color: .neutral),
            BodyComposition(title: "IMC", reference: "18,5 ~ 25,0 Kg/m2", value: imc, status: "Muito Alto", color: .high),
            BodyComposition(title: "Gordura Corporal", reference: "1 ~ 9", value: bodyFat, status: "Acima do Normal", color: .neutral),
            BodyComposition(title: "Gordura Visceral", reference: "1 ~ 9", value: visceralFat, status: "Muito alto", color: .high),
            BodyComposition(title: "Idade Corporal", reference: "N/A", value: bodyAge, status: "Acima", color: .neutral),
            BodyComposition(title: "Rel. Cintura/Quadril", reference: "0,84 ~ 0,91", value: "", status: "Muito Alto", color: .high),
//            BodyComposition(title: "Torax", reference: "xx ~ xx", value: "xx", status: "Muito Alto", color: .high),
//            BodyComposition(title: "Abdomen", reference: "xx ~ xx", value: "xx", status: "Normal", color: .good),
//            BodyComposition(title: "Cintura", reference: "xx ~ xx", value: "xx", status: "Abaixo", color: .neutral),
//            BodyComposition(title: "Quadril", reference: "xx ~ xx", value: "xx", status: "Muito baixo", color: .high),
//            BodyComposition(title: "Braço direito", reference: "xx ~ xx", value: "xx", status: "Abaixo", color: .neutral),
//            BodyComposition(title: "Braço Esquerdo", reference: "xx ~ xx", value: "xx", status: "Abaixo", color: .neutral),
//            BodyComposition(title: "Perna Direita", reference: "xx ~ xx", value: "xx", status: "Abaixo", color: .neutral),
//            BodyComposition(title: "Perna Esquerda", reference: "xx ~ xx", value: "xx", status: "Abaixo", color: .neutral)
        ]
    }
}

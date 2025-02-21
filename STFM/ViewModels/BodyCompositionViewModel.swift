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

    init() {
        fetchBodyCompositionData()
    }

    func fetchBodyCompositionData() {
        self.items = [
            BodyComposition(title: "Peso", reference: "47,4 ~ 84,0", value: "81,5", status: "Muito Alto", color: .high),
            BodyComposition(title: "Músculo Esquelético", reference: "47,4 ~ 84,0", value: "39,8kg", status: "Excelente", color: .excellent),
            BodyComposition(title: "Massa Muscular", reference: "34,2 ~ 50,5Kg", value: "59,5kg", status: "Ótimo", color: .good),
            BodyComposition(title: "Idade Corporal", reference: "47,4 ~ 84,0", value: "81,7kg", status: "+23 Anos", color: .neutral),
            BodyComposition(title: "IMC", reference: "18,5 ~ 25,0 Kg/m2", value: "31,9Kg/m2", status: "Muito Alto", color: .high),
            BodyComposition(title: "Gordura Corporal", reference: "1 ~ 9", value: "23,2% 19,0Kg", status: "Acima do Normal", color: .neutral),
            BodyComposition(title: "Gordura Visceral", reference: "1 ~ 9", value: "17", status: "Muito alto", color: .high),
            BodyComposition(title: "Idade Corporal", reference: "N/A", value: "1753Kg", status: "Acima", color: .neutral),
            BodyComposition(title: "Rel. Cintura/Quadril", reference: "0,84 ~ 0,91", value: "0,94", status: "Muito Alto", color: .high),
            BodyComposition(title: "Torax", reference: "xx ~ xx", value: "xx", status: "Muito Alto", color: .high),
            BodyComposition(title: "Abdomen", reference: "xx ~ xx", value: "xx", status: "Normal", color: .good),
            BodyComposition(title: "Cintura", reference: "xx ~ xx", value: "xx", status: "Abaixo", color: .neutral),
            BodyComposition(title: "Quadril", reference: "xx ~ xx", value: "xx", status: "Muito baixo", color: .high),
            BodyComposition(title: "Braço direito", reference: "xx ~ xx", value: "xx", status: "Abaixo", color: .neutral),
            BodyComposition(title: "Braço Esquerdo", reference: "xx ~ xx", value: "xx", status: "Abaixo", color: .neutral),
            BodyComposition(title: "Perna Direita", reference: "xx ~ xx", value: "xx", status: "Abaixo", color: .neutral),
            BodyComposition(title: "Perna Esquerda", reference: "xx ~ xx", value: "xx", status: "Abaixo", color: .neutral)
        ]
    }
}

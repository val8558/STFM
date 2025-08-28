//
//  MeasuresViewModel.swift
//  STFM
//
//  Created by Mariana Maiko on 23/04/25.
//

import SwiftUI

class MeasuresViewModel: ObservableObject {
    @Published var items: [BodyComposition] = []

    func fetchBodyCompositionData(from client: Client) {
        self.items = [

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

//
//  BodyComposition.swift
//  STFM
//
//  Created by Mariana Maiko on 18/02/25.
//

import Foundation
import SwiftUICore

struct BodyComposition: Identifiable {
    let id = UUID()
    let title: String
    let reference: String
    let value: String
    let status: String
    let color: StatusColor
}

enum StatusColor {
    case high, excellent, good, neutral

    var color: Color {
        switch self {
        case .high: return Color.red.opacity(0.7)      // Cor para "Muito Alto"
        case .excellent: return Color.green.opacity(0.6)  // Cor para "Excelente"
        case .good: return Color.green.opacity(0.4)    // Cor para "Ótimo"
        case .neutral: return Color.yellow.opacity(0.6)  // Cor para "+23 Anos"
        }
    }
    
    func getColor() -> Color {
        switch self {
        case .high:
            return Color.red.opacity(0.7)
        case .excellent:
            return Color.green.opacity(0.6)
        case .neutral:
            return Color.yellow.opacity(0.6)
        case .good:
            return Color.green.opacity(0.4)
//        case .abaixoNormal:
//            return Color.red.opacity(0.4)
        }
    }
}

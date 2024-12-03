//
//  WeeklyCalendarView.swift
//  STFM
//
//  Created by Valmir Garcia on 03/12/24.
//

import SwiftUI

struct WeeklyCalendarView: View {
    @ObservedObject var viewModel = WeeklyCalendarViewModel()
    
    private var currentDate: String {
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE, dd MMMM yyyy" // Exemplo: "sexta-feira, 22 Agosto 2024"
            formatter.locale = Locale(identifier: "pt_BR") // Para o formato em português
            return formatter.string(from: date).capitalized // Ajusta a capitalização
        }
    
    var body: some View {
        VStack (alignment: .center, spacing: 10){
            HStack(spacing: 50){
                Text("Hoje, \(currentDate)")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.black)
              
                Image(systemName: "chevron.down")
                    .foregroundColor(.gray)
                    .padding(.leading, 20)
            }.padding()
            HStack(spacing: 20) {
                ForEach(viewModel.weekDates, id: \.self) { date in
                    VStack {
                        Text(viewModel.dayOfWeek(date))
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Text(viewModel.dayOfMonth(date))
                            .font(.headline)
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .background(viewModel.isToday(date) ? Color.yellow : Color.clear)
                            .clipShape(Capsule())
                        
                    }
                    .frame(width: 44, height: 84)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20, style: .circular)
                            .stroke(Color.black, lineWidth: 1)
                    ).padding(.bottom, 20)
                }
            }
        }
        
        
    }
}


#Preview {
    WeeklyCalendarView()
}

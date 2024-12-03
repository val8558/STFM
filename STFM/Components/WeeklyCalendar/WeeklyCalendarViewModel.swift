//
//  WeeklyCalendarViewModel.swift
//  STFM
//
//  Created by Valmir Garcia on 03/12/24.
//

import Foundation

class WeeklyCalendarViewModel: ObservableObject {
    private let calendar = Calendar.current
    private let today = Date()
    
    // Public property para expor as datas da semana
    @Published var weekDates: [Date] = []
    
    init() {
        self.weekDates = getWeekDates()
    }
    
    private func getWeekDates() -> [Date] {
        var calendar = self.calendar
        calendar.firstWeekday = 2 // Segunda-feira como primeiro dia da semana
        
        let todayComponents = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: today)
        let startOfWeek = calendar.date(from: todayComponents)!
        
        return (0..<6).compactMap { calendar.date(byAdding: .day, value: $0, to: startOfWeek) }
    }
    
    func isToday(_ date: Date) -> Bool {
        calendar.isDate(date, inSameDayAs: today)
    }
    
    func dayOfMonth(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter.string(from: date)
    }
    
    func dayOfWeek(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E"
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter.string(from: date)
    }
}

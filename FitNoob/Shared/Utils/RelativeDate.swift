//
//  RelativeDate.swift
//  FitNoob
//
//  Created by Tharuka Sooriyaarachchi on 11/29/25.
//

import Foundation

extension Date {
    func relativeString() -> String {
        let calendar = Calendar.current
        
        if calendar.isDateInToday(self) { return "Today" }
        if calendar.isDateInTomorrow(self) { return "Tomorrow" }
        if calendar.isDateInYesterday(self) { return "Yesterday" }
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
}

//
//  CreateScheduleViewModel.swift
//  FitNoob
//
//  Created by Tharuka Sooriyaarachchi on 11/29/25.
//

import SwiftUI;
import Combine

class CreateScheduleViewModel: ObservableObject {
    @Published var selectedDays: Set<DayOfWeek> = []
    @Published var workoutDays: [WorkoutDay] = []
    
    func toggleDay(_ day: DayOfWeek) {
        if selectedDays.contains(day) {
            selectedDays.remove(day)
            workoutDays.removeAll { $0.dayOfWeek == day }
        } else {
            selectedDays.insert(day)
            let newDay = WorkoutDay(
                dayOfWeek: day,
                name: "",
                exercises: [],
                cardio: nil
            )
            workoutDays.append(newDay)
            workoutDays.sort { $0.dayOfWeek.rawValue < $1.dayOfWeek.rawValue }
        }
    }
    
    func saveSchedule(name: String) {
        // TODO: Save to persistence layer
        print("Saving schedule: \(name)")
        print("Workout days: \(workoutDays)")
    }
}

#Preview {
    CreateScheduleView()
}

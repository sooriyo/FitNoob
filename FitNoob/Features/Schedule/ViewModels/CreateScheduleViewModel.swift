//
//  CreateScheduleViewModel.swift
//  FitNoob
//
//  Created by Tharuka Sooriyaarachchi on 11/29/25.
//

import SwiftUI
import Combine

class CreateScheduleViewModel: ObservableObject {
    @Published var schedules: [Schedule] = []
    
    // MARK: - Create Schedule from Assignments
    func createScheduleFromAssignments(
        name: String,
        assignments: [(day: DayOfWeek, trainingNumber: Int?)]
    ) {
        var workoutDays: [WorkoutDay] = []
        
        for (day, trainingNumber) in assignments {
            if let trainingNumber = trainingNumber {
                let workoutDay = WorkoutDay(
                    dayOfWeek: day,
                    name: "Day \(trainingNumber)",
                    exercises: [],
                    cardio: nil,
                    isRestDay: false
                )
                workoutDays.append(workoutDay)
            } else {
                let restDay = WorkoutDay(
                    dayOfWeek: day,
                    name: "Rest Day",
                    exercises: [],
                    cardio: nil,
                    isRestDay: true
                )
                workoutDays.append(restDay)
            }
        }
        
        let schedule = Schedule(
            name: name,
            workoutDays: workoutDays,
            isActive: true
        )
        
        saveSchedule(schedule)
    }
    
    // MARK: - Save Schedule
    func saveSchedule(_ schedule: Schedule) {
        // Add to local array
        schedules.append(schedule)
        
        // TODO: Persist to UserDefaults, CoreData, or API
    }
    
    // MARK: - Delete Schedule
    func deleteSchedule(_ schedule: Schedule) {
        schedules.removeAll { $0.id == schedule.id }
        // TODO: Remove from persistence layer
    }
    
    // MARK: - Update Schedule
    func updateSchedule(_ schedule: Schedule) {
        if let index = schedules.firstIndex(where: { $0.id == schedule.id }) {
            schedules[index] = schedule
        }
        // TODO: Update in persistence layer
    }
}

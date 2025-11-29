import SwiftUI
import Combine

class ScheduleViewModel: ObservableObject {
    @Published var selectedDay: String = "Monday"
    @Published var workouts: [WorkoutSession] = workoutSchedule
    @Published var completedExercises: Set<UUID> = []
    @Published var isWorkoutStarted: Bool = false
    
    func getWorkout(for day: String) -> WorkoutSession? {
        workouts.first { $0.day == day }
    }
    
    func toggleExerciseCompletion(_ exerciseId: UUID) {
        if completedExercises.contains(exerciseId) {
            completedExercises.remove(exerciseId)
        } else {
            completedExercises.insert(exerciseId)
        }
    }
    
    func isExerciseCompleted(_ exerciseId: UUID) -> Bool {
        completedExercises.contains(exerciseId)
    }
    
    func getCompletionProgress(for session: WorkoutSession) -> Double {
        let completed = session.workingSets.filter { completedExercises.contains($0.id) }.count
        return Double(completed) / Double(session.workingSets.count)
    }
    
    func resetWorkout() {
        completedExercises.removeAll()
        isWorkoutStarted = false
    }
}




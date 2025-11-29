import SwiftUI

struct ExerciseCard: View {
    let exercise: WorkoutExercise
    let isCompleted: Bool
    let onToggle: () -> Void
    
    var body: some View {
        Button(action: onToggle) {
            HStack(spacing: 16) {
                // Completion Indicator
                ZStack {
                    Circle()
                        .stroke(isCompleted ? Color.green : Color.white.opacity(0.2), lineWidth: 2)
                        .frame(width: 44, height: 44)
                    
                    if isCompleted {
                        Image(systemName: "checkmark")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.green)
                    }
                }
                
                // Exercise Details
                VStack(alignment: .leading, spacing: 8) {
                    Text(exercise.exerciseName)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack(spacing: 16) {
                        Label("\(exercise.sets) sets", systemImage: "number")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(.gray)
                        Label(exercise.reps, systemImage: "repeat")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(.gray)
                        Label("\(exercise.restTime)s", systemImage: "clock")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(.gray)
                    }
                }
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white.opacity(0.3))
            }
            .padding(16)
            .background(isCompleted ? Color.green.opacity(0.1) : Color(white: 0.08))
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isCompleted ? Color.green.opacity(0.3) : Color.clear, lineWidth: 1)
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

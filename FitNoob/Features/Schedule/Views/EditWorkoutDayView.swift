//
//  EditWorkoutDayView.swift
//  FitNoob
//
//  Created by Tharuka Sooriyaarachchi on 11/29/25.
//

import SwiftUI

struct EditWorkoutDayView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var workoutDay: WorkoutDay
    @State private var showAddExercise = false
    @State private var showAddCardio = false
    
    var body: some View {
        ZStack {
            AppColors.background.ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header
                HStack {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.down")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(AppColors.text)
                            .frame(width: 44, height: 44)
                            .background(AppColors.surfaceLight)
                            .clipShape(Circle())
                    }
                    
                    Spacer()
                    
                    Text(workoutDay.dayOfWeek.fullName)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(AppColors.text)
                    
                    Spacer()
                    
                    Button(action: { dismiss() }) {
                        Image(systemName: "checkmark")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(AppColors.text)
                            .frame(width: 44, height: 44)
                            .background(AppColors.surfaceLight)
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        // Exercises Section
                        VStack(alignment: .leading, spacing: 16) {
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Exercises")
                                        .font(.system(size: 15, weight: .semibold))
                                        .foregroundColor(AppColors.text)
                                    
                                    Text("Add exercises for this day")
                                        .font(.system(size: 13))
                                        .foregroundColor(AppColors.textSecondary)
                                }
                                
                                Spacer()
                                
                                Text("\(workoutDay.exercises.count)")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundColor(AppColors.textSecondary)
                            }
                            
                            if workoutDay.exercises.isEmpty {
                                VStack(spacing: 12) {
                                    Image(systemName: "dumbbell.fill")
                                        .font(.system(size: 32))
                                        .foregroundColor(AppColors.textSecondary)
                                    
                                    Text("No exercises yet")
                                        .font(.system(size: 15, weight: .medium))
                                        .foregroundColor(AppColors.text)
                                    
                                    Text("Add your first exercise to get started")
                                        .font(.system(size: 13))
                                        .foregroundColor(AppColors.textSecondary)
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 32)
                            } else {
                                VStack(spacing: 12) {
                                    ForEach(workoutDay.exercises) { exercise in
                                        ExerciseRow(exercise: exercise) {
                                            workoutDay.exercises.removeAll { $0.id == exercise.id }
                                        }
                                    }
                                }
                            }
                            
                            Button(action: { showAddExercise = true }) {
                                HStack {
                                    Image(systemName: "plus.circle.fill")
                                        .font(.system(size: 20))
                                    Text("Add Exercise")
                                        .font(.system(size: 16, weight: .semibold))
                                }
                                .foregroundColor(AppColors.text)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 14)
                                .background(AppColors.surfaceLight)
                                .cornerRadius(12)
                            }
                        }
                        
                        // Cardio Section
                        VStack(alignment: .leading, spacing: 16) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Cardio")
                                    .font(.system(size: 15, weight: .semibold))
                                    .foregroundColor(AppColors.text)
                                
                                Text("Add cardio activity (optional)")
                                    .font(.system(size: 13))
                                    .foregroundColor(AppColors.textSecondary)
                            }
                            
                            if let cardio = workoutDay.cardio {
                                CardioRow(cardio: cardio) {
                                    workoutDay.cardio = nil
                                }
                            } else {
                                Button(action: { showAddCardio = true }) {
                                    HStack {
                                        Image(systemName: "plus.circle.fill")
                                            .font(.system(size: 20))
                                        Text("Add Cardio")
                                            .font(.system(size: 16, weight: .semibold))
                                    }
                                    .foregroundColor(AppColors.text)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 14)
                                    .background(AppColors.surfaceLight)
                                    .cornerRadius(12)
                                }
                            }
                        }
                        
                        Spacer(minLength: 40)
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 24)
                }
            }
        }
        .sheet(isPresented: $showAddExercise) {
            AddExerciseView(workoutDay: $workoutDay)
        }
        .sheet(isPresented: $showAddCardio) {
            AddCardioView(workoutDay: $workoutDay)
        }
    }
}

// MARK: - Exercise Row
struct ExerciseRow: View {
    let exercise: WorkoutExercise
    let onDelete: () -> Void
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: "line.3.horizontal")
                .font(.system(size: 16))
                .foregroundColor(AppColors.textSecondary)
                .padding(.top, 4)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(exercise.exerciseName)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(AppColors.text)
                
                Text("\(exercise.sets) sets × \(exercise.reps) reps • \(exercise.restTime)s rest")
                    .font(.system(size: 14))
                    .foregroundColor(AppColors.textSecondary)
                
                if !exercise.notes.isEmpty {
                    Text(exercise.notes)
                        .font(.system(size: 13))
                        .foregroundColor(AppColors.textSecondary.opacity(0.7))
                }
            }
            
            Spacer()
            
            Button(action: onDelete) {
                Image(systemName: "trash")
                    .font(.system(size: 14))
                    .foregroundColor(.red.opacity(0.8))
            }
        }
        .padding(16)
        .background(AppColors.surfaceLight)
        .cornerRadius(12)
    }
}

// MARK: - Cardio Row
struct CardioRow: View {
    let cardio: CardioSession
    let onDelete: () -> Void
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "figure.run")
                .font(.system(size: 20))
                .foregroundColor(AppColors.text)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(cardio.type)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(AppColors.text)
                
                if let duration = cardio.duration {
                    Text("\(duration) min • \(cardio.intensity) intensity")
                        .font(.system(size: 14))
                        .foregroundColor(AppColors.textSecondary)
                } else if let distance = cardio.distance {
                    Text("\(String(format: "%.1f", distance)) km • \(cardio.intensity) intensity")
                        .font(.system(size: 14))
                        .foregroundColor(AppColors.textSecondary)
                }
            }
            
            Spacer()
            
            Button(action: onDelete) {
                Image(systemName: "trash")
                    .font(.system(size: 14))
                    .foregroundColor(.red.opacity(0.8))
            }
        }
        .padding(16)
        .background(AppColors.surfaceLight)
        .cornerRadius(12)
    }
}

#Preview {
    EditWorkoutDayView(workoutDay: .constant(WorkoutDay(
        dayOfWeek: .monday,
        name: "Push Day",
        exercises: [],
        cardio: nil
    )))
}

//
//  AddExerciseView.swift
//  FitNoob
//
//  Created by Tharuka Sooriyaarachchi on 11/29/25.
//

import SwiftUI

struct AddExerciseView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var workoutDay: WorkoutDay
    
    @State private var searchText = ""
    @State private var selectedExercise: Exercise?
    @State private var sets: Int = 3
    @State private var reps: String = "10"
    @State private var restTime: Int = 60
    @State private var notes: String = ""
    
    // Use the global Exercise library
    let exercises = Exercise.library
    
    var filteredExercises: [Exercise] {
        if searchText.isEmpty {
            return exercises
        }
        return exercises.filter { $0.name.lowercased().contains(searchText.lowercased()) }
    }
    
    var body: some View {
        ZStack {
            AppColors.background.ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header
                HStack {
                    Button(action: { dismiss() }) {
                        Text("Cancel")
                            .font(.system(size: 17))
                            .foregroundColor(AppColors.text)
                    }
                    
                    Spacer()
                    
                    Text("Add Exercise")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(AppColors.text)
                    
                    Spacer()
                    
                    Button(action: addExercise) {
                        Text("Add")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(selectedExercise == nil ? AppColors.textSecondary : AppColors.text)
                    }
                    .disabled(selectedExercise == nil)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 16)
                
                if selectedExercise == nil {
                    // Exercise Selection
                    VStack(spacing: 0) {
                        // Search Bar
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(AppColors.textSecondary)
                            
                            TextField("Search exercises", text: $searchText)
                                .font(.system(size: 17))
                                .foregroundColor(AppColors.text)
                        }
                        .padding()
                        .background(AppColors.surfaceLight)
                        .cornerRadius(12)
                        .padding(.horizontal, 24)
                        .padding(.bottom, 16)
                        
                        // Exercise List
                        ScrollView {
                            VStack(spacing: 8) {
                                ForEach(filteredExercises) { exercise in
                                    Button(action: {
                                        selectedExercise = exercise
                                    }) {
                                        HStack {
                                            VStack(alignment: .leading, spacing: 4) {
                                                Text(exercise.name)
                                                    .font(.system(size: 16, weight: .medium))
                                                    .foregroundColor(AppColors.text)
                                                
                                                Text("\(exercise.category) • \(exercise.equipment)")
                                                    .font(.system(size: 14))
                                                    .foregroundColor(AppColors.textSecondary)
                                            }
                                            
                                            Spacer()
                                            
                                            Image(systemName: "chevron.right")
                                                .font(.system(size: 14))
                                                .foregroundColor(AppColors.textSecondary)
                                        }
                                        .padding(16)
                                        .background(AppColors.surfaceLight)
                                        .cornerRadius(12)
                                    }
                                }
                            }
                            .padding(.horizontal, 24)
                        }
                    }
                } else {
                    // Exercise Configuration
                    ScrollView {
                        VStack(alignment: .leading, spacing: 24) {
                            // Selected Exercise
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Exercise")
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundColor(AppColors.textSecondary)
                                
                                HStack {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(selectedExercise!.name)
                                            .font(.system(size: 17, weight: .semibold))
                                            .foregroundColor(AppColors.text)
                                        
                                        Text("\(selectedExercise!.category) • \(selectedExercise!.equipment)")
                                            .font(.system(size: 14))
                                            .foregroundColor(AppColors.textSecondary)
                                    }
                                    
                                    Spacer()
                                    
                                    Button(action: { selectedExercise = nil }) {
                                        Text("Change")
                                            .font(.system(size: 15))
                                            .foregroundColor(AppColors.text)
                                    }
                                }
                                .padding(16)
                                .background(AppColors.surfaceLight)
                                .cornerRadius(12)
                            }
                            
                            // Sets
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Sets")
                                    .font(.system(size: 15, weight: .semibold))
                                    .foregroundColor(AppColors.text)
                                
                                HStack {
                                    Button(action: { if sets > 1 { sets -= 1 } }) {
                                        Image(systemName: "minus.circle.fill")
                                            .font(.system(size: 32))
                                            .foregroundColor(AppColors.surfaceLight)
                                    }
                                    
                                    Spacer()
                                    
                                    Text("\(sets)")
                                        .font(.system(size: 32, weight: .bold))
                                        .foregroundColor(AppColors.text)
                                    
                                    Spacer()
                                    
                                    Button(action: { sets += 1 }) {
                                        Image(systemName: "plus.circle.fill")
                                            .font(.system(size: 32))
                                            .foregroundColor(AppColors.text)
                                    }
                                }
                                .padding(.vertical, 8)
                            }
                            
                            // Reps
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Reps")
                                    .font(.system(size: 15, weight: .semibold))
                                    .foregroundColor(AppColors.text)
                                
                                TextField("e.g., 10 or 8-12", text: $reps)
                                    .font(.system(size: 17))
                                    .foregroundColor(AppColors.text)
                                    .keyboardType(.numbersAndPunctuation)
                                    .padding()
                                    .background(AppColors.surfaceLight)
                                    .cornerRadius(12)
                            }
                            
                            // Rest Time
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Rest Time (seconds)")
                                    .font(.system(size: 15, weight: .semibold))
                                    .foregroundColor(AppColors.text)
                                
                                HStack {
                                    Button(action: { if restTime > 15 { restTime -= 15 } }) {
                                        Image(systemName: "minus.circle.fill")
                                            .font(.system(size: 32))
                                            .foregroundColor(AppColors.surfaceLight)
                                    }
                                    
                                    Spacer()
                                    
                                    Text("\(restTime)s")
                                        .font(.system(size: 32, weight: .bold))
                                        .foregroundColor(AppColors.text)
                                    
                                    Spacer()
                                    
                                    Button(action: { restTime += 15 }) {
                                        Image(systemName: "plus.circle.fill")
                                            .font(.system(size: 32))
                                            .foregroundColor(AppColors.text)
                                    }
                                }
                                .padding(.vertical, 8)
                            }
                            
                            // Notes
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Notes (optional)")
                                    .font(.system(size: 15, weight: .semibold))
                                    .foregroundColor(AppColors.text)
                                
                                TextField("e.g., Focus on form", text: $notes)
                                    .font(.system(size: 17))
                                    .foregroundColor(AppColors.text)
                                    .padding()
                                    .background(AppColors.surfaceLight)
                                    .cornerRadius(12)
                            }
                        }
                        .padding(.horizontal, 24)
                        .padding(.top, 24)
                    }
                }
            }
        }
    }
    
    private func addExercise() {
        guard let exercise = selectedExercise else { return }
        
        let newExercise = WorkoutExercise(
            exerciseId: exercise.id,
            exerciseName: exercise.name,
            sets: sets,
            reps: reps,
            restTime: restTime,
            notes: notes,
            order: workoutDay.exercises.count,
            category: exercise.category,
            equipment: exercise.equipment
        )
        
        workoutDay.exercises.append(newExercise)
        dismiss()
    }
}

#Preview {
    AddExerciseView(workoutDay: .constant(WorkoutDay(
        dayOfWeek: .monday,
        name: "Push Day",
        exercises: [],
        cardio: nil
    )))
}

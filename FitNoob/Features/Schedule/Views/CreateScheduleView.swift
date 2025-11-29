//
//  CreateScheduleView.swift
//  FitNoob
//
//  Created by Tharuka Sooriyaarachchi on 11/29/25.
//

import SwiftUI

struct CreateScheduleView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = CreateScheduleViewModel()
    @State private var selectedTrainingDays: Set<DayOfWeek> = []
    @State private var workoutDays: [WorkoutDay] = []
    @State private var showEditWorkout: Bool = false
    @State private var editingWorkoutDay: WorkoutDay?
    
    var trainingDaysList: [WorkoutDay] {
        workoutDays.filter { selectedTrainingDays.contains($0.dayOfWeek) }
            .sorted { $0.dayOfWeek.index < $1.dayOfWeek.index }
    }
    
    var defaultScheduleName: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: Date())
    }
    
    var body: some View {
        ZStack {
            AppColors.background.ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header
                HStack {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(AppColors.text)
                    }
                    
                    Spacer()
                    
                    Text("New Schedule")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(AppColors.text)
                    
                    Spacer()
                    
                    Button(action: {
                        let assignments = DayOfWeek.allCases.map { day -> (day: DayOfWeek, trainingNumber: Int?) in
                            if let index = trainingDaysList.firstIndex(where: { $0.dayOfWeek == day }) {
                                return (day, index + 1)
                            }
                            return (day, nil)
                        }
                        
                        viewModel.createScheduleFromAssignments(
                            name: defaultScheduleName,
                            assignments: assignments
                        )
                        dismiss()
                    }) {
                        Image(systemName: "checkmark")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(AppColors.text)
                            .frame(width: 44, height: 44)
                            .background(AppColors.surfaceLight)
                            .clipShape(Circle())
                    }
                    .disabled(selectedTrainingDays.isEmpty)
                    .opacity(selectedTrainingDays.isEmpty ? 0.5 : 1)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 16)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 32) {
                        // Select Training Days Section
                        VStack(alignment: .leading, spacing: 12) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Choose Your Training Days")
                                    .font(.system(size: 15, weight: .semibold))
                                    .foregroundColor(AppColors.text)
                                
                                Text("Select the days you'll be training this week")
                                    .font(.system(size: 13))
                                    .foregroundColor(AppColors.textSecondary)
                            }
                            
                            HStack(spacing: 6) {
                                ForEach(DayOfWeek.allCases, id: \.self) { day in
                                    Button(action: {
                                        if selectedTrainingDays.contains(day) {
                                            selectedTrainingDays.remove(day)
                                            workoutDays.removeAll { $0.dayOfWeek == day }
                                        } else {
                                            selectedTrainingDays.insert(day)
                                            let newDay = WorkoutDay(
                                                dayOfWeek: day,
                                                name: "Day \(selectedTrainingDays.count)",
                                                exercises: [],
                                                cardio: nil,
                                                isRestDay: false
                                            )
                                            workoutDays.append(newDay)
                                            print("✅ Created workout day: \(newDay.name) for \(day.fullName)")
                                        }
                                    }) {
                                        VStack(spacing: 4) {
                                            Text(day.shortName)
                                                .font(.system(size: 11, weight: .semibold))
                                                .foregroundColor(selectedTrainingDays.contains(day) ? AppColors.background : AppColors.textSecondary)
                                            
                                            if selectedTrainingDays.contains(day) {
                                                Text("D\(trainingDaysList.firstIndex { $0.dayOfWeek == day }.map { $0 + 1 } ?? 1)")
                                                    .font(.system(size: 10, weight: .semibold))
                                                    .foregroundColor(AppColors.background)
                                            } else {
                                                Text("REST")
                                                    .font(.system(size: 9, weight: .semibold))
                                                    .foregroundColor(AppColors.textSecondary)
                                            }
                                        }
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 56)
                                        .background(selectedTrainingDays.contains(day) ? AppColors.text : AppColors.surfaceLight)
                                        .cornerRadius(10)
                                    }
                                }
                            }
                        }
                        
                        // Configure Workouts Section
                        if !selectedTrainingDays.isEmpty {
                            VStack(alignment: .leading, spacing: 12) {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Configure Workouts")
                                        .font(.system(size: 15, weight: .semibold))
                                        .foregroundColor(AppColors.text)
                                    
                                    Text("Set up exercises for each training day")
                                        .font(.system(size: 13))
                                        .foregroundColor(AppColors.textSecondary)
                                }
                                
                                VStack(spacing: 12) {
                                    ForEach(trainingDaysList, id: \.id) { day in
                                        WorkoutDayConfigRow(
                                            trainingDay: day,
                                            action: {
                                                print("🔵 Opening edit for: \(day.name), exercises: \(day.exercises.count)")
                                                editingWorkoutDay = day
                                                showEditWorkout = true
                                            }
                                        )
                                    }
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
        .sheet(isPresented: $showEditWorkout) {
            if let day = editingWorkoutDay,
               let index = workoutDays.firstIndex(where: { $0.id == day.id }) {
                EditWorkoutDayView(workoutDay: $workoutDays[index])
                    .onDisappear {
                        print("🟢 Sheet dismissed, exercises: \(workoutDays[index].exercises.count)")
                    }
            }
        }
        .onChange(of: showEditWorkout) { newValue in
            if !newValue {
                // Sheet was dismissed
                print("📊 Current workout days:")
                for day in workoutDays {
                    print("  - \(day.name): \(day.exercises.count) exercises")
                }
            }
        }
    }
}

// MARK: - Workout Day Config Row
struct WorkoutDayConfigRow: View {
    let trainingDay: WorkoutDay
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text(trainingDay.name)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(AppColors.text)
                    
                    Text(trainingDay.dayOfWeek.fullName)
                        .font(.system(size: 14))
                        .foregroundColor(AppColors.textSecondary)
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 4) {
                    Text("\(trainingDay.exercises.count)")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(AppColors.text)
                    
                    Text("exercises")
                        .font(.system(size: 12))
                        .foregroundColor(AppColors.textSecondary)
                }
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(AppColors.textSecondary)
            }
            .padding(16)
            .background(AppColors.surfaceLight)
            .cornerRadius(12)
        }
    }
}

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
    @State private var scheduleName: String = ""
    @State private var showEditWorkout: Bool = false
    @State private var selectedDayIndex: Int?
    
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
                    
                    Text("Create Schedule")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(AppColors.text)
                    
                    Spacer()
                    
                    
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 16)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 32) {
                        // Schedule Name
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Schedule Name")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundColor(AppColors.text)
                            
                            TextField("My Workout Plan", text: $scheduleName)
                                .font(.system(size: 17))
                                .foregroundColor(AppColors.text)
                                .padding()
                                .background(AppColors.surfaceLight)
                                .cornerRadius(12)
                        }
                        
                        // Day Selection
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Select Training Days")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundColor(AppColors.text)
                            
                            HStack(spacing: 8) {
                                ForEach(Array(DayOfWeek.allCases.enumerated()), id: \.element) { index, day in
                                    DayButton(
                                        day: day,
                                        isSelected: viewModel.selectedDays.contains(day)
                                    ) {
                                        viewModel.toggleDay(day)
                                    }
                                }
                            }
                        }
                        
                        // Workout Days List
                        if !viewModel.workoutDays.isEmpty {
                            VStack(alignment: .leading, spacing: 16) {
                                Text("Workout Days")
                                    .font(.system(size: 15, weight: .semibold))
                                    .foregroundColor(AppColors.text)
                                
                                VStack(spacing: 12) {
                                    ForEach(Array(viewModel.workoutDays.enumerated()), id: \.element.id) { index, day in
                                        WorkoutDayRow(workoutDay: day) {
                                            selectedDayIndex = index
                                            showEditWorkout = true
                                        }
                                    }
                                }
                            }
                        }
                        
                        Spacer(minLength: 100)
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 24)
                }
                
                // Save Button
                Button(action: {
                    viewModel.saveSchedule(name: scheduleName)
                    dismiss()
                }) {
                    Text("Save Schedule")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(AppColors.background)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(AppColors.text)
                        .cornerRadius(12)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 24)
                .disabled(viewModel.workoutDays.isEmpty)
                .opacity(viewModel.workoutDays.isEmpty ? 0.5 : 1)
            }
        }
        .sheet(isPresented: $showEditWorkout) {
            if let index = selectedDayIndex {
                EditWorkoutDayView(workoutDay: $viewModel.workoutDays[index])
            }
        }
    }
}

// MARK: - Day Button
struct DayButton: View {
    let day: DayOfWeek
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Text(day.shortName)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(isSelected ? AppColors.background : AppColors.text)
                
                Circle()
                    .fill(isSelected ? AppColors.text : Color.clear)
                    .frame(width: 6, height: 6)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .background(isSelected ? AppColors.text : AppColors.surfaceLight)
            .cornerRadius(12)
        }
    }
}

// MARK: - Workout Day Row
struct WorkoutDayRow: View {
    let workoutDay: WorkoutDay
    let onEdit: () -> Void
    
    var body: some View {
        Button(action: onEdit) {
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text(workoutDay.dayOfWeek.fullName)
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(AppColors.text)
                    
                    Text(workoutDay.name.isEmpty ? "Tap to add exercises" : "\(workoutDay.exercises.count) exercises")
                        .font(.system(size: 14))
                        .foregroundColor(AppColors.textSecondary)
                }
                
                Spacer()
                
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


//
//  ManageWorkoutSheet.swift
//  FitNoob

import SwiftUI

struct ManageWorkoutSheet: View {
    @Environment(\.dismiss) var dismiss
    @State private var showCreateSchedule = false
    @State private var showScheduleHistory = false
    @State private var showRestDays = false
    @State private var showInjuries = false
    @State private var showProgress = false
    @State private var showSettings = false
    @State private var showResetConfirmation = false

    var body: some View {
        ZStack {
            AppColors.background.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0) {
                // Header
                HStack {
                    Text("Workout")
                        .font(.system(size: 34, weight: .bold))
                        .foregroundColor(AppColors.text)
                    
                    Spacer()
                    
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(AppColors.text)
                            .frame(width: 44, height: 44)
                            .background(AppColors.surfaceLight)
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 16)
                .padding(.bottom, 24)
                
                // Menu Options
                ScrollView {
                    VStack(spacing: 0) {
                        // New Schedule
                        MenuButton(
                            icon: "plus.circle.fill",
                            title: "New Schedule",
                            subtitle: "Create a new workout plan"
                        ) {
                            showCreateSchedule = true
                        }
                        
                        Divider()
                            .background(AppColors.surfaceLight)
                            .padding(.horizontal, 24)
                        
                        // Schedule History
                        MenuButton(
                            icon: "calendar.badge.clock",
                            title: "Schedule History",
                            subtitle: "View your past workout plans"
                        ) {
                            showScheduleHistory = true
                        }
                        
                        Divider()
                            .background(AppColors.surfaceLight)
                            .padding(.horizontal, 24)
                        
                        // Rest Days
                        MenuButton(
                            icon: "moon.zzz.fill",
                            title: "Rest Days",
                            subtitle: "Set your recovery days"
                        ) {
                            showRestDays = true
                        }
                        
                        Divider()
                            .background(AppColors.surfaceLight)
                            .padding(.horizontal, 24)
                        
                        // Record Injuries
                        MenuButton(
                            icon: "bandage.fill",
                            title: "Record Injuries",
                            subtitle: "Track and manage injuries"
                        ) {
                            showInjuries = true
                        }
                        
                        Divider()
                            .background(AppColors.surfaceLight)
                            .padding(.horizontal, 24)
                        
                        // Progress History
                        MenuButton(
                            icon: "chart.line.uptrend.xyaxis",
                            title: "Progress History",
                            subtitle: "View your workout stats"
                        ) {
                            showProgress = true
                        }
                        
                        Divider()
                            .background(AppColors.surfaceLight)
                            .padding(.horizontal, 24)
                        
                        // Settings
                        MenuButton(
                            icon: "gearshape.fill",
                            title: "Workout Settings",
                            subtitle: "Customize your preferences"
                        ) {
                            showSettings = true
                        }
                        
                        Divider()
                            .background(AppColors.surfaceLight)
                            .padding(.horizontal, 24)
                        
                        // Reset Progress
                        MenuButton(
                            icon: "arrow.counterclockwise",
                            title: "Reset Progress",
                            subtitle: "Start fresh with a new plan"
                        ) {
                            showResetConfirmation = true
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
        }
        // Sheet presentations
        .fullScreenCover(isPresented: $showCreateSchedule) {
            CreateScheduleView()
        }
        .sheet(isPresented: $showScheduleHistory) {
            PastSchedulesView()
        }
        .sheet(isPresented: $showRestDays) {
            // RestDaysView()
            Text("Rest Days - Coming Soon")
        }
        .sheet(isPresented: $showInjuries) {
            // InjuriesTrackingView()
            Text("Injuries Tracking - Coming Soon")
        }
        .sheet(isPresented: $showProgress) {
            // ProgressHistoryView()
            Text("Progress History - Coming Soon")
        }
        .sheet(isPresented: $showSettings) {
            // WorkoutSettingsView()
            Text("Workout Settings - Coming Soon")
        }
        .sheet(isPresented: $showResetConfirmation) {
            // ResetProgressView()
            Text("Reset Progress - Coming Soon")
        }
    }
}

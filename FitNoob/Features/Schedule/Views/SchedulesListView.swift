//
//  SchedulesListView.swift
//  FitNoob
//
//  Created by Tharuka Sooriyaarachchi on 11/29/25.
//

import SwiftUI

struct SchedulesListView: View {
    @StateObject private var viewModel = CreateScheduleViewModel()
    @State private var showCreateSchedule = false
    @State private var showPastSchedules = false
    
    var body: some View {
        ZStack {
            AppColors.background.ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header
                HStack {
                    Text("Schedules")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(AppColors.text)
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 16)
                
                ScrollView {
                    VStack(spacing: 20) {
                        // Create New Schedule Button
                        Button(action: { showCreateSchedule = true }) {
                            VStack(spacing: 12) {
                                Image(systemName: "plus.circle.fill")
                                    .font(.system(size: 40))
                                    .foregroundColor(AppColors.text)
                                
                                VStack(spacing: 4) {
                                    Text("Create New Schedule")
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundColor(AppColors.text)
                                    
                                    Text("Build your training plan")
                                        .font(.system(size: 13))
                                        .foregroundColor(AppColors.textSecondary)
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding(24)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(AppColors.text, lineWidth: 2)
                            )
                        }
                        
                        // View Past Schedules Button
                        Button(action: { showPastSchedules = true }) {
                            VStack(spacing: 12) {
                                Image(systemName: "clock.fill")
                                    .font(.system(size: 40))
                                    .foregroundColor(AppColors.textSecondary)
                                
                                VStack(spacing: 4) {
                                    Text("Past Schedules")
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundColor(AppColors.text)
                                    
                                    Text("View your history")
                                        .font(.system(size: 13))
                                        .foregroundColor(AppColors.textSecondary)
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding(24)
                            .background(AppColors.surfaceLight)
                            .cornerRadius(16)
                        }
                        
                        Spacer(minLength: 40)
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 32)
                }
            }
        }
        .sheet(isPresented: $showCreateSchedule) {
            CreateScheduleView()
        }
        .sheet(isPresented: $showPastSchedules) {
            PastSchedulesView()
        }
    }
}

// MARK: - Past Schedules View
struct PastSchedulesView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = CreateScheduleViewModel()
    
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
                    
                    Text("Past Schedules")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(AppColors.text)
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 16)
                
                ScrollView {
                    if viewModel.schedules.isEmpty {
                        VStack(spacing: 16) {
                            Image(systemName: "calendar.badge.clock")
                                .font(.system(size: 48))
                                .foregroundColor(AppColors.textSecondary)
                            
                            Text("No schedules yet")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(AppColors.text)
                            
                            Text("Create your first schedule to get started")
                                .font(.system(size: 14))
                                .foregroundColor(AppColors.textSecondary)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(40)
                    } else {
                        VStack(spacing: 12) {
                            ForEach(viewModel.schedules) { schedule in
                                ScheduleCard(schedule: schedule)
                            }
                        }
                        .padding(.horizontal, 24)
                        .padding(.top, 24)
                    }
                    
                    Spacer(minLength: 40)
                }
            }
        }
    }
}

// MARK: - Schedule Card
struct ScheduleCard: View {
    let schedule: Schedule
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d"
        return formatter.string(from: schedule.createdDate)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(schedule.name)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(AppColors.text)
                    
                    Text("\(schedule.totalWorkouts) training days")
                        .font(.system(size: 13))
                        .foregroundColor(AppColors.textSecondary)
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 4) {
                    Text(formattedDate)
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(AppColors.textSecondary)
                    
                    if schedule.isActive {
                        Text("Active")
                            .font(.system(size: 11, weight: .semibold))
                            .foregroundColor(.green)
                    }
                }
            }
            
            HStack(spacing: 6) {
                ForEach(schedule.trainingDays, id: \.self) { day in
                    Text(day.shortName)
                        .font(.system(size: 11, weight: .semibold))
                        .foregroundColor(AppColors.background)
                        .frame(width: 28, height: 28)
                        .background(AppColors.text)
                        .clipShape(Circle())
                }
                
                Spacer()
            }
        }
        .padding(16)
        .background(AppColors.surfaceLight)
        .cornerRadius(12)
    }
}

#Preview {
    SchedulesListView()
}

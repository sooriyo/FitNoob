//
//  ManageWorkoutSheet.swift
//  FitNoob
//
//  Created by Tharuka Sooriyaarachchi on 11/29/25.
//

import SwiftUI

struct ManageWorkoutSheet: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            AppColors.background.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0) {
                // Header
                HStack {
                    Text("Manage Workout")
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
                        // Edit Schedule
                        MenuButton(
                            icon: "calendar.badge.clock",
                            title: "Edit Schedule",
                            subtitle: "Modify your workout plan"
                        ) {
                            // Navigate to edit schedule
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
                            // Navigate to rest days
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
                            // Navigate to injuries tracking
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
                            // Navigate to progress history
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
                            // Navigate to settings
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
                            // Show reset confirmation
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
        }
    }
}

// MARK: - Menu Button Component
struct MenuButton: View {
    let icon: String
    let title: String
    let subtitle: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundColor(AppColors.text)
                    .frame(width: 40, height: 40)
                    .background(AppColors.surfaceLight)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(AppColors.text)
                    Text(subtitle)
                        .font(.system(size: 14))
                        .foregroundColor(AppColors.textSecondary)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(AppColors.textSecondary)
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 16)
            .contentShape(Rectangle())
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    ManageWorkoutSheet()
}

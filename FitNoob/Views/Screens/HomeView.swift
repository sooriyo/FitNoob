//
//  HomeView.swift
//  FitNoob
//
//  Created by Tharuka Sooriyaarachchi on 11/29/25.
//


import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = ScheduleViewModel()
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            if viewModel.isWorkoutStarted, let session = viewModel.getWorkout(for: viewModel.selectedDay) {
                ActiveWorkoutView(viewModel: viewModel, session: session)
                    .transition(.move(edge: .bottom))
            } else {
                VStack(spacing: 0) {
                    // Header
                    VStack(alignment: .leading, spacing: 8) {
                        Text("FitNoob")
                            .font(.system(size: 36, weight: .bold))
                            .tracking(0.5)
                        Text("Your gym companion")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 24)
                    .padding(.top, 24)
                    .padding(.bottom, 16)
                    
                    // Day Selector
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(AppConstants.days, id: \.self) { day in
                                DayButton(
                                    day: day,
                                    isSelected: viewModel.selectedDay == day,
                                    action: { viewModel.selectedDay = day }
                                )
                            }
                        }
                        .padding(.horizontal, 24)
                    }
                    .padding(.vertical, 16)
                    
                    // Content
                    if let session = viewModel.getWorkout(for: viewModel.selectedDay) {
                        let progress = viewModel.getCompletionProgress(for: session)
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack(spacing: 24) {
                                WorkoutHeaderView(session: session, progress: progress)
                                    .padding(.horizontal, 24)
                                
                                // Start Button
                                StartWorkoutButton(isStarted: viewModel.isWorkoutStarted) {
                                    withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                                        viewModel.isWorkoutStarted.toggle()
                                    }
                                }
                                .padding(.horizontal, 24)
                                
                                // Stats Cards
                                HStack(spacing: 12) {
                                    StatCard(
                                        icon: "flame.fill",
                                        title: "Calories",
                                        value: "\(session.estimatedCalories)",
                                        color: .orange
                                    )
                                    
                                    StatCard(
                                        icon: "figure.walk",
                                        title: "Steps",
                                        value: "\(session.estimatedSteps)",
                                        color: .blue
                                    )
                                }
                                .padding(.horizontal, 24)
                                
                                Spacer().frame(height: 32)
                            }
                            .padding(.top, 8)
                        }
                    }
                }
            }
        }
        .animation(.spring(response: 0.4, dampingFraction: 0.8), value: viewModel.isWorkoutStarted)
    }
}
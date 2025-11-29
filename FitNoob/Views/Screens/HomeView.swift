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
                    // Content
                    if let session = viewModel.getWorkout(for: viewModel.selectedDay) {
                        let progress = viewModel.getCompletionProgress(for: session)
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack(spacing: 24) {
                                // Swipable Cards
                                SwipableCardsView(viewModel: viewModel)
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
                                        icon: "figure.walk",
                                        title: "Steps",
                                        value: "\(session.estimatedSteps)",
                                        color: .white
                                    )
                                    StatCard(
                                        icon: "flame.fill",
                                        title: "Calories",
                                        value: "\(session.estimatedCalories)",
                                        color: .white
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

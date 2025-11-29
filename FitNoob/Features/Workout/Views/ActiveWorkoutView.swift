//
//  ActiveWorkoutView.swift
//  FitNoob
//
//  Created by Tharuka Sooriyaarachchi on 11/29/25.
//


import SwiftUI

struct ActiveWorkoutView: View {
    @ObservedObject var viewModel: ScheduleViewModel
    let session: WorkoutSession
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header
                HStack {
                    Button(action: {
                        viewModel.isWorkoutStarted = false
                    }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(width: 44, height: 44)
                            .background(Color.white.opacity(0.1))
                            .clipShape(Circle())
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 2) {
                        Text(session.title)
                            .font(.system(size: 16, weight: .bold))
                        Text("\(viewModel.completedExercises.count)/\(session.workingSets.count) completed")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        // Timer action
                    }) {
                        Image(systemName: "timer")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(width: 44, height: 44)
                            .background(Color.white.opacity(0.1))
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 16)
                .padding(.bottom, 12)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20) {
                        // Warm-up Section
                        WarmUpCard(items: session.warmUp)
                            .padding(.horizontal, 24)
                        
                        // Exercises
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Text("Exercises")
                                    .font(.system(size: 18, weight: .semibold))
                                Spacer()
                                Text("\(session.workingSets.count) total")
                                    .font(.system(size: 12, weight: .medium))
                                    .foregroundColor(.gray)
                            }
                            
                            VStack(spacing: 12) {
//                                ForEach(session.workingSets) { exercise in
//                                    EnhancedExerciseCard(
//                                        exercise: exercise,
//                                        isCompleted: viewModel.isExerciseCompleted(exercise.id)
//                                    ) {
//                                        viewModel.toggleExerciseCompletion(exercise.id)
//                                    }
//                                }
                            }
                        }
                        .padding(.horizontal, 24)
                        
                        // Finisher
                        if let finisher = session.finisher {
                            VStack(alignment: .leading, spacing: 12) {
                                HStack {
                                    Image(systemName: "bolt.fill")
                                        .font(.system(size: 16))
                                        .foregroundColor(.yellow)
                                    Text("Finisher")
                                        .font(.system(size: 18, weight: .semibold))
                                    Spacer()
                                    Text("Optional")
                                        .font(.system(size: 12, weight: .medium))
                                        .foregroundColor(.gray)
                                }
                                
                                Text(finisher)
                                    .font(.system(size: 14, weight: .regular))
                                    .foregroundColor(.white)
                                    .padding(16)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(Color.yellow.opacity(0.1))
                                    .cornerRadius(12)
                            }
                            .padding(.horizontal, 24)
                        }
                        
                        Spacer().frame(height: 32)
                    }
                    .padding(.top, 16)
                }
            }
        }
    }
}

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = ScheduleViewModel()
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
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
                            WorkoutHeaderView(session: session)
                                .padding(.horizontal, 24)
                            
                            // Progress Section
                            VStack(alignment: .leading, spacing: 12) {
                                HStack {
                                    Text("Progress")
                                        .font(.system(size: 18, weight: .semibold))
                                    Spacer()
                                    Text("\(Int(progress * 100))%")
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundColor(.green)
                                }
                                ProgressBar(progress: progress)
                                Text("\(viewModel.completedExercises.count) of \(session.workingSets.count) exercises completed")
                                    .font(.system(size: 12, weight: .regular))
                                    .foregroundColor(.gray)
                            }
                            .padding(.horizontal, 24)
                            
                            // Start Button
                            StartWorkoutButton(isStarted: viewModel.isWorkoutStarted) {
                                viewModel.isWorkoutStarted.toggle()
                            }
                            .padding(.horizontal, 24)
                            
                            // Warm-up Section
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Warm-up")
                                    .font(.system(size: 18, weight: .semibold))
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    ForEach(session.warmUp, id: \.self) { item in
                                        HStack(spacing: 12) {
                                            Circle()
                                                .fill(Color.white.opacity(0.6))
                                                .frame(width: 6, height: 6)
                                            Text(item)
                                                .font(.system(size: 14, weight: .regular))
                                                .foregroundColor(.gray)
                                        }
                                    }
                                }
                                .padding(16)
                                .background(Color(white: 0.08))
                                .cornerRadius(12)
                            }
                            .padding(.horizontal, 24)
                            
                            // Working Sets
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Exercises")
                                    .font(.system(size: 18, weight: .semibold))
                                
                                VStack(spacing: 12) {
                                    ForEach(session.workingSets) { exercise in
                                        EnhancedExerciseCard(
                                            exercise: exercise,
                                            isCompleted: viewModel.isExerciseCompleted(exercise.id)
                                        ) {
                                            viewModel.toggleExerciseCompletion(exercise.id)
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal, 24)
                            
                            // Finisher
                            if let finisher = session.finisher {
                                VStack(alignment: .leading, spacing: 12) {
                                    Text("Finisher (Optional)")
                                        .font(.system(size: 18, weight: .semibold))
                                    
                                    HStack(spacing: 12) {
                                        Circle()
                                            .fill(Color.white.opacity(0.6))
                                            .frame(width: 6, height: 6)
                                        Text(finisher)
                                            .font(.system(size: 14, weight: .regular))
                                            .foregroundColor(.gray)
                                    }
                                    .padding(16)
                                    .background(Color(white: 0.08))
                                    .cornerRadius(12)
                                }
                                .padding(.horizontal, 24)
                            }
                            
                            Spacer().frame(height: 32)
                        }
                        .padding(.top, 8)
                    }
                }
            }
        }
    }
}

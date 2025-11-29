//
//  SwipableCardsView.swift
//  FitNoob
//
//  Created by Tharuka Sooriyaarachchi on 11/29/25.
//

import SwiftUI

struct SwipableCardsView: View {
    @ObservedObject var viewModel: ScheduleViewModel
    @State private var dragOffset: CGFloat = 0
    @State private var currentIndex: Int = 0
    @State private var isDragging: Bool = false
    @State private var cardRotation: Double = 0
    @State private var cardScale: CGFloat = 1.0
    @State private var cardOpacity: Double = 1.0
    
    var body: some View {
        ZStack {
            // Background indicator cards (simple placeholders)
            if currentIndex < AppConstants.days.count - 2 {
                BackgroundCardPlaceholder()
                    .scaleEffect(isDragging ? 0.92 : 0.90)
                    .opacity(isDragging ? 0.4 : 0.3)
                    .offset(y: isDragging ? 12 : 16)
                    .rotationEffect(.degrees(isDragging ? -2 : -3))
            }
            
            if currentIndex < AppConstants.days.count - 1 {
                BackgroundCardPlaceholder()
                    .scaleEffect(isDragging ? 0.97 : 0.95)
                    .opacity(isDragging ? 0.6 : 0.5)
                    .offset(y: isDragging ? 4 : 8)
                    .rotationEffect(.degrees(isDragging ? 1 : 2))
            }
            
            // Current card (front)
            if let currentSession = viewModel.getWorkout(for: AppConstants.days[currentIndex]) {
                WorkoutDayCard(
                    session: currentSession,
                    progress: viewModel.getCompletionProgress(for: currentSession),
                    isSelected: true,
                    scale: 1.0,
                    opacity: cardOpacity,
                    offset: dragOffset
                )
                .scaleEffect(cardScale)
                .rotation3DEffect(
                    .degrees(cardRotation),
                    axis: (x: 1, y: 0, z: 0),
                    anchor: .bottom,
                    anchorZ: 0,
                    perspective: 0.3
                )
                .id(currentSession.id)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            if !isDragging {
                                isDragging = true
                            }
                            withAnimation(.interactiveSpring(response: 0.22, dampingFraction: 0.88, blendDuration: 0.3)) {
                                dragOffset = value.translation.width
                                // Subtle tilt based on drag
                                let tiltAmount = value.translation.width / 35
                                cardRotation = max(-2.5, min(2.5, -tiltAmount))
                            }
                        }
                        .onEnded { value in
                            let threshold: CGFloat = 80
                            let velocity = value.predictedEndTranslation.width - value.translation.width
                            
                            if (value.translation.width > threshold || velocity > 500) && currentIndex > 0 {
                                // Swipe right - card flips away and new one comes
                                performCardTransition(direction: .previous)
                            } else if (value.translation.width < -threshold || velocity < -500) && currentIndex < AppConstants.days.count - 1 {
                                // Swipe left - card flips away and new one comes
                                performCardTransition(direction: .next)
                            } else {
                                // Snap back with smooth bounce
                                isDragging = false
                                withAnimation(.spring(response: 0.4, dampingFraction: 0.72, blendDuration: 0.25)) {
                                    dragOffset = 0
                                    cardRotation = 0
                                }
                            }
                        }
                )
                .zIndex(10)
            }
        }
        .animation(.spring(response: 0.45, dampingFraction: 0.82, blendDuration: 0.3), value: isDragging)
        .frame(height: 240)
        .onAppear {
            if let index = AppConstants.days.firstIndex(of: viewModel.selectedDay) {
                currentIndex = index
            }
        }
    }
    
    private func performCardTransition(direction: SwipeDirection) {
        isDragging = false
        
        // Phase 1: Card flips away smoothly (0.25s)
        withAnimation(.spring(response: 0.32, dampingFraction: 0.78, blendDuration: 0.2)) {
            cardRotation = -20
            cardScale = 0.90
            cardOpacity = 0.5
            dragOffset = direction == .next ? -60 : 60
        }
        
        // Phase 2: Switch card at peak of animation (0.25s)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            // Update index
            if direction == .next {
                currentIndex += 1
            } else {
                currentIndex -= 1
            }
            viewModel.selectedDay = AppConstants.days[currentIndex]
            
            // Set initial state for new card (coming from behind)
            cardRotation = 20
            cardScale = 0.86
            cardOpacity = 0.3
            dragOffset = 0
            
            // Phase 3: New card animates into place smoothly (0.45s)
            withAnimation(.spring(response: 0.48, dampingFraction: 0.76, blendDuration: 0.3)) {
                cardRotation = 0
                cardScale = 1.0
                cardOpacity = 1.0
            }
        }
    }
    
    enum SwipeDirection {
        case next, previous
    }
}

// Simple placeholder card for background
struct BackgroundCardPlaceholder: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 24)
            .fill(Color.black)
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color.white.opacity(0.05))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(Color.white.opacity(0.2), lineWidth: 1)
            )
            .frame(height: 240)
            .padding(.horizontal, 24)
    }
}

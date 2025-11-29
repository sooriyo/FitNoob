//
//  AddCardioView.swift
//  FitNoob
//
//  Created by Tharuka Sooriyaarachchi on 11/29/25.
//


//
//  AddCardioView.swift
//  FitNoob
//
//  Created by Tharuka Sooriyaarachchi on 11/29/25.
//

import SwiftUI

struct AddCardioView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var workoutDay: WorkoutDay
    
    @State private var cardioType: String = "Running"
    @State private var useDuration: Bool = true
    @State private var duration: Int = 20
    @State private var distance: Double = 5.0
    @State private var intensity: String = "Medium"
    
    let cardioTypes = ["Running", "Cycling", "Swimming", "Rowing", "Walking", "Jump Rope", "Stair Climbing", "Elliptical"]
    let intensities = ["Low", "Medium", "High"]
    
    var body: some View {
        ZStack {
            AppColors.background.ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header
                HStack {
                    Button(action: { dismiss() }) {
                        Text("Cancel")
                            .font(.system(size: 17))
                            .foregroundColor(AppColors.text)
                    }
                    
                    Spacer()
                    
                    Text("Add Cardio")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(AppColors.text)
                    
                    Spacer()
                    
                    Button(action: addCardio) {
                        Text("Add")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(AppColors.text)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 16)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 32) {
                        // Cardio Type
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Type")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundColor(AppColors.text)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 8) {
                                    ForEach(cardioTypes, id: \.self) { type in
                                        Button(action: {
                                            cardioType = type
                                        }) {
                                            Text(type)
                                                .font(.system(size: 15, weight: .medium))
                                                .foregroundColor(cardioType == type ? AppColors.background : AppColors.text)
                                                .padding(.horizontal, 16)
                                                .padding(.vertical, 10)
                                                .background(cardioType == type ? AppColors.text : AppColors.surfaceLight)
                                                .cornerRadius(20)
                                        }
                                    }
                                }
                                .padding(.horizontal, 24)
                            }
                            .padding(.horizontal, -24)
                        }
                        
                        // Duration or Distance Toggle
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Measure by")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundColor(AppColors.text)
                            
                            HStack(spacing: 12) {
                                Button(action: { useDuration = true }) {
                                    Text("Duration")
                                        .font(.system(size: 15, weight: .medium))
                                        .foregroundColor(useDuration ? AppColors.background : AppColors.text)
                                        .frame(maxWidth: .infinity)
                                        .padding(.vertical, 12)
                                        .background(useDuration ? AppColors.text : AppColors.surfaceLight)
                                        .cornerRadius(10)
                                }
                                
                                Button(action: { useDuration = false }) {
                                    Text("Distance")
                                        .font(.system(size: 15, weight: .medium))
                                        .foregroundColor(!useDuration ? AppColors.background : AppColors.text)
                                        .frame(maxWidth: .infinity)
                                        .padding(.vertical, 12)
                                        .background(!useDuration ? AppColors.text : AppColors.surfaceLight)
                                        .cornerRadius(10)
                                }
                            }
                        }
                        
                        if useDuration {
                            // Duration
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Duration (minutes)")
                                    .font(.system(size: 15, weight: .semibold))
                                    .foregroundColor(AppColors.text)
                                
                                HStack {
                                    Button(action: { if duration > 5 { duration -= 5 } }) {
                                        Image(systemName: "minus.circle.fill")
                                            .font(.system(size: 32))
                                            .foregroundColor(AppColors.surfaceLight)
                                    }
                                    
                                    Spacer()
                                    
                                    Text("\(duration) min")
                                        .font(.system(size: 32, weight: .bold))
                                        .foregroundColor(AppColors.text)
                                    
                                    Spacer()
                                    
                                    Button(action: { duration += 5 }) {
                                        Image(systemName: "plus.circle.fill")
                                            .font(.system(size: 32))
                                            .foregroundColor(AppColors.text)
                                    }
                                }
                                .padding(.vertical, 8)
                            }
                        } else {
                            // Distance
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Distance (km)")
                                    .font(.system(size: 15, weight: .semibold))
                                    .foregroundColor(AppColors.text)
                                
                                HStack {
                                    Button(action: { if distance > 0.5 { distance -= 0.5 } }) {
                                        Image(systemName: "minus.circle.fill")
                                            .font(.system(size: 32))
                                            .foregroundColor(AppColors.surfaceLight)
                                    }
                                    
                                    Spacer()
                                    
                                    Text(String(format: "%.1f km", distance))
                                        .font(.system(size: 32, weight: .bold))
                                        .foregroundColor(AppColors.text)
                                    
                                    Spacer()
                                    
                                    Button(action: { distance += 0.5 }) {
                                        Image(systemName: "plus.circle.fill")
                                            .font(.system(size: 32))
                                            .foregroundColor(AppColors.text)
                                    }
                                }
                                .padding(.vertical, 8)
                            }
                        }
                        
                        // Intensity
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Intensity")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundColor(AppColors.text)
                            
                            HStack(spacing: 12) {
                                ForEach(intensities, id: \.self) { level in
                                    Button(action: { intensity = level }) {
                                        Text(level)
                                            .font(.system(size: 15, weight: .medium))
                                            .foregroundColor(intensity == level ? AppColors.background : AppColors.text)
                                            .frame(maxWidth: .infinity)
                                            .padding(.vertical, 12)
                                            .background(intensity == level ? AppColors.text : AppColors.surfaceLight)
                                            .cornerRadius(10)
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
    }
    
    private func addCardio() {
        let cardio = CardioSession(
            type: cardioType,
            duration: useDuration ? duration : nil,
            distance: useDuration ? nil : distance,
            intensity: intensity
        )
        
        workoutDay.cardio = cardio
        dismiss()
    }
}

#Preview {
    AddCardioView(workoutDay: .constant(WorkoutDay(
        dayOfWeek: .monday,
        name: "Push Day",
        exercises: [],
        cardio: nil
    )))
}
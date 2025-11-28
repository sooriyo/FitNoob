//
//  StartWorkoutButton.swift
//  FitNoob
//
//  Created by Tharuka Sooriyaarachchi on 11/28/25.
//

import SwiftUI

struct StartWorkoutButton: View {
    let isStarted: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: isStarted ? "xmark" : "play.fill")
                    .font(.system(size: 16, weight: .bold))
                Text(isStarted ? "End Workout" : "Start Workout")
                    .font(.system(size: 16, weight: .bold))
            }
            .foregroundColor(.black)
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .background(Color.white)
            .cornerRadius(16)
        }
    }
}

//
//  WorkoutHeaderView.swift
//  FitNoob
//
//  Created by Tharuka Sooriyaarachchi on 11/28/25.
//

import SwiftUI

struct WorkoutHeaderView: View {
    let session: WorkoutSession
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(session.title)
                        .font(.system(size: 28, weight: .bold))
                    Text(session.date)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(.gray)
                }
                Spacer()
                Image(systemName: "calendar")
                    .font(.system(size: 20))
                    .foregroundColor(.white.opacity(0.6))
            }
            
            Text(session.description)
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.gray)
                .lineLimit(3)
            
            HStack(spacing: 8) {
                Image(systemName: "clock.fill")
                    .font(.system(size: 12))
                    .foregroundColor(.white.opacity(0.6))
                Text(session.timeRange)
                    .font(.system(size: 13, weight: .medium))
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(Color.white.opacity(0.08))
            .cornerRadius(8)
        }
        .padding(20)
        .background(Color(white: 0.08))
        .cornerRadius(16)
    }
}

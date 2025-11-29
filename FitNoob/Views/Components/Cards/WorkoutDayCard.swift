//
//  WorkoutDayCard.swift
//  FitNoob
//
//  Created by Tharuka Sooriyaarachchi on 11/29/25.
//


import SwiftUI

struct WorkoutDayCard: View {
    let session: WorkoutSession
    let progress: Double
    let isSelected: Bool
    let scale: CGFloat
    let opacity: Double
    let offset: CGFloat
    
    var body: some View {
        VStack(spacing: 16) {
            headerSection
            descriptionSection
            Spacer()
            timeSection
        }
        .padding(24)
        .frame(maxWidth: .infinity)
        .background(cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .shadow(color: isSelected ? Color.gray.opacity(0.2) : Color.clear, radius: 20, x: 0, y: 10)
        .scaleEffect(scale)
        .opacity(opacity)
        .offset(x: offset)
    }
    
    // MARK: - Header Section
    private var headerSection: some View {
        HStack {
            Text(session.day)
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.white)
            
            Spacer()
            
            if progress > 0 {
                progressBadge
            }
        }
    }
    
    private var progressBadge: some View {
        HStack(spacing: 4) {
            Image(systemName: "checkmark.circle.fill")
                .foregroundColor(.green)
            Text("\(Int(progress * 100))%")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.green)
        }
    }
    
    // MARK: - Description Section
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 8) {
//            Text(session.title)
//                .font(.system(size: 20, weight: .semibold))
//                .foregroundColor(.white)
            
            Text(session.description)
                .font(.system(size: 15, weight: .regular))
                .foregroundColor(.white.opacity(0.7))
                .lineLimit(nil)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    // MARK: - Date Section
    private var timeSection: some View {
        Text(session.date)
            .font(.system(size: 15, weight: .medium))
            .foregroundColor(.white.opacity(0.8))
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.white.opacity(0.1))
            )
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    // MARK: - Card Background
    private var cardBackground: some View {
        RoundedRectangle(cornerRadius: 24)
            .fill(Color.black)
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color.white.opacity(0.1))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(Color.white.opacity(isSelected ? 0.3 : 0.15), lineWidth: 1)
            )
    }
}

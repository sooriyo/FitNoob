//
//  WarmUpCard.swift
//  FitNoob
//
//  Created by Tharuka Sooriyaarachchi on 11/29/25.
//


import SwiftUI

struct WarmUpCard: View {
    let items: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "flame.fill")
                    .font(.system(size: 16))
                    .foregroundColor(.orange)
                Text("Warm-up")
                    .font(.system(size: 18, weight: .semibold))
                Spacer()
                Text("10-12 min")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.gray)
            }
            
            VStack(spacing: 12) {
                ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                    HStack(spacing: 12) {
                        ZStack {
                            Circle()
                                .fill(Color.orange.opacity(0.2))
                                .frame(width: 32, height: 32)
                            
                            Text("\(index + 1)")
                                .font(.system(size: 13, weight: .bold))
                                .foregroundColor(.orange)
                        }
                        
                        Text(item)
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.white)
                        
                        Spacer()
                    }
                }
            }
        }
        .padding(20)
        .background(Color(white: 0.08))
        .cornerRadius(16)
    }
}
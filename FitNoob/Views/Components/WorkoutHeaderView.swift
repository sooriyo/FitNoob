import SwiftUI

struct WorkoutHeaderView: View {
    let session: WorkoutSession
    let progress: Double
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(session.title.isEmpty ? session.day : session.day)
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(AppColors.text)
                }
                Spacer()
                
                // Circular Progress
                ZStack {
                    Circle()
                        .stroke(Color.white.opacity(0.1), lineWidth: 4)
                        .frame(width: 50, height: 50)
                    
                    Circle()
                        .trim(from: 0, to: progress)
                        .stroke(Color.green, style: StrokeStyle(lineWidth: 4, lineCap: .round))
                        .frame(width: 50, height: 50)
                        .rotationEffect(.degrees(-90))
                    
                    Text("\(Int(progress * 100))%")
                        .font(.system(size: 11, weight: .bold))
                        .foregroundColor(.green)
                }
            }
            
            Text(session.description)
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.gray)
                .lineLimit(3)
            
            HStack(spacing: 8) {
                Image(systemName: "day.fill")
                    .font(.system(size: 12))
                    .foregroundColor(.white.opacity(0.6))
                Text(session.date)
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

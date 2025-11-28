
import SwiftUI

struct SectionView: View {
    let title: String
    let subtitle: String
    let items: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(size: 18, weight: .semibold))
                Text(subtitle)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.gray)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                ForEach(items, id: \.self) { item in
                    HStack(alignment: .top, spacing: 12) {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 6, height: 6)
                            .padding(.top, 6)
                        Text(item)
                            .font(.system(size: 14, weight: .regular))
                            .lineLimit(nil)
                    }
                }
            }
            .padding(12)
            .background(Color(white: 0.08))
            .cornerRadius(8)
        }
        .padding(.horizontal, 24)
    }
}

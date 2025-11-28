import SwiftUI

struct DayButton: View {
    let day: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(day.prefix(3))
                .font(.system(size: 13, weight: .semibold))
                .frame(height: 44)
                .frame(minWidth: 50)
                .foregroundColor(isSelected ? .black : .white)
                .background(isSelected ? .white : Color(white: 0.12))
                .cornerRadius(8)
        }
    }
}

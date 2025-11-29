import SwiftUI

struct StatBadge: View {
    let label: String
    let value: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 2) {
            Text(label)
                .font(.system(size: 10, weight: .regular))
                .foregroundColor(.gray)
            Text(value)
                .font(.system(size: 13, weight: .semibold))
        }
    }
}

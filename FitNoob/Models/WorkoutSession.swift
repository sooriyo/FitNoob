import Foundation

struct WorkoutSession: Identifiable {
    let id = UUID()
    let day: String
    let date: String
    let timeRange: String
    let title: String
    let description: String
    let warmUp: [String]
    let workingSets: [Exercise]
    let finisher: String?
    let estimatedCalories: Int
    let estimatedSteps: Int
}

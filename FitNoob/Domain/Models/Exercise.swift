//
//  Models.swift
//  FitNoob
//
//  Domain/Models/
//  Place this in: Domain/Models/Models.swift
//

import Foundation

// MARK: - Exercise (Library/Reference)
struct Exercise: Identifiable, Codable, Hashable {
    let id: UUID
    let name: String
    let category: String
    let equipment: String
    let muscleGroup: String?
    let difficulty: String?
    
    init(
        id: UUID = UUID(),
        name: String,
        category: String,
        equipment: String,
        muscleGroup: String? = nil,
        difficulty: String? = nil
    ) {
        self.id = id
        self.name = name
        self.category = category
        self.equipment = equipment
        self.muscleGroup = muscleGroup
        self.difficulty = difficulty
    }
}

// MARK: - WorkoutExercise (Exercise with configuration)
struct WorkoutExercise: Identifiable, Codable, Hashable {
    var id: UUID
    var exerciseId: UUID
    var exerciseName: String
    var sets: Int
    var reps: String
    var restTime: Int
    var notes: String
    var order: Int
    var completed: Bool
    var category: String?
    var equipment: String?
    
    init(
        id: UUID = UUID(),
        exerciseId: UUID = UUID(),
        exerciseName: String,
        sets: Int,
        reps: String,
        restTime: Int,
        notes: String = "",
        order: Int = 0,
        completed: Bool = false,
        category: String? = nil,
        equipment: String? = nil
    ) {
        self.id = id
        self.exerciseId = exerciseId
        self.exerciseName = exerciseName
        self.sets = sets
        self.reps = reps
        self.restTime = restTime
        self.notes = notes
        self.order = order
        self.completed = completed
        self.category = category
        self.equipment = equipment
    }
    
    var rest: String {
        if restTime < 60 {
            return "\(restTime)s"
        } else {
            let minutes = restTime / 60
            let seconds = restTime % 60
            return seconds > 0 ? "\(minutes)m \(seconds)s" : "\(minutes)m"
        }
    }
}

// MARK: - CardioSession
struct CardioSession: Identifiable, Codable, Hashable {
    var id: UUID
    var type: String
    var duration: Int?
    var distance: Double?
    var intensity: String
    var completed: Bool
    var notes: String
    
    init(
        id: UUID = UUID(),
        type: String,
        duration: Int? = nil,
        distance: Double? = nil,
        intensity: String = "Medium",
        completed: Bool = false,
        notes: String = ""
    ) {
        self.id = id
        self.type = type
        self.duration = duration
        self.distance = distance
        self.intensity = intensity
        self.completed = completed
        self.notes = notes
    }
}

// MARK: - DayOfWeek
enum DayOfWeek: String, CaseIterable, Codable, Hashable {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
    
    var shortName: String {
        switch self {
        case .monday: return "M"
        case .tuesday: return "T"
        case .wednesday: return "W"
        case .thursday: return "T"
        case .friday: return "F"
        case .saturday: return "S"
        case .sunday: return "S"
        }
    }
    
    var fullName: String {
        rawValue.capitalized
    }
    
    var index: Int {
        switch self {
        case .monday: return 0
        case .tuesday: return 1
        case .wednesday: return 2
        case .thursday: return 3
        case .friday: return 4
        case .saturday: return 5
        case .sunday: return 6
        }
    }
}

// MARK: - WorkoutDay (Single day configuration)
struct WorkoutDay: Identifiable, Codable, Hashable {
    var id: UUID
    var dayOfWeek: DayOfWeek
    var name: String
    var exercises: [WorkoutExercise]
    var cardio: CardioSession?
    var warmUp: [String]
    var finisher: String?
    var isRestDay: Bool
    
    init(
        id: UUID = UUID(),
        dayOfWeek: DayOfWeek,
        name: String = "",
        exercises: [WorkoutExercise] = [],
        cardio: CardioSession? = nil,
        warmUp: [String] = [],
        finisher: String? = nil,
        isRestDay: Bool = false
    ) {
        self.id = id
        self.dayOfWeek = dayOfWeek
        self.name = name
        self.exercises = exercises
        self.cardio = cardio
        self.warmUp = warmUp
        self.finisher = finisher
        self.isRestDay = isRestDay
    }
    
    var estimatedCalories: Int {
        let exerciseCalories = exercises.count * 50
        let cardioCalories = (cardio?.duration ?? 0) * 10
        return exerciseCalories + cardioCalories
    }
    
    var estimatedSteps: Int {
        let exerciseSteps = exercises.count * 100
        let cardioSteps = (cardio?.duration ?? 0) * 100
        return exerciseSteps + cardioSteps
    }
    
    var totalExercises: Int {
        exercises.count + (cardio != nil ? 1 : 0)
    }
}

// MARK: - Schedule (Complete workout schedule)
struct Schedule: Identifiable, Codable, Hashable {
    var id: UUID
    var name: String
    var workoutDays: [WorkoutDay]
    var createdDate: Date
    var isActive: Bool
    
    init(
        id: UUID = UUID(),
        name: String,
        workoutDays: [WorkoutDay] = [],
        createdDate: Date = Date(),
        isActive: Bool = false
    ) {
        self.id = id
        self.name = name
        self.workoutDays = workoutDays
        self.createdDate = createdDate
        self.isActive = isActive
    }
    
    var trainingDays: [DayOfWeek] {
        workoutDays.filter { !$0.isRestDay }.map { $0.dayOfWeek }
    }
    
    var restDays: [DayOfWeek] {
        let allDays = Set(DayOfWeek.allCases)
        let training = Set(trainingDays)
        return Array(allDays.subtracting(training)).sorted { $0.index < $1.index }
    }
    
    var totalWorkouts: Int {
        trainingDays.count
    }
    
    func getWorkout(for day: DayOfWeek) -> WorkoutDay? {
        workoutDays.first { $0.dayOfWeek == day }
    }
}

// MARK: - WorkoutSession (Legacy - for existing dashboard)
struct WorkoutSession: Identifiable, Codable {
    let id: UUID
    let day: String
    let date: String
    let timeRange: String
    let title: String
    let description: String
    let warmUp: [String]
    let workingSets: [WorkoutExercise]
    let finisher: String?
    let estimatedCalories: Int
    let estimatedSteps: Int
    
    init(
        id: UUID = UUID(),
        day: String,
        date: String,
        timeRange: String,
        title: String,
        description: String,
        warmUp: [String],
        workingSets: [WorkoutExercise],
        finisher: String? = nil,
        estimatedCalories: Int,
        estimatedSteps: Int
    ) {
        self.id = id
        self.day = day
        self.date = date
        self.timeRange = timeRange
        self.title = title
        self.description = description
        self.warmUp = warmUp
        self.workingSets = workingSets
        self.finisher = finisher
        self.estimatedCalories = estimatedCalories
        self.estimatedSteps = estimatedSteps
    }
    
    init(from workoutDay: WorkoutDay, date: Date = Date()) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d"
        
        self.id = workoutDay.id
        self.day = workoutDay.dayOfWeek.fullName
        self.date = dateFormatter.string(from: date)
        self.timeRange = "Scheduled"
        self.title = workoutDay.name.isEmpty ? "\(workoutDay.dayOfWeek.fullName) Workout" : workoutDay.name
        self.description = "\(workoutDay.exercises.count) exercises"
        self.warmUp = workoutDay.warmUp
        self.workingSets = workoutDay.exercises
        self.finisher = workoutDay.finisher
        self.estimatedCalories = workoutDay.estimatedCalories
        self.estimatedSteps = workoutDay.estimatedSteps
    }
}

// MARK: - Exercise Library
extension Exercise {
    static let library: [Exercise] = [
        // Chest
        Exercise(name: "Bench Press", category: "Chest", equipment: "Barbell", muscleGroup: "Chest", difficulty: "Intermediate"),
        Exercise(name: "Incline Bench Press", category: "Chest", equipment: "Barbell", muscleGroup: "Upper Chest", difficulty: "Intermediate"),
        Exercise(name: "Dumbbell Press", category: "Chest", equipment: "Dumbbell", muscleGroup: "Chest", difficulty: "Beginner"),
        Exercise(name: "Incline Dumbbell Press", category: "Chest", equipment: "Dumbbell", muscleGroup: "Upper Chest", difficulty: "Beginner"),
        Exercise(name: "Push-ups", category: "Chest", equipment: "Bodyweight", muscleGroup: "Chest", difficulty: "Beginner"),
        Exercise(name: "Dumbbell Flyes", category: "Chest", equipment: "Dumbbell", muscleGroup: "Chest", difficulty: "Intermediate"),
        Exercise(name: "Cable Flyes", category: "Chest", equipment: "Cable", muscleGroup: "Chest", difficulty: "Intermediate"),
        
        // Back
        Exercise(name: "Barbell Row", category: "Back", equipment: "Barbell", muscleGroup: "Back", difficulty: "Intermediate"),
        Exercise(name: "Pull-ups", category: "Back", equipment: "Bodyweight", muscleGroup: "Lats", difficulty: "Intermediate"),
        Exercise(name: "Lat Pulldown", category: "Back", equipment: "Cable", muscleGroup: "Lats", difficulty: "Beginner"),
        Exercise(name: "Deadlift", category: "Back", equipment: "Barbell", muscleGroup: "Back/Legs", difficulty: "Advanced"),
        Exercise(name: "Dumbbell Row", category: "Back", equipment: "Dumbbell", muscleGroup: "Back", difficulty: "Beginner"),
        Exercise(name: "Seated Cable Row", category: "Back", equipment: "Cable", muscleGroup: "Back", difficulty: "Beginner"),
        Exercise(name: "Face Pulls", category: "Back", equipment: "Cable", muscleGroup: "Rear Delts", difficulty: "Beginner"),
        
        // Legs
        Exercise(name: "Squat", category: "Legs", equipment: "Barbell", muscleGroup: "Quads", difficulty: "Intermediate"),
        Exercise(name: "Leg Press", category: "Legs", equipment: "Machine", muscleGroup: "Quads", difficulty: "Beginner"),
        Exercise(name: "Romanian Deadlift", category: "Legs", equipment: "Barbell", muscleGroup: "Hamstrings", difficulty: "Intermediate"),
        Exercise(name: "Lunges", category: "Legs", equipment: "Bodyweight", muscleGroup: "Legs", difficulty: "Beginner"),
        Exercise(name: "Leg Curl", category: "Legs", equipment: "Machine", muscleGroup: "Hamstrings", difficulty: "Beginner"),
        Exercise(name: "Leg Extension", category: "Legs", equipment: "Machine", muscleGroup: "Quads", difficulty: "Beginner"),
        Exercise(name: "Calf Raises", category: "Legs", equipment: "Machine", muscleGroup: "Calves", difficulty: "Beginner"),
        
        // Shoulders
        Exercise(name: "Overhead Press", category: "Shoulders", equipment: "Barbell", muscleGroup: "Shoulders", difficulty: "Intermediate"),
        Exercise(name: "Dumbbell Shoulder Press", category: "Shoulders", equipment: "Dumbbell", muscleGroup: "Shoulders", difficulty: "Beginner"),
        Exercise(name: "Lateral Raise", category: "Shoulders", equipment: "Dumbbell", muscleGroup: "Side Delts", difficulty: "Beginner"),
        Exercise(name: "Front Raise", category: "Shoulders", equipment: "Dumbbell", muscleGroup: "Front Delts", difficulty: "Beginner"),
        Exercise(name: "Arnold Press", category: "Shoulders", equipment: "Dumbbell", muscleGroup: "Shoulders", difficulty: "Intermediate"),
        
        // Arms
        Exercise(name: "Bicep Curl", category: "Arms", equipment: "Dumbbell", muscleGroup: "Biceps", difficulty: "Beginner"),
        Exercise(name: "Hammer Curl", category: "Arms", equipment: "Dumbbell", muscleGroup: "Biceps", difficulty: "Beginner"),
        Exercise(name: "Tricep Dips", category: "Arms", equipment: "Bodyweight", muscleGroup: "Triceps", difficulty: "Intermediate"),
        Exercise(name: "Tricep Pushdown", category: "Arms", equipment: "Cable", muscleGroup: "Triceps", difficulty: "Beginner"),
        Exercise(name: "Skull Crushers", category: "Arms", equipment: "Barbell", muscleGroup: "Triceps", difficulty: "Intermediate"),
        Exercise(name: "Preacher Curl", category: "Arms", equipment: "Barbell", muscleGroup: "Biceps", difficulty: "Intermediate"),
        
        // Core
        Exercise(name: "Plank", category: "Core", equipment: "Bodyweight", muscleGroup: "Abs", difficulty: "Beginner"),
        Exercise(name: "Crunches", category: "Core", equipment: "Bodyweight", muscleGroup: "Abs", difficulty: "Beginner"),
        Exercise(name: "Leg Raises", category: "Core", equipment: "Bodyweight", muscleGroup: "Lower Abs", difficulty: "Intermediate"),
        Exercise(name: "Russian Twists", category: "Core", equipment: "Bodyweight", muscleGroup: "Obliques", difficulty: "Beginner"),
        Exercise(name: "Cable Crunch", category: "Core", equipment: "Cable", muscleGroup: "Abs", difficulty: "Intermediate"),
    ]
}

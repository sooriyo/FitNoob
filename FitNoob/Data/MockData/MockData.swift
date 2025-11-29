//
//  MockData.swift
//  FitNoob
//
//  Data/MockData/
//

import Foundation

// MARK: - Mock Workout Schedule
let workoutSchedule: [WorkoutSession] = [
    WorkoutSession(
        day: "Monday",
        date: "Dec 16",
        timeRange: "5:30 – 7:00 PM",
        title: "Push Day",
        description: "Upper body push workout. Focus on chest, shoulders, and triceps with progressive overload.",
        warmUp: ["5 min treadmill (fast walk)", "5 min cycle", "Arm circles & shoulder mobility"],
        workingSets: [
            WorkoutExercise(
                exerciseName: "Machine Chest Press",
                sets: 4,
                reps: "10-12",
                restTime: 105,
                notes: "Focus on full range of motion",
                order: 0,
                category: "Chest",
                equipment: "Machine"
            ),
            WorkoutExercise(
                exerciseName: "Machine Shoulder Press",
                sets: 4,
                reps: "10-12",
                restTime: 105,
                notes: "",
                order: 1,
                category: "Shoulders",
                equipment: "Machine"
            ),
            WorkoutExercise(
                exerciseName: "Cable Lateral Raise",
                sets: 3,
                reps: "15-20",
                restTime: 90,
                notes: "",
                order: 2,
                category: "Shoulders",
                equipment: "Cable"
            ),
            WorkoutExercise(
                exerciseName: "Cable Triceps Pushdown",
                sets: 3,
                reps: "12-15",
                restTime: 90,
                notes: "",
                order: 3,
                category: "Arms",
                equipment: "Cable"
            ),
            WorkoutExercise(
                exerciseName: "Overhead Triceps Extension",
                sets: 3,
                reps: "12-15",
                restTime: 90,
                notes: "",
                order: 4,
                category: "Arms",
                equipment: "Cable"
            )
        ],
        finisher: "100 band push-ups or 3×20 cable flyes",
        estimatedCalories: 420,
        estimatedSteps: 2800
    ),
    WorkoutSession(
        day: "Tuesday",
        date: "Dec 17",
        timeRange: "5:30 – 7:00 PM",
        title: "Pull Day",
        description: "Upper body pull workout. This workout focuses on back and biceps development.",
        warmUp: ["6 min Air Runner (slow jog)", "Dynamic arms", "Band pull-aparts"],
        workingSets: [
            WorkoutExercise(
                exerciseName: "Lat Pulldown",
                sets: 4,
                reps: "10-12",
                restTime: 90,
                notes: "Wide grip",
                order: 0,
                category: "Back",
                equipment: "Cable"
            ),
            WorkoutExercise(
                exerciseName: "Seated Cable Row",
                sets: 4,
                reps: "10-12",
                restTime: 90,
                notes: "",
                order: 1,
                category: "Back",
                equipment: "Cable"
            ),
            WorkoutExercise(
                exerciseName: "Face Pulls",
                sets: 3,
                reps: "15-20",
                restTime: 90,
                notes: "",
                order: 2,
                category: "Back",
                equipment: "Cable"
            ),
            WorkoutExercise(
                exerciseName: "Bicep Curl",
                sets: 3,
                reps: "12-15",
                restTime: 90,
                notes: "EZ-Bar",
                order: 3,
                category: "Arms",
                equipment: "Barbell"
            ),
            WorkoutExercise(
                exerciseName: "Preacher Curl",
                sets: 3,
                reps: "12-15",
                restTime: 90,
                notes: "",
                order: 4,
                category: "Arms",
                equipment: "Barbell"
            )
        ],
        finisher: "Giant set: Curl → Pushdown → Hammer Curl ×3",
        estimatedCalories: 380,
        estimatedSteps: 2500
    ),
    WorkoutSession(
        day: "Wednesday",
        date: "Dec 18",
        timeRange: "5:30 – 7:00 PM",
        title: "Leg Day",
        description: "Lower body workout. Focus on quads, hamstrings, and glutes.",
        warmUp: ["5 min bike", "Leg swings", "Bodyweight squats"],
        workingSets: [
            WorkoutExercise(
                exerciseName: "Leg Press",
                sets: 4,
                reps: "12-15",
                restTime: 120,
                notes: "",
                order: 0,
                category: "Legs",
                equipment: "Machine"
            ),
            WorkoutExercise(
                exerciseName: "Romanian Deadlift",
                sets: 4,
                reps: "10-12",
                restTime: 90,
                notes: "",
                order: 1,
                category: "Legs",
                equipment: "Barbell"
            ),
            WorkoutExercise(
                exerciseName: "Leg Extension",
                sets: 3,
                reps: "15-20",
                restTime: 60,
                notes: "",
                order: 2,
                category: "Legs",
                equipment: "Machine"
            ),
            WorkoutExercise(
                exerciseName: "Leg Curl",
                sets: 3,
                reps: "15-20",
                restTime: 60,
                notes: "",
                order: 3,
                category: "Legs",
                equipment: "Machine"
            ),
            WorkoutExercise(
                exerciseName: "Calf Raises",
                sets: 4,
                reps: "20-25",
                restTime: 60,
                notes: "",
                order: 4,
                category: "Legs",
                equipment: "Machine"
            )
        ],
        finisher: "Walking lunges 3×20 steps",
        estimatedCalories: 520,
        estimatedSteps: 3500
    ),
    WorkoutSession(
        day: "Thursday",
        date: "Dec 19",
        timeRange: "5:30 – 7:00 PM",
        title: "Push Day",
        description: "Upper body push workout. Focus on chest, shoulders, and triceps.",
        warmUp: ["5 min treadmill", "Arm circles"],
        workingSets: [
            WorkoutExercise(
                exerciseName: "Incline Dumbbell Press",
                sets: 4,
                reps: "10-12",
                restTime: 90,
                notes: "",
                order: 0,
                category: "Chest",
                equipment: "Dumbbell"
            ),
            WorkoutExercise(
                exerciseName: "Lateral Raise",
                sets: 3,
                reps: "15-20",
                restTime: 60,
                notes: "",
                order: 1,
                category: "Shoulders",
                equipment: "Dumbbell"
            ),
            WorkoutExercise(
                exerciseName: "Tricep Dips",
                sets: 3,
                reps: "12-15",
                restTime: 90,
                notes: "",
                order: 2,
                category: "Arms",
                equipment: "Bodyweight"
            )
        ],
        finisher: "Push-up burnout",
        estimatedCalories: 350,
        estimatedSteps: 2200
    ),
    WorkoutSession(
        day: "Friday",
        date: "Dec 20",
        timeRange: "5:30 – 7:00 PM",
        title: "Pull Day",
        description: "Upper body pull workout. Back and biceps focus.",
        warmUp: ["5 min rowing", "Band stretches"],
        workingSets: [
            WorkoutExercise(
                exerciseName: "Pull-ups",
                sets: 4,
                reps: "8-10",
                restTime: 120,
                notes: "",
                order: 0,
                category: "Back",
                equipment: "Bodyweight"
            ),
            WorkoutExercise(
                exerciseName: "Barbell Row",
                sets: 4,
                reps: "10-12",
                restTime: 90,
                notes: "",
                order: 1,
                category: "Back",
                equipment: "Barbell"
            ),
            WorkoutExercise(
                exerciseName: "Hammer Curl",
                sets: 3,
                reps: "12-15",
                restTime: 60,
                notes: "",
                order: 2,
                category: "Arms",
                equipment: "Dumbbell"
            )
        ],
        finisher: "Bicep burnout with light dumbbells",
        estimatedCalories: 340,
        estimatedSteps: 2000
    ),
    WorkoutSession(
        day: "Saturday",
        date: "Dec 21",
        timeRange: "5:30 – 7:00 PM",
        title: "Leg Day",
        description: "Lower body strength focus.",
        warmUp: ["5 min bike", "Leg stretches"],
        workingSets: [
            WorkoutExercise(
                exerciseName: "Squat",
                sets: 4,
                reps: "8-10",
                restTime: 120,
                notes: "",
                order: 0,
                category: "Legs",
                equipment: "Barbell"
            ),
            WorkoutExercise(
                exerciseName: "Leg Press",
                sets: 3,
                reps: "12-15",
                restTime: 90,
                notes: "",
                order: 1,
                category: "Legs",
                equipment: "Machine"
            ),
            WorkoutExercise(
                exerciseName: "Lunges",
                sets: 3,
                reps: "12-15",
                restTime: 60,
                notes: "Each leg",
                order: 2,
                category: "Legs",
                equipment: "Bodyweight"
            )
        ],
        finisher: "Calf raises 3×25",
        estimatedCalories: 400,
        estimatedSteps: 3000
    ),
    WorkoutSession(
        day: "Sunday",
        date: "Dec 22",
        timeRange: "Rest Day",
        title: "Active Recovery",
        description: "Light activity and stretching.",
        warmUp: ["Light walking", "Full body stretching"],
        workingSets: [],
        finisher: nil,
        estimatedCalories: 150,
        estimatedSteps: 5000
    )
]

// MARK: - Mock Schedule (New Format)
let mockSchedule = Schedule(
    name: "PPL 6-Day Split",
    workoutDays: [
        WorkoutDay(
            dayOfWeek: .monday,
            name: "Push Day",
            exercises: [
                WorkoutExercise(
                    exerciseName: "Bench Press",
                    sets: 4,
                    reps: "8-10",
                    restTime: 120,
                    notes: "Focus on form",
                    order: 0,
                    category: "Chest",
                    equipment: "Barbell"
                ),
                WorkoutExercise(
                    exerciseName: "Overhead Press",
                    sets: 4,
                    reps: "8-10",
                    restTime: 90,
                    order: 1,
                    category: "Shoulders",
                    equipment: "Barbell"
                ),
                WorkoutExercise(
                    exerciseName: "Tricep Dips",
                    sets: 3,
                    reps: "10-12",
                    restTime: 60,
                    order: 2,
                    category: "Arms",
                    equipment: "Bodyweight"
                )
            ],
            warmUp: ["5 min cardio", "Arm circles", "Push-ups"],
            finisher: "100 push-ups"
        ),
        WorkoutDay(
            dayOfWeek: .wednesday,
            name: "Pull Day",
            exercises: [
                WorkoutExercise(
                    exerciseName: "Pull-ups",
                    sets: 4,
                    reps: "8-10",
                    restTime: 120,
                    order: 0,
                    category: "Back",
                    equipment: "Bodyweight"
                ),
                WorkoutExercise(
                    exerciseName: "Barbell Row",
                    sets: 4,
                    reps: "10-12",
                    restTime: 90,
                    order: 1,
                    category: "Back",
                    equipment: "Barbell"
                ),
                WorkoutExercise(
                    exerciseName: "Bicep Curl",
                    sets: 3,
                    reps: "12-15",
                    restTime: 60,
                    order: 2,
                    category: "Arms",
                    equipment: "Dumbbell"
                )
            ],
            warmUp: ["5 min rowing", "Band stretches"],
            finisher: "Bicep burnout"
        ),
        WorkoutDay(
            dayOfWeek: .friday,
            name: "Leg Day",
            exercises: [
                WorkoutExercise(
                    exerciseName: "Squat",
                    sets: 4,
                    reps: "8-10",
                    restTime: 180,
                    order: 0,
                    category: "Legs",
                    equipment: "Barbell"
                ),
                WorkoutExercise(
                    exerciseName: "Romanian Deadlift",
                    sets: 4,
                    reps: "10-12",
                    restTime: 120,
                    order: 1,
                    category: "Legs",
                    equipment: "Barbell"
                ),
                WorkoutExercise(
                    exerciseName: "Leg Press",
                    sets: 3,
                    reps: "12-15",
                    restTime: 90,
                    order: 2,
                    category: "Legs",
                    equipment: "Machine"
                )
            ],
            warmUp: ["5 min bike", "Leg swings"],
            finisher: "Walking lunges 3×20"
        )
    ],
    isActive: true
)

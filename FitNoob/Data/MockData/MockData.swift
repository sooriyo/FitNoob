import Foundation

let workoutSchedule: [WorkoutSession] = [
    WorkoutSession(
        day: "Monday",
        date: "Dec 16",
        timeRange: "5:30 – 7:00 PM",
        title: "Push Day",
        description: "Upper body push workout. Focus on chest, shoulders, and triceps with progressive overload.",
        warmUp: ["5 min treadmill (fast walk)", "5 min cycle", "Arm circles & shoulder mobility"],
        workingSets: [
            Exercise(name: "Machine Chest Press", sets: 4, reps: "10–12", rest: "90–120s"),
            Exercise(name: "Machine Shoulder Press", sets: 4, reps: "10–12", rest: "90–120s"),
            Exercise(name: "Cable Lateral Raise", sets: 3, reps: "15–20", rest: "90s"),
            Exercise(name: "Cable Triceps Pushdown", sets: 3, reps: "12–15", rest: "90s"),
            Exercise(name: "Overhead Triceps Extension", sets: 3, reps: "12–15", rest: "90s")
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
            Exercise(name: "Lat Pulldown (wide grip)", sets: 4, reps: "10–12", rest: "90s"),
            Exercise(name: "Seated Cable Row", sets: 4, reps: "10–12", rest: "90s"),
            Exercise(name: "Face Pulls", sets: 3, reps: "15–20", rest: "90s"),
            Exercise(name: "EZ-Bar Curl", sets: 3, reps: "12–15", rest: "90s"),
            Exercise(name: "Preacher Curl", sets: 3, reps: "12–15", rest: "90s")
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
            Exercise(name: "Leg Press", sets: 4, reps: "12–15", rest: "120s"),
            Exercise(name: "Romanian Deadlift", sets: 4, reps: "10–12", rest: "90s"),
            Exercise(name: "Leg Extension", sets: 3, reps: "15–20", rest: "60s"),
            Exercise(name: "Leg Curl", sets: 3, reps: "15–20", rest: "60s"),
            Exercise(name: "Calf Raises", sets: 4, reps: "20–25", rest: "60s")
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
            Exercise(name: "Incline Dumbbell Press", sets: 4, reps: "10–12", rest: "90s"),
            Exercise(name: "Lateral Raises", sets: 3, reps: "15–20", rest: "60s"),
            Exercise(name: "Tricep Dips", sets: 3, reps: "12–15", rest: "90s")
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
            Exercise(name: "Pull-ups", sets: 4, reps: "8–10", rest: "120s"),
            Exercise(name: "Barbell Row", sets: 4, reps: "10–12", rest: "90s"),
            Exercise(name: "Hammer Curls", sets: 3, reps: "12–15", rest: "60s")
        ],
        finisher: "Bicep burnout with light dumbbells",
        estimatedCalories: 340,
        estimatedSteps: 2000
    ),
    WorkoutSession(
        day: "Saturday",
        date: "Dec 20",
        timeRange: "5:30 – 7:00 PM",
        title: "Pull Day",
        description: "Upper body pull workout. Back and biceps focus.",
        warmUp: ["5 min rowing", "Band stretches"],
        workingSets: [
            Exercise(name: "Pull-ups", sets: 4, reps: "8–10", rest: "120s"),
            Exercise(name: "Barbell Row", sets: 4, reps: "10–12", rest: "90s"),
            Exercise(name: "Hammer Curls", sets: 3, reps: "12–15", rest: "60s")
        ],
        finisher: "Bicep burnout with light dumbbells",
        estimatedCalories: 340,
        estimatedSteps: 2000
    ),
    WorkoutSession(
        day: "Sunday",
        date: "Dec 20",
        timeRange: "5:30 – 7:00 PM",
        title: "Pull Day",
        description: "Upper body pull workout. Back and biceps focus.",
        warmUp: ["5 min rowing", "Band stretches"],
        workingSets: [
            Exercise(name: "Pull-ups", sets: 4, reps: "8–10", rest: "120s"),
            Exercise(name: "Barbell Row", sets: 4, reps: "10–12", rest: "90s"),
            Exercise(name: "Hammer Curls", sets: 3, reps: "12–15", rest: "60s")
        ],
        finisher: "Bicep burnout with light dumbbells",
        estimatedCalories: 340,
        estimatedSteps: 2000
    )
]

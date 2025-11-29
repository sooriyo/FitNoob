//
//  FitNoobApp.swift
//  FitNoob
//
//  Created by Tharuka Sooriyaarachchi on 11/28/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            WorkoutDashboardView()
                .tabItem { Label("Workout", systemImage: "figure.strengthtraining.traditional") }
            
//            ScheduleView()
//                .tabItem { Label("Schedule", systemImage: "calendar") }
//            
//            ProgressView()
//                .tabItem { Label("Progress", systemImage: "chart.line.uptrend.xyaxis") }
//            
//            SettingsView()
//                .tabItem { Label("Settings", systemImage: "gearshape") }
        }
    }
}


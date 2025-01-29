//
//  TheMovieApp.swift
//  TheMovieApp
//
//  Created by Mario Ban on 28.01.2025..
//

import SwiftUI
import SwiftData

@main
struct TheMovieApp: App {
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .modelContainer(for: Movie.self, isAutosaveEnabled: true)
        }
    }
}

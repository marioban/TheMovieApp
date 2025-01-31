//
//  TheMovieApp.swift
//  TheMovieApp
//
//  Created by Mario Ban on 28.01.2025..
//

import SwiftUI
import SwiftData
import KeychainSwift

@main
struct TheMovieApp: App {
    
    init() {
        _ = AppStateManager.shared
    }
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .modelContainer(for: Movie.self, isAutosaveEnabled: true)
                .environment(\.keychain, KeychainManager())
        }
    }
}

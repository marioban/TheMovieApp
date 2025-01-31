//
//  AppStateManager.swift
//  TheMovieApp
//
//  Created by Mario Ban on 31.01.2025..
//

import Foundation
import KeychainSwift

final class AppStateManager {
    static let shared = AppStateManager()
    private let keychain = KeychainSwift()
    private let apiKeyIdentifier = "TMDB_API_KEY"
    
    private init() {
        keychain.synchronizable = true
        setupAPIKey()
    }
    
    private func setupAPIKey() {
        if getAPIKey() == nil {
            setAPIKey("eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2MTI0YTMzZmRiMDBlMzFiNGM4MTc0M2ZiYTdiMTdmZiIsIm5iZiI6MTY3MTAzOTIzNS4xODEsInN1YiI6IjYzOWEwOTAzM2Q0M2UwMDA3Y2Q1NTgyZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.RmBps77IC8qQnZDwwJ-wmCoxx7yR5pb63nF76xi1_nM")
        }
    }
    
    func setAPIKey(_ value: String) {
        keychain.set(value, forKey: apiKeyIdentifier)
    }
    
    func getAPIKey() -> String? {
        keychain.get(apiKeyIdentifier)
    }
}

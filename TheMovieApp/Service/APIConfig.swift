//
//  APIConfig.swift
//  TheMovieApp
//
//  Created by Mario Ban on 31.01.2025..
//

import Foundation


// MARK: - APIConfig
struct APIConfig {
    static let baseURL = "https://api.themoviedb.org/3"
    static let apiKeyIdentifier = "TMDB_API_KEY"
}

// MARK: - APIError Enum
enum APIError: Error, LocalizedError {
    case invalidResponse
    case requestFailed
    case decodingError
    case invalidURL
    
    var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return "The server returned an invalid response."
        case .requestFailed:
            return "The request failed. Please check your internet connection."
        case .decodingError:
            return "Failed to decode the data from the server."
        case .invalidURL:
            return "The provided URL is invalid."
        }
    }
}

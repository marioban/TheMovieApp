//
//  MovieRepository.swift
//  TheMovieApp
//
//  Created by Mario Ban on 28.01.2025..
//

import SwiftUI
import SwiftData


protocol MovieRepositoryProtocol {
    func getTopRatedMovies(page: Int) async throws -> [Movie]
    func getSimilarMovies(movieID: Int) async throws -> [Movie]
    func getMovieDetails(movieID: Int) async throws -> Movie
    func getFavoriteMovies() async -> [Movie]
    func saveFavoriteMovie(_ movie: Movie) async throws
    func removeFavoriteMovie(_ movie: Movie) async throws
}

/*
@APIServiceActor
class MovieRepository: MovieRepositoryProtocol {
    private let apiService: APIService
    private let modelContext: ModelContext

    init(apiService: APIService, modelContext: ModelContext) {
        self.apiService = apiService
        self.modelContext = modelContext
    }

    func getTopRatedMovies(page: Int) async throws -> [Movie] {
        return try await apiService.fetchTopRatedMovies(page: page)
    }
    
    func getFavoriteMovies() async -> [Movie] {
        let favorites = try? modelContext.fetch(FetchDescriptor<Movie>())
        return favorites?.filter { $0.favorite } ?? []
    }

    func saveFavoriteMovie(_ movie: Movie) async throws {
        movie.favorite = true
        modelContext.insert(movie)
        try modelContext.save()
    }

    func removeFavoriteMovie(_ movie: Movie) async throws {
        modelContext.delete(movie)
        try modelContext.save()
    }

    func getMovieDetails(movieID: Int) async throws -> Movie {
        return try await apiService.fetchMovieDetails(movieID: movieID)
    }
    
    func getSimilarMovies(movieID: Int) async throws -> [Movie] {
        return try await apiService.fetchSimilarMovies(movieID: movieID)
    }
}
 /**/*/

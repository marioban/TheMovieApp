//
//  MovieDetailsViewModel.swift
//  TheMovieApp
//
//  Created by Mario Ban on 29.01.2025..
//

import SwiftUI
import Combine
import SwiftData

@MainActor
class MovieDetailsViewModel: ObservableObject {
    @Published var movie: Movie?
    @Published var similarMovies: [Movie] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let movieID: Int
    private let apiService: APIService
    private let modelContext: ModelContext
    private let repository: MovieRepository
    
    init(movieID: Int, apiService: APIService, modelContext: ModelContext, repository: MovieRepository) {
        self.movieID = movieID
        self.apiService = apiService
        self.modelContext = modelContext
        self.repository = repository
    }
    
    func fetchMovieDetails() async {
        isLoading = true
        errorMessage = nil
        do {
            let fetchedMovie = try await apiService.fetchMovieDetails(movieID: movieID)
            if let repoMovie = repository.getMovie(by: fetchedMovie.id) {
                movie = repoMovie
            } else {
                repository.saveMovies([fetchedMovie])
                movie = fetchedMovie
            }
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
    
    func fetchSimilarMovies(page: Int) async {
        isLoading = true
        errorMessage = nil
        do {
            let fetchedSimilar = try await apiService.fetchSimilarMovies(movieID: movieID, page: page)
            repository.saveMovies(fetchedSimilar)
            similarMovies = fetchedSimilar.map { repository.getMovie(by: $0.id) ?? $0 }
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
    
    func toggleFavorite() {
        guard let movie = movie else { return }
        repository.toggleFavorite(movie: movie)
    }
    
    func toggleWatched() {
        guard let movie = movie else { return }
        repository.toggleWatched(movie: movie)
    }
}

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
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let movieID: Int
    private let apiService: APIService
    private let modelContext: ModelContext

    init(movieID: Int, apiService: APIService, modelContext: ModelContext) {
        self.movieID = movieID
        self.apiService = apiService
        self.modelContext = modelContext
    }

    func fetchMovieDetails() async {
        isLoading = true
        errorMessage = nil
        do {
            movie = try await apiService.fetchMovieDetails(movieID: movieID)
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }

    func toggleFavorite() {
        guard let movie else { return }
        movie.favorite.toggle()
        try? modelContext.save()
        self.movie = movie
    }

    func toggleWatched() {
        guard let movie else { return }
        movie.watched.toggle()
        try? modelContext.save()
        self.movie = movie
    }
}

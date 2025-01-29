//
//  MovieDetailsViewModel.swift
//  TheMovieApp
//
//  Created by Mario Ban on 29.01.2025..
//

import SwiftUI
import Combine

@MainActor
class MovieDetailsViewModel: ObservableObject {
    @Published var movie: Movie?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let movieID: Int
    private let apiService: APIService

    init(movieID: Int, apiService: APIService) {
        self.movieID = movieID
        self.apiService = apiService
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
        guard var movie else { return }
        movie.favorite.toggle()
        self.movie = movie
    }

    func toggleWatched() {
        guard var movie else { return }
        movie.watched.toggle()
        self.movie = movie
    }
}

//
//  MovieDetailsViewModel.swift
//  TheMovieApp
//
//  Created by Mario Ban on 29.01.2025..
//

import SwiftUI
import Combine

/*
@MainActor
class MovieDetailsViewModel: ObservableObject {
    @Published var movie: Movie?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let repository: MovieRepository
    private let movieID: Int

    init(movieID: Int, repository: MovieRepository) {
        self.movieID = movieID
        self.repository = repository
    }

    func fetchMovieDetails() async {
        isLoading = true
        errorMessage = nil
        do {
            movie = try await repository.getMovieDetails(movieID: movieID)
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }

    func toggleFavorite() async {
        guard let movie else { return }
        do {
            if movie.favorite {
                try await repository.removeFavoriteMovie(movie)
            } else {
                try await repository.saveFavoriteMovie(movie)
            }
            movie.favorite.toggle()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
*/

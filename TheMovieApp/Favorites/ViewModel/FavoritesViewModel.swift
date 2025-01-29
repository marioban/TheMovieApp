//
//  FavoritesViewModel.swift
//  TheMovieApp
//
//  Created by Mario Ban on 29.01.2025..
//

import SwiftUI
import Combine

/*
@MainActor
class FavoritesViewModel: ObservableObject {
    @Published var favoriteMovies: [Movie] = []
    @Published var errorMessage: String?
    
    private let repository: MovieRepository

    init(repository: MovieRepository) {
        self.repository = repository
    }

    func fetchFavoriteMovies() async {
        favoriteMovies = await repository.getFavoriteMovies()
    }

    func removeFavorite(_ movie: Movie) async {
        do {
            try await repository.removeFavoriteMovie(movie)
            await fetchFavoriteMovies()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
*/

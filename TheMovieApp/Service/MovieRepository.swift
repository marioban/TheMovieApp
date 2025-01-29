//
//  MovieRepository.swift
//  TheMovieApp
//
//  Created by Mario Ban on 28.01.2025..
//

import SwiftUI
import SwiftData

protocol MovieRepositoryProtocol {
    func getFavoriteMovies() -> [Movie]
    func toggleFavorite(movie: Movie)
    func toggleWatched(movie: Movie)
}

class MovieRepository: MovieRepositoryProtocol {
    private let modelContext: ModelContext

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    func getFavoriteMovies() -> [Movie] {
        return []
    }

    func toggleFavorite(movie: Movie) {
        movie.favorite.toggle()
        try? modelContext.save()
    }

    func toggleWatched(movie: Movie) {
        movie.watched.toggle()
        try? modelContext.save()
    }
}

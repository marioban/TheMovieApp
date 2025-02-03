//
//  MovieRepository.swift
//  TheMovieApp
//
//  Created by Mario Ban on 28.01.2025..
//

import SwiftUI
import SwiftData

protocol MovieRepositoryProtocol: ObservableObject {
    var movies: [Movie] { get }
    func getFavoriteMovies() -> [Movie]
    func getWatchedMovies() -> [Movie]
    func saveMovies(_ movies: [Movie])
    func toggleFavorite(movie: Movie)
    func toggleWatched(movie: Movie)
}

class MovieRepository: ObservableObject, MovieRepositoryProtocol {
    let modelContext: ModelContext
    @Published var movies: [Movie] = []

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        loadMovies()
    }

    func loadMovies() {
        let descriptor = FetchDescriptor<Movie>()
        movies = (try? modelContext.fetch(descriptor)) ?? []
        objectWillChange.send() 
    }

    func getFavoriteMovies() -> [Movie] {
        return movies.filter { $0.favorite }
    }

    func getWatchedMovies() -> [Movie] {
        return movies.filter { $0.watched }
    }

    func saveMovies(_ movies: [Movie]) {
        for movie in movies {
            if !isMovieSaved(movie) {
                modelContext.insert(movie)
            }
        }
        try? modelContext.save()
        loadMovies()
    }

    private func isMovieSaved(_ movie: Movie) -> Bool {
        return movies.contains { $0.id == movie.id }
    }

    func toggleFavorite(movie: Movie) {
        movie.favorite.toggle()
        try? modelContext.save()
        loadMovies()
    }

    func toggleWatched(movie: Movie) {
        movie.watched.toggle()
        try? modelContext.save()
        loadMovies()
    }
}

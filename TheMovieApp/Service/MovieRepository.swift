//
//  MovieRepository.swift
//  TheMovieApp
//
//  Created by Mario Ban on 28.01.2025..
//

import SwiftUI
import SwiftData

protocol ModelContextProtocol {
    func fetch<T>(_ descriptor: FetchDescriptor<T>) throws -> [T]
    func insert(_ object: Movie)
    func save() throws
}

extension ModelContext: ModelContextProtocol { }

protocol MovieRepositoryProtocol: ObservableObject {
    var movies: [Movie] { get }
    func getFavoriteMovies() -> [Movie]
    func getWatchedMovies() -> [Movie]
    func saveMovies(_ movies: [Movie])
    func toggleFavorite(movie: Movie)
    func toggleWatched(movie: Movie)
    func getMovie(by id: Int) -> Movie?
}

class MovieRepository: ObservableObject, MovieRepositoryProtocol {
    
    let modelContext: ModelContextProtocol
    @Published var movies: [Movie] = []

    init(modelContext: ModelContextProtocol) {
        self.modelContext = modelContext
        loadMovies()
    }

    func getMovie(by id: Int) -> Movie? {
        return movies.first(where: { $0.id == id })
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
        return self.movies.contains { $0.id == movie.id }
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

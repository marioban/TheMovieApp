//
//  FavoritesViewModel.swift
//  TheMovieApp
//
//  Created by Mario Ban on 29.01.2025..
//

import SwiftUI
import SwiftData

@MainActor
class FavoritesViewModel: ObservableObject {
    private var modelContext: ModelContextProtocol

    @Published var favoriteMovies: [Movie] = []
    @Published var watchedMovies: [Movie] = []

    init(modelContext: ModelContextProtocol) {
        self.modelContext = modelContext
    }

    func loadMovies() {
        do {
            let favoriteFetch = FetchDescriptor<Movie>(predicate: #Predicate { $0.favorite })
            let watchedFetch = FetchDescriptor<Movie>(predicate: #Predicate { $0.watched })

            favoriteMovies = try modelContext.fetch(favoriteFetch)
            watchedMovies = try modelContext.fetch(watchedFetch)

            print("✅ Loaded \(favoriteMovies.count) favorite movies")
            print("✅ Loaded \(watchedMovies.count) watched movies")

        } catch {
            print("❌ Failed to fetch movies: \(error.localizedDescription)")
        }
    }

    func toggleFavorite(for movie: Movie) {
        movie.favorite.toggle()
        saveChanges()
    }

    func toggleWatched(for movie: Movie) {
        movie.watched.toggle()
        saveChanges()
    }

    private func saveChanges() {
        do {
            try modelContext.save()
            loadMovies() 
        } catch {
            print("❌ Failed to save changes: \(error.localizedDescription)")
        }
    }
}

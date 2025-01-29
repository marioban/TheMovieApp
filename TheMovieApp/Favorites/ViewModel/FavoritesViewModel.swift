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
    private var modelContext: ModelContext?

    @Published var favoriteMovies: [Movie] = []
    @Published var watchedMovies: [Movie] = []

    init(modelContext: ModelContext?) {
        self.modelContext = modelContext
    }

    func setModelContext(_ modelContext: ModelContext) {
        self.modelContext = modelContext
        loadMovies()
    }

    func loadMovies() {
        guard let modelContext else {
            print("ModelContext is nil, cannot load movies.")
            return
        }
        
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
        guard let modelContext else { return }
        movie.favorite.toggle()
        saveChanges()
    }

    func toggleWatched(for movie: Movie) {
        guard let modelContext else { return }
        movie.watched.toggle()
        saveChanges()
    }

    private func saveChanges() {
        guard let modelContext else { return }
        do {
            try modelContext.save()
            loadMovies() // Refresh UI
        } catch {
            print("❌ Failed to save changes: \(error.localizedDescription)")
        }
    }
}

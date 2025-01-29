//
//  MovieViewModel.swift
//  TheMovieApp
//
//  Created by Mario Ban on 29.01.2025..
//

import SwiftUI
import SwiftData

class MovieViewModel: ObservableObject {
    private var modelContext: ModelContext
    var movie: Movie
    
    init(movie: Movie, modelContext: ModelContext) {
        self.movie = movie
        self.modelContext = modelContext
    }
    
    func updateModelContext(_ newContext: ModelContext) {
        self.modelContext = newContext
    }

    func toggleFavorite() {
        movie.favorite.toggle()
        if !isMovieSaved(movie) {
            modelContext.insert(movie)
        }
        saveChanges()
    }

    func toggleWatched() {
        movie.watched.toggle()
        if !isMovieSaved(movie) {
            modelContext.insert(movie)
        }
        saveChanges()
    }

    private func isMovieSaved(_ movie: Movie) -> Bool {
        let descriptor = FetchDescriptor<Movie>()
        guard let allMovies = try? modelContext.fetch(descriptor) else {
            return false
        }
        return allMovies.contains { $0.id == movie.id }
    }

    private func saveChanges() {
        do {
            try modelContext.save()
            print("✅ Movie updated: \(movie.title) - Favorite: \(movie.favorite) - Watched: \(movie.watched)")
        } catch {
            print("❌ Failed to save movie changes: \(error.localizedDescription)")
        }
    }
}

//
//  FavoritesView.swift
//  TheMovieApp
//
//  Created by Mario Ban on 28.01.2025..
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    @State private var selected = 0
    @Environment(\.modelContext) private var modelContext
    @StateObject private var viewModel: FavoritesViewModel

    init() {
        _viewModel = StateObject(wrappedValue: FavoritesViewModel(modelContext: nil))
    }

    var body: some View {
        NavigationView {
            VStack {
                FavoritesHeaderView(selected: $selected)

                if selected == 0 {
                    if viewModel.favoriteMovies.isEmpty {
                        FavoritesEmptyStateView(imageName: "star.fill", message: "No favorite movies found.")
                    } else {
                        List(viewModel.favoriteMovies) { movie in
                            FavoriteMovieItemView(
                                movie: movie,
                                onToggleFavorite: { viewModel.toggleFavorite(for: movie) },
                                onToggleWatched: { viewModel.toggleWatched(for: movie) }
                            )
                        }
                    }
                } else {
                    if viewModel.watchedMovies.isEmpty {
                        FavoritesEmptyStateView(imageName: "checkmark.circle.fill", message: "No watched movies found.")
                    } else {
                        List(viewModel.watchedMovies) { movie in
                            FavoriteMovieItemView(
                                movie: movie,
                                onToggleFavorite: { viewModel.toggleFavorite(for: movie) },
                                onToggleWatched: { viewModel.toggleWatched(for: movie) }
                            )
                        }
                    }
                }
            }
            .onAppear {
                viewModel.setModelContext(modelContext)
                viewModel.loadMovies()
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Favorites")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(Color.white)
                }
            }
        }
    }
}

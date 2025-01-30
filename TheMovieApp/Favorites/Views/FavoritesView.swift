//
//  FavoritesView.swift
//  TheMovieApp
//
//  Created by Mario Ban on 28.01.2025..
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    @ObservedObject var repository: MovieRepository 
    @State private var selected = 0

    var body: some View {
        NavigationView {
            VStack {
                FavoritesHeaderView(selected: $selected)

                if selected == 0 {
                    if repository.getFavoriteMovies().isEmpty {
                        FavoritesEmptyStateView(imageName: "star.fill", message: "No favorite movies found.")
                    } else {
                        ScrollView {
                            LazyVStack {
                                ForEach(repository.getFavoriteMovies()) { movie in
                                    MovieRow(movie: movie, repository: repository)
                                        .swipeActions {
                                            Button(role: .destructive) {
                                                repository.toggleFavorite(movie: movie)
                                            } label: {
                                                Label("Remove", systemImage: "trash")
                                            }
                                        }
                                }
                            }
                        }
                    }
                } else {
                    if repository.getWatchedMovies().isEmpty {
                        FavoritesEmptyStateView(imageName: "checkmark.circle.fill", message: "No watched movies found.")
                    } else {
                        ScrollView {
                            LazyVStack {
                                ForEach(repository.getWatchedMovies()) { movie in
                                    MovieRow(movie: movie, repository: repository)
                                        .swipeActions {
                                            Button(role: .destructive) {
                                                repository.toggleWatched(movie: movie)
                                            } label: {
                                                Label("Remove", systemImage: "trash")
                                            }
                                        }
                                }
                            }
                        }
                    }
                }
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

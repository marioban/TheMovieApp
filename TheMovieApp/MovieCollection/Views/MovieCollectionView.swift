//
//  MovieCollectionView.swift
//  TheMovieApp
//
//  Created by Mario Ban on 28.01.2025..
//

import SwiftUI
import SwiftData

struct MovieCollectionView: View {
    @StateObject private var viewModel: MovieCollectionViewModel

    init() {
        _viewModel = StateObject(wrappedValue: MovieCollectionViewModel(apiService: APIService()))
    }

    var body: some View {
        NavigationView {
            VStack {
                MovieListView(
                    movies: viewModel.movies,
                    isLoadingNextPage: viewModel.isLoadingNextPage 
                ) { movie in
                    loadNextPageIfNeeded(for: movie)
                }
            }
            .navigationTitle("Top Rated Movies")
            .onAppear {
                fetchMovies()
            }
            .customBackground()
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Text("Top rated")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(Color.white)
            }
        }
    }

    private func fetchMovies() {
        Task {
            await viewModel.fetchTopRatedMovies(page: 1)
        }
    }

    private func loadNextPageIfNeeded(for movie: Movie) {
        Task {
            await viewModel.loadNextPageIfNeeded(currentMovie: movie)
        }
    }
}

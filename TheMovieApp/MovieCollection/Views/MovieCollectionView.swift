//
//  MovieCollectionView.swift
//  TheMovieApp
//
//  Created by Mario Ban on 28.01.2025..
//

import SwiftUI
import SwiftData

struct MovieCollectionView: View {
    @ObservedObject var repository: MovieRepository
    @StateObject private var viewModel: MovieCollectionViewModel

    init(repository: MovieRepository) {
        self.repository = repository
        _viewModel = StateObject(wrappedValue: MovieCollectionViewModel(apiService: APIService(), repository: repository))
    }

    var body: some View {
        NavigationView {
            VStack {
                MovieListView(
                    movies: repository.movies, // ✅ Now observes repository.movies
                    repository: repository,
                    isLoadingNextPage: viewModel.isLoadingNextPage
                ) { movie in
                    loadNextPageIfNeeded(for: movie)
                }
                .refreshable {
                    await fetchMovies()
                }
            }
            .navigationTitle("Top Rated Movies")
            .onAppear {
                Task {
                    await fetchMovies()
                }
            }
        }
        .customBackground()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Text("Top rated")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(Color.white)
            }
        }
    }

    private func fetchMovies() async {
        await viewModel.fetchTopRatedMovies(page: 1)
    }

    private func loadNextPageIfNeeded(for movie: Movie) {
        Task {
            await viewModel.loadNextPageIfNeeded(currentMovie: movie)
        }
    }
}

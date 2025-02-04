//
//  MovieCollectionView.swift
//  TheMovieApp
//
//  Created by Mario Ban on 28.01.2025..
//

import SwiftUI

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
                    movies: repository.movies,
                    repository: repository,
                    isLoadingNextPage: viewModel.isLoadingNextPage,
                    loadNextPage: { movie in
                        Task { await viewModel.loadNextPageIfNeeded(for: movie) }
                    }
                )
                .refreshable {
                    await viewModel.fetchTopRatedMovies(page: 1)
                }
            }
            .navigationTitle("Top Rated Movies")
            .onAppear {
                if repository.movies.isEmpty {
                    Task { await viewModel.fetchTopRatedMovies(page: 1) }
                }
            }
        }
        .customBackground()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Text("Top rated")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.white)
            }
        }
    }
}

//
//  MovieCollectionViewModel.swift
//  TheMovieApp
//
//  Created by Mario Ban on 29.01.2025..
//

import SwiftUI
import Combine

@MainActor
class MovieCollectionViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var isLoadingNextPage: Bool = false

    private let apiService: APIServiceProtocol
    private let repository: MovieRepository
    private var currentPage = 1
    private var canLoadMorePages = true

    init(apiService: APIServiceProtocol, repository: MovieRepository) {
        self.apiService = apiService
        self.repository = repository
        self.movies = repository.movies
    }

    func fetchTopRatedMovies(page: Int) async {
        guard !isLoadingNextPage else { return }
        isLoadingNextPage = true

        do {
            let newMovies = try await apiService.fetchTopRatedMovies(page: page)
            if newMovies.isEmpty {
                canLoadMorePages = false
            } else {
                repository.saveMovies(newMovies)
                movies = repository.movies
                currentPage = page
            }
        } catch {
            print("Error fetching top-rated movies: \(error)")
        }

        isLoadingNextPage = false
    }

    func loadNextPageIfNeeded(currentMovie: Movie) async {
        guard let lastMovie = movies.last, canLoadMorePages else { return }
        if currentMovie.id == lastMovie.id {
            await fetchTopRatedMovies(page: currentPage + 1)
        }
    }
}

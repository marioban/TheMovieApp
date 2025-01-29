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
    private var currentPage = 1
    private var canLoadMorePages = true

    init(apiService: APIServiceProtocol) {
        self.apiService = apiService
    }

    func fetchTopRatedMovies(page: Int) async {
        guard !isLoadingNextPage else { return }
        isLoadingNextPage = true

        do {
            let newMovies = try await apiService.fetchTopRatedMovies(page: page)
            if newMovies.isEmpty {
                canLoadMorePages = false
            } else {
                movies.append(contentsOf: newMovies)
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


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
    @Published var isLoadingNextPage: Bool = false
    
    private let apiService: APIServiceProtocol
    private let repository: MovieRepository
    private var currentPage = 1
    private var totalPages = 1
    
    private var canLoadMorePages: Bool {
        currentPage < totalPages
    }
    
    init(apiService: APIServiceProtocol, repository: MovieRepository) {
        self.apiService = apiService
        self.repository = repository
    }
    
    func fetchTopRatedMovies(page: Int, isRefresh: Bool = false) async {
        guard !isLoadingNextPage else { return }
        isLoadingNextPage = true
        
        do {
            if isRefresh && page == 1 {
                repository.clearMovies()
            }
            
            if page == 1 {
                totalPages = try await apiService.fetchTotalPages()
            }
            
            let newMovies = try await apiService.fetchTopRatedMovies(page: page)
            
            if !newMovies.isEmpty {
                repository.saveMovies(newMovies)
                currentPage = page
            }
        } catch {
            print("Error fetching top-rated movies: \(error)")
        }
        
        isLoadingNextPage = false
    }
    
    func loadNextPageIfNeeded(for currentMovie: Movie) async {
        guard let lastMovie = repository.movies.last, canLoadMorePages else { return }
        if currentMovie.id == lastMovie.id {
            await fetchTopRatedMovies(page: currentPage + 1)
        }
    }
}

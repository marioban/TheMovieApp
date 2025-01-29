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
    private let apiService: APIServiceProtocol

    init(apiService: APIServiceProtocol) {
        self.apiService = apiService
    }

    func fetchTopRatedMovies(page: Int) async {
        do {
            movies = try await apiService.fetchTopRatedMovies(page: page)
        } catch {
            print("Error fetching top-rated movies: \(error)")
        }
    }
}


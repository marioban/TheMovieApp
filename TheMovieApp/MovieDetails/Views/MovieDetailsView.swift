//
//  MovieDetailsView.swift
//  TheMovieApp
//
//  Created by Mario Ban on 28.01.2025..
//

import SwiftUI
import SwiftData

struct MovieDetailsView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel: MovieDetailsViewModel
    @ObservedObject var movie: Movie
    let repository: MovieRepository

    var imageUrl: String {
        if let poster = movie.posterPath {
            return "https://media.themoviedb.org/t/p/w500/\(poster)"
        }
        return ""
    }

    init(movie: Movie, repository: MovieRepository) {
        self.movie = movie
        self.repository = repository
        _viewModel = StateObject(wrappedValue: MovieDetailsViewModel(
            movieID: movie.id,
            apiService: APIService(),
            modelContext: repository.modelContext,
            repository: repository
        ))
    }

    private var releaseYear: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let date = formatter.date(from: movie.releaseDate) {
            return String(Calendar.current.component(.year, from: date))
        }
        return "N/A"
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 16) {
                MoviePosterView(imageUrl: imageUrl)
                MovieInfoView(movieTitle: movie.title, releaseYear: releaseYear, overview: movie.overview, genres: movie.genres?.map{ $0.name} ?? [])
                SimilarMoviesView(viewModel: viewModel, repository: repository)
            }
            .padding(.bottom)
        }
        .ignoresSafeArea(edges: .top)
        .background(Color.black.ignoresSafeArea())
        .navigationBarBackButtonHidden(true)
        .overlay(
            NavigationOverlay(movie: movie, dismiss: dismiss, repository: repository),
            alignment: .topLeading
        )
        .onAppear {
            Task {
                await viewModel.fetchMovieDetails()
                await viewModel.fetchSimilarMovies(page: 1)
            }
        }

    }
}

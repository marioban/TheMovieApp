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
    
    let movie: Movie
    var imageUrl: String
    var movieTitle: String
    var releaseDate: String
    var overview: String
    var repository: MovieRepository
    
    init(movie: Movie, imageUrl: String, movieTitle: String, releaseDate: String, overview: String, repository: MovieRepository) {
        self.movie = movie
        self.imageUrl = imageUrl
        self.movieTitle = movieTitle
        self.releaseDate = releaseDate
        self.overview = overview
        self.repository = repository
        
        _viewModel = StateObject(wrappedValue: MovieDetailsViewModel(
            movieID: movie.id,
            apiService: APIService(),
            modelContext: repository.modelContext
        ))
    }
    
    private var releaseYear: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: releaseDate) {
            let calendar = Calendar.current
            return "\(calendar.component(.year, from: date))"
        }
        return "N/A"
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 16) {
                MoviePosterView(imageUrl: imageUrl)
                MovieInfoView(movieTitle: movieTitle, releaseYear: releaseYear, overview: overview)
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
    }
}

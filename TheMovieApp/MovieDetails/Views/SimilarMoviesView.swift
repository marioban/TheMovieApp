//
//  SimilarMoviesView.swift
//  TheMovieApp
//
//  Created by Mario Ban on 03.02.2025..
//

import SwiftUI

struct SimilarMoviesView: View {
    @ObservedObject var viewModel: MovieDetailsViewModel
    let repository: MovieRepository

    var body: some View {
        VStack(alignment: .leading) {
            Text("Similar movies:")
                .font(.title2)
                .bold()
                .foregroundColor(.white)
                .padding(.horizontal)
                .padding(.bottom, 8)
            
            if viewModel.isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity, alignment: .center)
            } else {
                let movies = viewModel.similarMovies.map { repository.getMovie(by: $0.id) ?? $0 }
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 16) {
                        if movies.isEmpty {
                            Text("No similar movies found.")
                                .foregroundColor(.blue)
                                .font(.title2)
                                .padding()
                        } else {
                            ForEach(movies) { similarMovie in
                                MovieRow(movie: similarMovie, repository: repository)
                                    .frame(width: 400, height: 275)
                                    .background(Color.black.opacity(0.8))
                                    .cornerRadius(12)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .frame(height: 400)
            }
        }
    }
}

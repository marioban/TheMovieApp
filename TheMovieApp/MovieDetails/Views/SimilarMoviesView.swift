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
        if viewModel.isLoading {
            ProgressView()
                .frame(maxWidth: .infinity, alignment: .center)
        } else {
            VStack (alignment: .leading) {
                Text("Similar movies:")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.bottom,8)

                
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 16) {
                        if viewModel.similarMovies.isEmpty {
                            Text("No similar movies found.")
                                .foregroundColor(.blue)
                                .font(.title2)
                                .padding()
                        } else {
                            ForEach(viewModel.similarMovies, id: \.id) { similarMovie in
                                MovieRow(movie: similarMovie, repository: repository)
                                    .frame(width: 400, height: 275)
                                    .background(Color.black.opacity(0.8))
                                    .cornerRadius(12)
                            }
                        }
                    }
                }
                .frame(height: 400)
                .onAppear {
                    if !viewModel.isLoading && viewModel.similarMovies.isEmpty {
                        Task {
                            await viewModel.fetchSimilarMovies(page: 1)
                        }
                    }
                }
            }
        }
        
    }
}

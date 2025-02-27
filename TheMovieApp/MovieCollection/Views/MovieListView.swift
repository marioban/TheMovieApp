//
//  MovieListView.swift
//  TheMovieApp
//
//  Created by Mario Ban on 29.01.2025..
//

import SwiftUI

struct MovieListView: View {
    let movies: [Movie]
    let repository: MovieRepository
    let isLoadingNextPage: Bool
    let loadNextPage: (Movie) -> Void

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 16) {
                ForEach(movies) { movie in
                    MovieRow(movie: movie, repository: repository)
                        .onAppear {
                            loadNextPage(movie)
                        }
                }
                if isLoadingNextPage {
                    ProgressView()
                        .padding()
                }
            }
            .padding(.bottom, 16)
        }
        .background(Color.gray.opacity(0.2))
    }
}

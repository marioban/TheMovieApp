//
//  MovieRow.swift
//  TheMovieApp
//
//  Created by Mario Ban on 29.01.2025..
//

import SwiftUI

struct MovieRow: View {
    @ObservedObject var movie: Movie
    let repository: MovieRepository

    var body: some View {
        NavigationLink {
            if let posterPath = movie.posterPath {
                MovieDetailsView(movie: movie, repository: repository)
            } else {
                Text("Movie Details Unavailable")
                    .foregroundColor(.red)
            }
        } label: {
            MovieItemCardView(movie: movie, repository: repository)
                .padding(.horizontal)
                .padding(.bottom, 8)
        }
    }
}

//
//  MovieRow.swift
//  TheMovieApp
//
//  Created by Mario Ban on 29.01.2025..
//

import SwiftUI

struct MovieRow: View {
    let movie: Movie
    let repository: MovieRepository

    var body: some View {
        NavigationLink(destination: {
            if let posterPath = movie.posterPath {
                MovieDetailsView(
                    movie: movie,
                    imageUrl: "https://media.themoviedb.org/t/p/w500/\(posterPath)",
                    movieTitle: movie.title,
                    releaseDate: movie.releaseDate,
                    overview: movie.overview, repository: repository
                )
            } else {
                Text("Movie Details Unavailable")
                    .foregroundColor(.red)
            }
        }) {
            MovieItemCardView(movie: movie, repository: repository) 
                .padding(.horizontal)
                .padding(.bottom, 8)
        }
    }
}

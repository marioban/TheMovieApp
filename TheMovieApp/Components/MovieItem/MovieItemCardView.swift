//
//  MovieItemView.swift
//  TheMovieApp
//
//  Created by Mario Ban on 28.01.2025..
//

import SwiftUI

struct MovieItemCardView: View {
    @ObservedObject var movie: Movie
    let repository: MovieRepository

    var body: some View {
        ZStack(alignment: .leading) {
            HStack {
                MovieImageView(
                    imageUrl: "https://image.tmdb.org/t/p/w500\(movie.posterPath ?? "")",
                    releaseDate: movie.releaseDate
                )
                .padding(.trailing)

                VStack(alignment: .leading) {
                    Text(movie.title)
                        .lineLimit(2)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.bottom, 8)

                    Text(movie.overview)
                        .font(.subheadline)
                        .lineLimit(3)
                        .foregroundColor(.white)
                        .padding(.bottom, 8)

                    HStack {
                        Spacer()
                        MovieButtonsView(movie: movie, repository: repository)
                    }
                }
                .padding(.trailing, 8)
                .padding(.vertical, 4)
            }
            .movieItemBackground() 
            .cornerRadius(20)
        }
    }
}

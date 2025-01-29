//
//  MovieItemView.swift
//  TheMovieApp
//
//  Created by Mario Ban on 28.01.2025..
//

import SwiftUI

struct MovieItemCardView: View {
    let movie: Movie
    
    var body: some View {
        ZStack (alignment: .leading) {
            HStack {
                MovieImageView(imageUrl: "https://image.tmdb.org/t/p/w500\(movie.posterPath ?? "")")
                    .padding(.trailing)
                
                VStack(alignment: .leading) {
                    Text(movie.title)
                        .lineLimit(2)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.bottom,8)
                    
                    Text(movie.overview)
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .lineLimit(3)
                        .foregroundColor(.white)
                        .padding(.bottom,8)
                    
                    
                    HStack {
                        Spacer()
                        MovieButtonsView()
                    }
                }
                .padding(.trailing,8)
                .padding(.vertical,4)
            }
            .movieItemBackground()
            .cornerRadius(20)
        }
    }
}

#Preview {
    MovieItemCardView(movie: Movie(
        dto: MovieDTO(
            id: 1,
            adult: false,
            backdropPath: nil,
            genreIDs: [18],
            genres: nil,
            originalLanguage: "en",
            originalTitle: "The Godfather",
            overview: "Overview",
            popularity: 100.0,
            posterPath: "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/3bhkrj58Vtu7enYsRolD1fZdja1.jpg",
            releaseDate: "1972-03-14",
            title: "The Godfather",
            video: false,
            voteAverage: 8.5,
            voteCount: 200
        )
    ))
}

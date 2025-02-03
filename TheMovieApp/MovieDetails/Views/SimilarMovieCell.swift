//
//  SimilarMovieCell.swift
//  TheMovieApp
//
//  Created by Mario Ban on 03.02.2025..
//

import SwiftUI

struct SimilarMovieCell: View {
    let movie: Movie
    
    var body: some View {
        VStack {
            if let posterPath = movie.posterPath {
                AsyncImage(url: URL(string: "https://media.themoviedb.org/t/p/w500/\(posterPath)")) { image in
                    image.resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 180)
                } placeholder: {
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 120, height: 180)
                }
            }
            
            Text(movie.title)
                .font(.caption)
                .foregroundColor(.white)
                .frame(width: 120)
                .multilineTextAlignment(.center)
        }
        .frame(width: 130)
    }
}

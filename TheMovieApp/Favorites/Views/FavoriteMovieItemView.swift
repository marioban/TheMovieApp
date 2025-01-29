//
//  FavoriteMovieItemView.swift
//  TheMovieApp
//
//  Created by Mario Ban on 29.01.2025..
//

import SwiftUI

struct FavoriteMovieItemView: View {
    let movie: Movie
    let onToggleFavorite: () -> Void
    let onToggleWatched: () -> Void

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "https://media.themoviedb.org/t/p/w500/\(movie.posterPath ?? "")")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 90)
                    .cornerRadius(8)
            } placeholder: {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 60, height: 90)
                    .cornerRadius(8)
            }

            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text("Released: \(movie.releaseDate.prefix(4))")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()

            VStack {
                Button(action: onToggleFavorite) {
                    Image(systemName: movie.favorite ? "star.fill" : "star")
                        .foregroundColor(movie.favorite ? .yellow : .gray)
                }
                .buttonStyle(.plain)
                
                Button(action: onToggleWatched) {
                    Image(systemName: movie.watched ? "checkmark.circle.fill" : "checkmark.circle")
                        .foregroundColor(movie.watched ? .green : .gray)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.vertical, 8)
        .swipeActions {
            Button(role: .destructive, action: onToggleFavorite) {
                Label(movie.favorite ? "Favorite" :"Unfavorite", systemImage: "star.slash.fill")
            }
            .tint(.red)
            
            Button(action: onToggleWatched) {
                Label(movie.watched ? "Did watch" :"Didn't watch", systemImage: "eye.slash.fill")
            }
            .tint(.blue)
        }
    }
}

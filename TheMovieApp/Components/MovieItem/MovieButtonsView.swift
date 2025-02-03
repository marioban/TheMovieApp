//
//  MovieButtonsView.swift
//  TheMovieApp
//
//  Created by Mario Ban on 28.01.2025..
//

import SwiftUI
import SwiftData

struct MovieButtonsView: View {
    let movie: Movie
    let repository: MovieRepository 

    var body: some View {
        HStack {
            Button {
                repository.toggleFavorite(movie: movie)
            } label: {
                ZStack {
                    favoriteImage(Image(systemName: "star.fill"), show: movie.favorite)
                    favoriteImage(Image(systemName: "star"), show: !movie.favorite)
                }
            }

            Button {
                repository.toggleWatched(movie: movie)
            } label: {
                ZStack {
                    watchedImage(Image(systemName: "checkmark.seal.fill"), show: movie.watched)
                    watchedImage(Image(systemName: "checkmark.seal"), show: !movie.watched)
                }
            }
        }
        .frame(width: 200)
    }

    func favoriteImage(_ image: Image, show: Bool) -> some View {
        image
            .tint(.teal)
            .font(.system(size: 60))
            .scaleEffect(show ? 1 : 0)
            .opacity(show ? 1 : 0)
            .animation(.interpolatingSpring(stiffness: 170, damping: 15), value: show)
    }

    func watchedImage(_ image: Image, show: Bool) -> some View {
        image
            .tint(.teal)
            .font(.system(size: 60))
            .scaleEffect(show ? 1 : 0)
            .opacity(show ? 1 : 0)
            .animation(.interpolatingSpring(stiffness: 170, damping: 15), value: show)
    }
}

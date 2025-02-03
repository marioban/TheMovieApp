//
//  MovieButtonsView.swift
//  TheMovieApp
//
//  Created by Mario Ban on 28.01.2025..
//

import SwiftUI

struct MovieButtonsView: View {
    @ObservedObject var movie: Movie
    let repository: MovieRepository

    var body: some View {
        HStack {
            Button {
                repository.toggleFavorite(movie: movie)
            } label: {
                ZStack {
                    iconImage(systemName: "star.fill", isActive: movie.favorite)
                    iconImage(systemName: "star", isActive: !movie.favorite)
                }
            }

            Button {
                repository.toggleWatched(movie: movie)
            } label: {
                ZStack {
                    iconImage(systemName: "checkmark.seal.fill", isActive: movie.watched)
                    iconImage(systemName: "checkmark.seal", isActive: !movie.watched)
                }
            }
        }
        .frame(width: 200)
    }

    private func iconImage(systemName: String, isActive: Bool) -> some View {
        Image(systemName: systemName)
            .tint(.teal)
            .font(.system(size: 60))
            .scaleEffect(isActive ? 1 : 0)
            .opacity(isActive ? 1 : 0)
            .animation(.interpolatingSpring(stiffness: 170, damping: 15), value: isActive)
    }
}

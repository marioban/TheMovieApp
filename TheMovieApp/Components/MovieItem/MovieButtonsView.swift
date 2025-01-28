//
//  MovieButtonsView.swift
//  TheMovieApp
//
//  Created by Mario Ban on 28.01.2025..
//

import SwiftUI

struct MovieButtonsView: View {
    @State private var isFavorite: Bool = false
    @State private var isWatched: Bool = false
    
    var body: some View {
        HStack {
            Button {
                self.isFavorite.toggle()
            } label: {
                ZStack {
                    favoriteImage(Image(systemName: "star.fill"), show: isFavorite)
                    favoriteImage(Image(systemName: "star"), show: !isFavorite)
                }
            }
            
            Button {
                self.isWatched.toggle()
            } label: {
                ZStack {
                    watchedImage(Image(systemName: "checkmark.seal.fill"), show: isWatched)
                    watchedImage(Image(systemName: "checkmark.seal"), show: !isWatched)
                }
            }
        }
        .frame(width: 200)
    }
    
    func favoriteImage(_ image: Image, show: Bool) -> some View {
        image
            .tint(isFavorite ? .teal : .teal)
            .font(.system(size: 60))
            .scaleEffect(show ? 1 : 0)
            .opacity(show ? 1 : 0)
            .animation(.interpolatingSpring(stiffness: 170, damping: 15), value: show)
    }
    
    func watchedImage(_ image: Image, show: Bool) -> some View {
        image
            .tint(isWatched ? .teal : .teal)
            .font(.system(size: 60))
            .scaleEffect(show ? 1 : 0)
            .opacity(show ? 1 : 0)
            .animation(.interpolatingSpring(stiffness: 170, damping: 15), value: show)
    }
}

#Preview {
    MovieButtonsView()
}

//
//  MovieButtonsView.swift
//  TheMovieApp
//
//  Created by Mario Ban on 28.01.2025..
//

import SwiftUI
import SwiftData

struct MovieButtonsView: View {
    @Environment(\.modelContext) private var modelContext
    private let movie: Movie
    @StateObject private var viewModel: MovieViewModel
    
    init(movie: Movie) {
        self.movie = movie
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: Movie.self, configurations: config)
        _viewModel = StateObject(wrappedValue: MovieViewModel(movie: movie, modelContext: container.mainContext))
    }
    
    var body: some View {
        HStack {
            Button {
                viewModel.updateModelContext(modelContext)
                viewModel.toggleFavorite()
            } label: {
                ZStack {
                    favoriteImage(Image(systemName: "star.fill"), show: viewModel.movie.favorite)
                    favoriteImage(Image(systemName: "star"), show: !viewModel.movie.favorite)
                }
            }
            
            Button {
                viewModel.updateModelContext(modelContext)
                viewModel.toggleWatched()
            } label: {
                ZStack {
                    watchedImage(Image(systemName: "checkmark.seal.fill"), show: viewModel.movie.watched)
                    watchedImage(Image(systemName: "checkmark.seal"), show: !viewModel.movie.watched)
                }
            }
        }
        .frame(width: 200)
    }
    
    // MARK: - Animation Helpers
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

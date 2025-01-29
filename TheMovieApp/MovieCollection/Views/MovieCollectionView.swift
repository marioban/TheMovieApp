//
//  MovieCollectionView.swift
//  TheMovieApp
//
//  Created by Mario Ban on 28.01.2025..
//

import SwiftUI
import SwiftData

struct MovieCollectionView: View {
    @StateObject private var viewModel: MovieCollectionViewModel

    init() {
        _viewModel = StateObject(wrappedValue: MovieCollectionViewModel(apiService: APIService()))
    }

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 16) {
                    ForEach(viewModel.movies, id: \.id) { movie in
                        MovieItemCardView(movie: movie)
                            .padding(.horizontal)
                            .padding(.bottom,8)
                            
                    }
                }
            }
            .background(Color.gray.opacity(0.2))
            .navigationTitle("Top Rated Movies")
            .onAppear {
                Task {
                    await viewModel.fetchTopRatedMovies(page: 1)
                }
            }
            .customBackground()
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Text("Top rated")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(Color.white)
            }
        }
    }
}

#Preview {
    MovieCollectionView()
}

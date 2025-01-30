//
//  MainTabView.swift
//  TheMovieApp
//
//  Created by Mario Ban on 28.01.2025..
//

import SwiftUI
import SwiftData

struct MainTabView: View {
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        let repository = MovieRepository(modelContext: modelContext)

        TabView {
            MovieCollectionView(repository: repository)
                .tabItem {
                    Image(systemName: "movieclapper")
                        .imageScale(.large)
                    Text("Movie Collection")
                }

            FavoritesView(repository: repository)
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Favorites")
                }
        }
    }
}

//
//  MainTabView.swift
//  TheMovieApp
//
//  Created by Mario Ban on 28.01.2025..
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            
            MovieCollectionView()
                .tabItem {
                    Image(systemName: "movieclapper")
                        .imageScale(.large)
                    Text("Movie Collection")
                }
            
            FavoritesView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Favorites")
                }
            
        }
    }
}

#Preview {
    MainTabView()
}

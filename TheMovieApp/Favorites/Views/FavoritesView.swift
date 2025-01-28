//
//  FavoritesView.swift
//  TheMovieApp
//
//  Created by Mario Ban on 28.01.2025..
//

import SwiftUI

struct FavoritesView: View {
    @State private var selected = 0
    
    var body: some View {
        NavigationView {
            VStack {
                FavoritesHeaderView(selected: $selected)
                FavoritesEmptyStateView(imageName: "star.fill", message: "No favorite movies found.")
                
               // if selected == 0 {
               //     if favoriteFeeds.isEmpty {
               //         FavoritesEmptyStateView(imageName: "newspaper", message: "No favorite feeds found.")
               //     } else {
               //         FavoriteFeedsListView(feeds: favoriteFeeds)
               //     }
               // } else {
               //     if favoriteArticles.isEmpty {
               //         FavoritesEmptyStateView(imageName: "magnifyingglass", message: "No favorite articles found.")
               //     } else {
               //         FavoriteArticlesListView(articles: favoriteArticles)
               //     }
               // }
                
            }
            .customBackground()
        }

        .toolbar{
            ToolbarItem(placement: .topBarLeading) {
                Text("Favorites")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(Color.white)
            }
        }
    }
}

#Preview {
    FavoritesView()
}

//
//  MovieCollectionView.swift
//  TheMovieApp
//
//  Created by Mario Ban on 28.01.2025..
//

import SwiftUI

struct MovieCollectionView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("MOVIE COLLECTION")
            }
            .customBackground()
        }
        .toolbar{
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

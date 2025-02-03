//
//  MoviePosterView.swift
//  TheMovieApp
//
//  Created by Mario Ban on 03.02.2025..
//

import SwiftUI

struct MoviePosterView: View {
    let imageUrl: String
    
    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .ignoresSafeArea(edges: .top)
        } placeholder: {
            Rectangle()
                .fill(Color.gray)
                .frame(height: 300)
                .cornerRadius(12)
                .padding(.horizontal)
        }
    }
}

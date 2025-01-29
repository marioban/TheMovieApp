//
//  MovieRow.swift
//  TheMovieApp
//
//  Created by Mario Ban on 29.01.2025..
//


import SwiftUI

struct MovieRow: View {
    let movie: Movie
    
    var body: some View {
        MovieItemCardView(movie: movie)
            .padding(.horizontal)
            .padding(.bottom, 8)
    }
}

//
//  MovieInfoView.swift
//  TheMovieApp
//
//  Created by Mario Ban on 03.02.2025..
//

import SwiftUI

struct MovieInfoView: View {
    let movieTitle: String
    let releaseYear: String
    let overview: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(movieTitle)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
                .padding(.horizontal)
            
            Text("Release year:")
                .font(.title2)
                .bold()
                .foregroundColor(.white)
                .padding(.horizontal)
            Text(releaseYear)
                .font(.title3)
                .foregroundColor(.white)
                .padding(.horizontal)
            
            Text("Description:")
                .font(.title2)
                .bold()
                .foregroundColor(.white)
                .padding(.horizontal)
            Text(overview)
                .font(.body)
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
        }
    }
}

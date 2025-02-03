//
//  NavigationOverlay.swift
//  TheMovieApp
//
//  Created by Mario Ban on 03.02.2025..
//

import SwiftUI

struct NavigationOverlay: View {
    let movie: Movie
    let dismiss: DismissAction
    let repository: MovieRepository
    
    var body: some View {
        HStack {
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "arrow.backward")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.6))
                    .clipShape(Circle())
            }
            Spacer()
            
            MovieButtonsView(movie: movie, repository: repository)
                .frame(width: 200, height: 100)
        }
        .padding(.leading, 8)
    }
}

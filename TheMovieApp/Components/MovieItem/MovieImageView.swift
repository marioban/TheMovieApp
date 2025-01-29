//
//  MovieImageView.swift
//  TheMovieApp
//
//  Created by Mario Ban on 28.01.2025..
//

import SwiftUI

struct MovieImageView: View {
    let imageUrl: String?

    var body: some View {
        if let imageUrlString = imageUrl, let imageUrl = URL(string: imageUrlString) {
            ZStack(alignment: .bottom) {
                AsyncImage(url: imageUrl) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .clipped()
                        .cornerRadius(20)
                } placeholder: {
                    PlaceholderView()
                }

                MovieImageOverlayView(year: "2021")
            }
        } else {
            PlaceholderView()
        }
    }
}

#Preview {
    MovieImageView(imageUrl: "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/3bhkrj58Vtu7enYsRolD1fZdja1.jpg")
}

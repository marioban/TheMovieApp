//
//  MovieImageView.swift
//  TheMovieApp
//
//  Created by Mario Ban on 28.01.2025..
//

import SwiftUI

struct MovieImageView: View {
    let imageUrl: String?
    let releaseDate: String?
    
    private var releaseYear: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: releaseDate ?? "") {
            let calendar = Calendar.current
            return "\(calendar.component(.year, from: date))"
        }
        return "N/A"
    }

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

                MovieImageOverlayView(year: releaseYear)
            }
        } else {
            PlaceholderView()
        }
    }
}

//
//  MovieItemView.swift
//  TheMovieApp
//
//  Created by Mario Ban on 28.01.2025..
//

import SwiftUI

struct MovieItemView: View {
    var body: some View {
        
        ZStack (alignment: .leading) {
            HStack {
                MovieImageView(imageUrl: "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/3bhkrj58Vtu7enYsRolD1fZdja1.jpg")
                
                
                VStack(alignment: .leading) {
                    Text("The Matrix Resurrections")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Text("Action, Adventure, Sci-Fi")
                        .font(.caption)
                        .foregroundColor(.white)
                }
            }
        }
        .customBackground()
    }
}

#Preview {
    MovieItemView()
}

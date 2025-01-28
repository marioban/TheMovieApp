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
                    .padding(.trailing)
                
                VStack(alignment: .leading) {
                    Text("Fantastic beasts: The crimes of Grindelwald")
                        .lineLimit(2)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    Text("Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam voluptua.")
                        .font(.subheadline)
                        .fontWeight(.thin)
                        .foregroundColor(.white)
                    
                    
                    
                    HStack {
                        Spacer()
                        MovieButtonsView()
                    }
                }
                .padding(.trailing,8)
                .padding(.vertical,4)
            }
        }
        .customBackground()
    }
}

#Preview {
    MovieItemView()
}

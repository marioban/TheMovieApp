//
//  MovieImageOverlayView.swift
//  TheMovieApp
//
//  Created by Mario Ban on 28.01.2025..
//

import SwiftUI

struct MovieImageOverlayView: View {
    let year: String
    
    var body: some View {
        VStack(alignment: .center) {
            Text(year)
                .font(.headline)
                .foregroundColor(.white)
        }
        .frame(alignment: .center)
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.black, Color.clear]),
                startPoint: .bottom,
                endPoint: .top
            )
            .cornerRadius(10)
        )
    }
}

#Preview {
    MovieImageOverlayView(year: "2019")
}

//
//  MovieDetailsView.swift
//  TheMovieApp
//
//  Created by Mario Ban on 28.01.2025..
//

import SwiftUI

struct MovieDetailsView: View {
    @Environment(\.dismiss) private var dismiss
    let imageUrl: String
    let movieTitle: String
    let releaseDate: String
    let overview: String

    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 16) {
                // Full-screen image
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

                VStack(alignment: .leading, spacing: 12) {
                    Text(movieTitle)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.horizontal)

                    Text("Released: \(releaseDate)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.horizontal)

                    Text(overview)
                        .font(.body)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal)
                }
            }
            .padding(.bottom)
        }
        .ignoresSafeArea(edges: .top)
        .background(Color.black.ignoresSafeArea())
        .navigationBarBackButtonHidden(true)
        .overlay(
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
                
                MovieButtonsView()
                    .frame(width: 200, height: 100)
            }
                .padding(.leading,8)
            , alignment: .topLeading
        )
    }
}

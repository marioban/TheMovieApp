//
//  MovieItemBackgroundModifier.swift
//  TheMovieApp
//
//  Created by Mario Ban on 28.01.2025..
//

import SwiftUI

struct MovieItemBackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                Color(red: 0.149, green: 0.149, blue: 0.149)
                    .ignoresSafeArea()
            )
    }
}

extension View {
    func movieItemBackground() -> some View {
        self.modifier(MovieItemBackgroundModifier())
    }
}

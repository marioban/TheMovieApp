//
//  BackgroundModifier.swift
//  TheMovieApp
//
//  Created by Mario Ban on 28.01.2025..
//

import SwiftUI

struct BackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                Color(red: 0, green: 0.067, blue: 0.157) 
                    .ignoresSafeArea()
            )
    }
}

extension View {
    func customBackground() -> some View {
        self.modifier(BackgroundModifier())
    }
}

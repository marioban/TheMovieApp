//
//  FavoritesHeaderView.swift
//  TheMovieApp
//
//  Created by Mario Ban on 28.01.2025..
//

import SwiftUI

struct FavoritesHeaderView: View {
    @Binding var selected: Int
    
    var body: some View {
        HStack {
            Picker("", selection: $selected) {
                Text("Favorite Movies").tag(0)
                Text("Watched Movies").tag(1)
            }
            .pickerStyle(.segmented)
        }
        .padding()
    }
}

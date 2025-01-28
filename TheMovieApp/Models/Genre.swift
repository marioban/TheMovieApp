//
//  Genre.swift
//  TheMovieApp
//
//  Created by Mario Ban on 28.01.2025..
//

import SwiftUI

struct Genre: Decodable {
    let id: Int
    let name: String
}

struct GenreResponse: Decodable {
    let genres: [Genre]
}

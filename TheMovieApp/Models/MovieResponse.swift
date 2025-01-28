//
//  MovieResponse.swift
//  TheMovieApp
//
//  Created by Mario Ban on 28.01.2025..
//

import SwiftUI

class MovieResponse: Decodable {
    let page: Int
    let totalPages: Int
    let totalResults: Int
    let results: [MovieDTO]
}

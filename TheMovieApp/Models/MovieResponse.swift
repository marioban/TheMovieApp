//
//  MovieResponse.swift
//  TheMovieApp
//
//  Created by Mario Ban on 28.01.2025..
//

import SwiftUI
import SwiftData

@Model
class MovieResponse {
    @Attribute(.unique) var id: UUID
    var page: Int
    var totalPages: Int
    var totalResults: Int
    var results: [Movie]

    init(page: Int, totalPages: Int, totalResults: Int, results: [Movie]) {
        self.id = UUID()
        self.page = page
        self.totalPages = totalPages
        self.totalResults = totalResults
        self.results = results
    }
}

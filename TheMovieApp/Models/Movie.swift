//
//  Movie.swift
//  TheMovieApp
//
//  Created by Mario Ban on 28.01.2025..w
//

import SwiftUI

import SwiftData

@Model
class Movie {
    @Attribute(.unique) var id: Int
    var adult: Bool
    var backdropPath: String
    var genreIDs: [Int]
    var originalLanguage: String
    var originalTitle: String
    var overview: String
    var popularity: Double
    var posterPath: String
    var releaseDate: String
    var title: String
    var video: Bool
    var voteAverage: Double
    var voteCount: Int

    init(
        id: Int,
        adult: Bool,
        backdropPath: String,
        genreIDs: [Int],
        originalLanguage: String,
        originalTitle: String,
        overview: String,
        popularity: Double,
        posterPath: String,
        releaseDate: String,
        title: String,
        video: Bool,
        voteAverage: Double,
        voteCount: Int
    ) {
        self.id = id
        self.adult = adult
        self.backdropPath = backdropPath
        self.genreIDs = genreIDs
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.title = title
        self.video = video
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
}

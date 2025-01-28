//
//  Movie.swift
//  TheMovieApp
//
//  Created by Mario Ban on 28.01.2025..w
//

import SwiftUI
import SwiftData

struct MovieDTO: Decodable {
    let id: Int
    let adult: Bool
    let backdropPath: String
    let genreIDs: [Int]
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    private enum CodingKeys: String, CodingKey {
        case id, adult, overview, popularity, title, video
        case backdropPath = "backdrop_path"
        case genreIDs = "genre_ids"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}


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
    var favorite: Bool = false

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
        voteCount: Int,
        favorite: Bool = false
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
        self.favorite = favorite
    }

    // Convenience initializer for DTO conversion
    convenience init(dto: MovieDTO) {
        self.init(
            id: dto.id,
            adult: dto.adult,
            backdropPath: dto.backdropPath,
            genreIDs: dto.genreIDs,
            originalLanguage: dto.originalLanguage,
            originalTitle: dto.originalTitle,
            overview: dto.overview,
            popularity: dto.popularity,
            posterPath: dto.posterPath,
            releaseDate: dto.releaseDate,
            title: dto.title,
            video: dto.video,
            voteAverage: dto.voteAverage,
            voteCount: dto.voteCount
        )
    }
}

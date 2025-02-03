//
//  Movie.swift
//  TheMovieApp
//
//  Created by Mario Ban on 28.01.2025..
//

import SwiftUI
import SwiftData

struct MovieDTO: Decodable {
    let id: Int
    let adult: Bool
    let backdropPath: String?
    let genreIDs: [Int]?
    let genres: [Genre]?
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String?
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    private enum CodingKeys: String, CodingKey {
        case id, adult, overview, popularity, title, video, genres
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
final class Movie: Identifiable, ObservableObject {
    var id: Int
    var adult: Bool
    var backdropPath: String?
    var genreIDs: [Int]
    var originalLanguage: String
    var originalTitle: String
    var overview: String
    var popularity: Double
    var posterPath: String?
    var releaseDate: String
    var title: String
    var favorite: Bool
    var watched: Bool

    init(
        id: Int,
        adult: Bool,
        backdropPath: String? = nil,
        genreIDs: [Int] = [],
        originalLanguage: String,
        originalTitle: String,
        overview: String,
        popularity: Double,
        posterPath: String? = nil,
        releaseDate: String,
        title: String,
        favorite: Bool = false,
        watched: Bool = false
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
        self.favorite = favorite
        self.watched = watched
    }

    convenience init(dto: MovieDTO) {
        self.init(
            id: dto.id,
            adult: dto.adult,
            backdropPath: dto.backdropPath,
            genreIDs: dto.genreIDs ?? dto.genres?.map { $0.id } ?? [],
            originalLanguage: dto.originalLanguage,
            originalTitle: dto.originalTitle,
            overview: dto.overview,
            popularity: dto.popularity,
            posterPath: dto.posterPath,
            releaseDate: dto.releaseDate,
            title: dto.title
        )
    }
}

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

final class Movie: @unchecked Sendable {
    let id: Int
    let adult: Bool
    let backdropPath: String?
    let genreIDs: [Int]
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
    var favorite: Bool = false
    var watched: Bool = false

    init(dto: MovieDTO) {
        self.id = dto.id
        self.adult = dto.adult
        self.backdropPath = dto.backdropPath
        self.genreIDs = dto.genreIDs ?? dto.genres?.map { $0.id } ?? []
        self.originalLanguage = dto.originalLanguage
        self.originalTitle = dto.originalTitle
        self.overview = dto.overview
        self.popularity = dto.popularity
        self.posterPath = dto.posterPath
        self.releaseDate = dto.releaseDate
        self.title = dto.title
        self.video = dto.video
        self.voteAverage = dto.voteAverage
        self.voteCount = dto.voteCount
    }
}

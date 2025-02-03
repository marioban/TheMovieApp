//
//  MovieRepositoryTests.swift
//  TheMovieAppTests
//
//  Created by Mario Ban on 03.02.2025..
//

import XCTest
import SwiftData
@testable import TheMovieApp

class FakeModelContext: ModelContextProtocol {
    var storedMovies: [Movie] = []
    
    func fetch<T>(_ descriptor: FetchDescriptor<T>) throws -> [T] {
        if T.self == Movie.self {
            return storedMovies as! [T]
        }
        return []
    }
    
    func insert(_ object: Movie) {
        storedMovies.append(object)
    }
    
    func save() throws {
    }
}

final class MovieRepositoryTests: XCTestCase {
    var fakeContext: FakeModelContext!
    var repository: MovieRepository!
    
    override func setUp() {
        super.setUp()
        fakeContext = FakeModelContext()
        repository = MovieRepository(modelContext: fakeContext)
    }
    
    override func tearDown() {
        fakeContext = nil
        repository = nil
        super.tearDown()
    }
    
    func testSaveMovies_insertsNewMovies() {
        let movie1 = Movie(
            id: 1,
            adult: false,
            originalLanguage: "en",
            originalTitle: "Movie 1",
            overview: "Overview 1",
            popularity: 10.0,
            releaseDate: "2025-01-01",
            title: "Movie 1"
        )
        
        let movie2 = Movie(
            id: 2,
            adult: false,
            originalLanguage: "en",
            originalTitle: "Movie 2",
            overview: "Overview 2",
            popularity: 20.0,
            releaseDate: "2025-02-01",
            title: "Movie 2"
        )
        
        repository.saveMovies([movie1, movie2])
        
        XCTAssertEqual(repository.movies.count, 2)
        XCTAssertEqual(fakeContext.storedMovies.count, 2)
    }
    
    func testSaveMovies_doesNotInsertDuplicateMovies() {
        let movie1 = Movie(
            id: 1,
            adult: false,
            originalLanguage: "en",
            originalTitle: "Movie 1",
            overview: "Overview 1",
            popularity: 10.0,
            releaseDate: "2025-01-01",
            title: "Movie 1"
        )
        
        repository.saveMovies([movie1])
        repository.saveMovies([movie1])
        
        XCTAssertEqual(repository.movies.count, 1)
        XCTAssertEqual(fakeContext.storedMovies.count, 1)
    }
    
    func testToggleFavorite_updatesFavoriteStatus() {
        let movie1 = Movie(
            id: 1,
            adult: false,
            originalLanguage: "en",
            originalTitle: "Movie 1",
            overview: "Overview 1",
            popularity: 10.0,
            releaseDate: "2025-01-01",
            title: "Movie 1",
            favorite: false,
            watched: false
        )
        
        repository.saveMovies([movie1])
        repository.toggleFavorite(movie: movie1)
        XCTAssertTrue(movie1.favorite)
    }
    
    func testToggleWatched_updatesWatchedStatus() {
        let movie1 = Movie(
            id: 1,
            adult: false,
            originalLanguage: "en",
            originalTitle: "Movie 1",
            overview: "Overview 1",
            popularity: 10.0,
            releaseDate: "2025-01-01",
            title: "Movie 1",
            favorite: false,
            watched: false
        )
        
        repository.saveMovies([movie1])
        repository.toggleWatched(movie: movie1)
        XCTAssertTrue(movie1.watched)
    }
    
    func testGetMovieById_returnsCorrectMovie() {
        let movie1 = Movie(
            id: 1,
            adult: false,
            originalLanguage: "en",
            originalTitle: "Movie 1",
            overview: "Overview 1",
            popularity: 10.0,
            releaseDate: "2025-01-01",
            title: "Movie 1"
        )
        let movie2 = Movie(
            id: 2,
            adult: false,
            originalLanguage: "en",
            originalTitle: "Movie 2",
            overview: "Overview 2",
            popularity: 20.0,
            releaseDate: "2025-02-01",
            title: "Movie 2"
        )
        
        repository.saveMovies([movie1, movie2])
        let foundMovie = repository.getMovie(by: 2)
        XCTAssertNotNil(foundMovie)
        XCTAssertEqual(foundMovie?.id, 2)
    }
}

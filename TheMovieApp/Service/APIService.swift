//
//  APIService.swift
//  TheMovieApp
//
//  Created by Mario Ban on 28.01.2025..
//

import SwiftUI

enum APIError: Error, LocalizedError {
    case invalidResponse
    case requestFailed
    case decodingError
    case invalidURL

    var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return "The server returned an invalid response."
        case .requestFailed:
            return "The request failed. Please check your internet connection."
        case .decodingError:
            return "Failed to decode the data from the server."
        case .invalidURL:
            return "The provided URL is invalid."
        }
    }
}


@APIServiceActor
class APIService {
    private let baseURL = "https://api.themoviedb.org/3"
    private let authorizationHeader = "Bearer YOUR_BEARER_TOKEN"

    private func createRequest(endpoint: String, queryItems: [URLQueryItem]) throws -> URLRequest {
        guard let url = URL(string: "\(baseURL)\(endpoint)"),
              var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            throw APIError.invalidURL
        }
        components.queryItems = queryItems

        guard let finalURL = components.url else {
            throw APIError.invalidURL
        }

        var request = URLRequest(url: finalURL)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": authorizationHeader
        ]
        return request
    }

    private func fetchData<T: Decodable>(endpoint: String, queryItems: [URLQueryItem], responseType: T.Type) async throws -> T {
        let request = try createRequest(endpoint: endpoint, queryItems: queryItems)
        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw APIError.invalidResponse
        }

        return try JSONDecoder().decode(T.self, from: data)
    }

    func fetchTopRatedMovies(page: Int) async throws -> [Movie] {
        let queryItems = [
            URLQueryItem(name: "language", value: "en-US"),
            URLQueryItem(name: "page", value: "\(page)")
        ]
        let response = try await fetchData(endpoint: "/movie/top_rated", queryItems: queryItems, responseType: MovieResponse.self)
        return response.results.map { Movie(dto: $0) }
    }

    func fetchSimilarMovies(movieID: Int, page: Int = 1) async throws -> [Movie] {
        let queryItems = [
            URLQueryItem(name: "language", value: "en-US"),
            URLQueryItem(name: "page", value: "\(page)")
        ]
        let response = try await fetchData(endpoint: "/movie/\(movieID)/similar", queryItems: queryItems, responseType: MovieResponse.self)
        return response.results.map { Movie(dto: $0) }
    }

    func fetchGenres() async throws -> [Genre] {
        let queryItems = [
            URLQueryItem(name: "language", value: "en-US")
        ]
        return try await fetchData(endpoint: "/genre/movie/list", queryItems: queryItems, responseType: GenreResponse.self).genres
    }

    func fetchMovieDetails(movieID: Int) async throws -> Movie {
        let queryItems = [
            URLQueryItem(name: "language", value: "en-US")
        ]
        let movieDTO = try await fetchData(endpoint: "/movie/\(movieID)", queryItems: queryItems, responseType: MovieDTO.self)
        return Movie(dto: movieDTO)
    }
}

//
//  NetworkUtils.swift
//  Euphony
//
//  Created by Vinay Bharwani on 28/11/19.
//  Copyright © 2019 Vinay Bharwani. All rights reserved.
//

import Foundation

enum NetworkUtils {
    
    enum Mains{
        static let baseURL = "https://api.spotify.com/v1/"//URL(string: "https://api.spotify.com/v1/")
        static let accessToken = "Bearer BQA-_7y4BSOgErkiZM5EvxSZw79-n1Ui2NReqMeWkIYyQWGsFb201gcsBffbfnpbgGvjekoXihgRgUvTpPV8GJ288mS5nZ6dyqjQ69m8P0HQo_CBc3jyoxlICv_rew3DcCCITNYRca5eo69-WjfxCG8bAbsEiKnOJruV2p-iF8mx5lisUZFvrS3c0yMOAqPadIZvVvWJrA6tRN4vxhxOYaWJUKrC2c4bxXH2iZ5WS-ShWhkGjT7Fd4E40uXHSQTQB3vrxHwQtZTSm6en3LUl9A_Kd3cEsGJ6TA"
        static let contentTypeHeader = "application/json"
    }
    enum HTTPMethods{
        static let get = "GET"
    }
    enum ParamKeys{
        static let market = "market"
        static let seedArtists = "seed_artists"
        static let seedTracks = "seed_tracks"
        static let minEnergy = "min_energy"
        static let minPopularity = "min_popularity"
    }
    
    enum ParamValues{
        static let market = "US"
        static let seedArtists = "4NHQUGzhtTLFvgF5SZesLK"
        static let seedTracks = "0c6xIDDpzE81m2q797ordA"
        static let minEnergy = 0.4
        static let minPopularity = 50
    }
    enum HeaderKeys{
        static let contentType = "Content-Type"
        static let authorization = "Authorization"
    }
    enum HeaderValues{
        static let contentType = Mains.contentTypeHeader
        static let authorization = Mains.accessToken
    }
    
    enum Endpoint {
        case recommendations, topRated, upcoming, nowPlaying, trending
        case movieDetail(movie: Int), recommended(movie: Int), similar(movie: Int)
        case credits(movie: Int), review(movie: Int)
        case searchMovie, searchKeyword, searchPerson
        case popularPersons
        case personDetail(person: Int)
        case personMovieCredits(person: Int)
        case personImages(person: Int)
        case genres
        case discover
        
        func path() -> String {
            switch self {
            case .recommendations:
                return "recommendations?"
            case .popularPersons:
                return "person/popular"
            case .topRated:
                return "movie/top_rated"
            case .upcoming:
                return "movie/upcoming"
            case .nowPlaying:
                return "movie/now_playing"
            case .trending:
                return "trending/movie/day"
            case let .movieDetail(movie):
                return "movie/\(String(movie))"
            case let .personDetail(person):
                return "person/\(String(person))"
            case let .credits(movie):
                return "movie/\(String(movie))/credits"
            case let .review(movie):
                return "movie/\(String(movie))/reviews"
            case let .recommended(movie):
                return "movie/\(String(movie))/recommendations"
            case let .similar(movie):
                return "movie/\(String(movie))/similar"
            case let .personMovieCredits(person):
                return "person/\(person)/movie_credits"
            case let .personImages(person):
                return "person/\(person)/images"
            case .searchMovie:
                return "search/movie"
            case .searchKeyword:
                return "search/keyword"
            case .searchPerson:
                return "search/person"
            case .genres:
                return "genre/movie/list"
            case .discover:
                return "discover/movie"
            }
        }
    }
    
    
    enum APIError: Error {
        case noResponse
        case jsonDecodingError(error: Error)
        case networkError(error: Error)
    }
    /*
    func GET<T: Codable>(endpoint: Endpoint,
                         params: [String: String]?,
                         completionHandler: @escaping (Result<T, APIError>) -> Void) {
        let queryURL = baseURL.appendingPathComponent(endpoint.path())
        var components = URLComponents(url: queryURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [
           URLQueryItem(name: "api_key", value: apiKey),
           URLQueryItem(name: "language", value: Locale.preferredLanguages[0])
        ]
        if let params = params {
            for (_, value) in params.enumerated() {
                components.queryItems?.append(URLQueryItem(name: value.key, value: value.value))
            }
        }
        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                DispatchQueue.main.async {
                    completionHandler(.failure(.noResponse))
                }
                return
            }
            guard error == nil else {
                DispatchQueue.main.async {
                    completionHandler(.failure(.networkError(error: error!)))
                }
                return
            }
            do {
                let object = try self.decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completionHandler(.success(object))
                }
            } catch let error {
                DispatchQueue.main.async {
                    #if DEBUG
                    print("JSON Decoding Error: \(error)")
                    #endif
                    completionHandler(.failure(.jsonDecodingError(error: error)))
                }
            }
        }
        task.resume()
    }
    */
}


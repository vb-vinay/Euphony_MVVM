//
//  JSONLoader.swift
//  Euphony
//
//  Created by Vinay Bharwani on 22/11/19.
//  Copyright © 2019 Vinay Bharwani. All rights reserved.
//

import Foundation

let recommendation: Recommendation = load("albumData.json")
/// https://api.spotify.com/v1/recommendations?market=US&seed_artists=4NHQUGzhtTLFvgF5SZesLK&seed_tracks=0c6xIDDpzE81m2q797ordA&min_energy=0.4&min_popularity=50
let categories: Categories = load("categoryData.json")
/// https://api.spotify.com/v1/browse/categories
let genres: Genres = load("genresData.json")

//let catPlaylists = load("categoryWisePlaylistsData.json")
func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

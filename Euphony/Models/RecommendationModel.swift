//
//  RecommendationModel.swift
//  Euphony
//
//  Created by Vinay Bharwani on 20/11/19.
//  Copyright © 2019 Vinay Bharwani. All rights reserved.
//

import Foundation

/// The Model designed to populate Recommended Music Collections in the app

struct Recommendation: Codable{
    let id = UUID()
    var tracks: [Track]
}

struct Track: Codable{
    let album: Album
    let name: String                       // track or song name
    let preview_url : String?              // url of track
}

struct Album: Codable{
    let name: String                       // album name
    let artists: [Artist]                  // an album can have multiple artists
    let images: [Photo]                    // the album has multiple images(prefer first image only)
}

struct Artist: Codable{
    let name: String                       // artist name
}

struct Photo: Codable{
    let url: String
}

